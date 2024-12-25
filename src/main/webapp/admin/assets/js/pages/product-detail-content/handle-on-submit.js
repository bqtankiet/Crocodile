$('#form-product').on('submit', handleOnSubmit)

// Xử lý trước khi submit form
function handleOnSubmit(event){
    event.preventDefault();
    const $detailsCard = $('#product-detail-card');
    const $attributesCard = $('');
    const $saleInfoCard = $('');

    const productName = $('#product-name').val();
    const productImages = getAllImageUrlInside($detailsCard);

    const productData = {
        name: productName,
        images: productImages
    };

    $.ajax({
        url: "#",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(productData),
        success: function(response){/* chưa xử lý */},
        error: function(xhr, status, error){/* chưa xử lý */}
    });
}

function getAllImageUrlInside($element){
    const urls = [];
    $element.find('input[name="image-url"]').each(function(){
        const url = $(this).val();
        if(url.trim().length > 0){
            urls.push(url);
        }
    });
    return urls;
}