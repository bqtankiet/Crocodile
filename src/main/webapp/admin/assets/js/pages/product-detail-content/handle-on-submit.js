$('#form-product').on('submit', handleOnSubmit);

// Xử lý trước khi submit form
function handleOnSubmit(event) {
    event.preventDefault(); // Ngừng submit form theo cách bình thường

    const product = collectProductData();

    // Gửi product data tới servlet theo định dạng JSON
    sendProductData(product);
}

function collectProductData() {
    const name = $('#product-name').val();
    const categoryId = $('#category-id').val();
    const description = $('#product-description').val();
    const price = $('#product-price').val();

    const product = new Product(name, categoryId, description, price);

    // Cập nhật các thuộc tính của sản phẩm
    updateProductImages(product);
    updateProductAttributes(product);
    updateProductOptionGroups(product);
    updateProductVariants(product);

    return product;
}

function sendProductData(product) {
    $.ajax({
        url: "#", // Thay bằng URL đúng
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(product.toJSON()),
        success: function (response) {
            document.body.innerHTML = '<pre class="text-white" style="background-color: #000000">' + JSON.stringify(response, null, 2) + '</pre>';
        },
        error: function (xhr, status, error) {
            console.error("Lỗi khi gửi sản phẩm", error);
        }
    });
}

function updateProductImages(product) {
    $('#product-images').find('input[name="image-url"]').each(function () {
        const imageUrl = $(this).val();
        if (imageUrl.trim().length > 0) {
            product.addImage(imageUrl);
        }
    });
}

function updateProductAttributes(product) {
    $('#product-attributes-card').find('.product-attribute').each(function () {
        const key = $(this).find('.attr-key').val() || $(this).find('.attr-key').text();
        const value = $(this).find('.attr-value').val();
        if (key.trim().length > 0 && value.trim().length > 0) {
            product.addAttribute(key, value);
        }
    });
}

function updateProductOptionGroups(product) {
    const $activeTab = $('#product-sale-tab-content .tab-pane.show.active');
    const tabId = $activeTab.attr('id');

    if (tabId === 'pane-product-simple') {
        product.option_groups = null;
    } else if (tabId === 'pane-product-variants') {
        product.option_groups = [];

        $('.option-group').each(function (index) {
            const groupNo = index + 1;
            const groupName = $(this).find('.option-key').val() || `Phân loại ${groupNo}`;
            const options = collectOptions($(this), groupNo);

            if (options.length > 0) {
                product.addOptionGroup(groupNo, groupName, options);
            }
        });
    }
}

function collectOptions(optionGroup, groupNo) {
    const options = [];
    const key = optionGroup.find('.option-key').val();
    optionGroup.find('.option').each(function () {
        const value = $(this).find('.option-value').val();
        const image = $(this).find('.upload-image input[name="image-url"]').val();
        if (value) {
            options.push(new ProductOption(groupNo,key,value,image));
        }
    });
    return options;
}

function updateProductVariants(product) {
    const $activeTab = $('#product-sale-tab-content .tab-pane.show.active');
    const tabId = $activeTab.attr('id');

    if (tabId === 'pane-product-simple') {
        const stock = $activeTab.find('#stock').val();
        const sku = $activeTab.find('#sku').val();
        product.variants = [];
        // product.addVariant(null, stock, sku);
        const variant = new ProductVariant(stock, sku)
        product.addVariantObj(variant);
    } else if (tabId === 'pane-product-variants') {
        product.variants = [];
        let options1 = product.option_groups[0]?.options || [];
        let options2 = product.option_groups[1]?.options || [];

        options1.forEach(o1 => {
            if (options2.length > 0) {
                options2.forEach(o2 => {
                    let stock_sku = lookupStockSku(o1.value, o2.value);
                    const pv = new ProductVariant(stock_sku.stock, stock_sku.sku, o1, o2);
                    product.addVariantObj(pv);
                    // product.addVariant([o1.value, o2.value], stock_sku.stock, stock_sku.sku);
                });
            } else {
                let stock_sku = lookupStockSku(o1.value, '');
                const pv = new ProductVariant(stock_sku.stock, stock_sku.sku, o1, null);
                product.addVariantObj(pv);
                // product.addVariant([o1.value, null], stock_sku.stock, stock_sku.sku);
            }
        });
    }
}

function lookupStockSku(option1, option2) {
    const $variantsTable = $('#variants-table');
    let result = {stock: 0, sku: ''};

    let value1 = null;
    let value2 = null;
    $variantsTable.find('tbody tr').each(function () {
        const $td1 = $(this).find('td:nth-child(1)');
        const $td2 = $(this).find('td:nth-child(2)');

        if ($td1.attr('rowspan')) {
            value1 = $td1.text().trim(); // Cập nhật lại value1
            value2 = $td2.text().trim();
        } else {
            value2 = $td1.text().trim();
        }

        if (value1 === option1 && value2 === option2) {
            result = {
                stock: $(this).find('td:nth-last-child(2) input').val(),
                sku: $(this).find('td:nth-last-child(1) input').val()
            };
            return false; // Dừng vòng lặp khi tìm thấy kết quả
        }
    });

    return result;
}

class Product {
    constructor(name, category_id, description, price, images = [], attributes = [], optionGroups = [], variants = []) {
        this.images = images;
        this.name = name;
        this.category_id = category_id;
        this.description = description;
        this.attributes = attributes;
        this.price = price;
        this.option_groups = optionGroups;
        this.variants = variants;
    }

    addImage(imageUrl) {
        this.images.push(imageUrl);
    }

    addAttribute(key, value) {
        this.attributes.push({key, value});
    }

    addOptionGroup(group_no, group_name, options) {
        this.option_groups.push({group_no, group_name, options});
    }

    addVariant(option_values, stock, sku) {
        this.variants.push({option_values, stock, sku});
    }

    addVariantObj(variant){
        this.variants.push(variant);
    }

    // Phương thức toJSON để chuyển đối tượng thành JSON
    toJSON() {
        return {
            name: this.name,
            category_id: this.category_id,
            description: this.description,
            price: this.price,
            images: this.images,
            attributes: this.attributes,
            option_groups: this.option_groups,
            variants: this.variants
        };
    }
}

class ProductVariant {
     constructor(stock=0, sku="", option1=null, option2=null) {
         this.option1 = option1;
         this.option2 = option2;
         this.stock = stock;
         this.sku = sku;
     }

     toJSON(){
         return {
             stock: this.stock,
             sku: this.sku,
             option1: this.option1,
             option2: this.option2
         }
     }
}

class ProductOption {
    constructor(group, key, value, image) {
        this.group = group;
        this.key = key;
        this.value = value;
        this.image = image;
    }

    toJSON(){
        return {
            group: this.group,
            key: this.key,
            value: this.value,
            image: this.image
        }
    }
}
