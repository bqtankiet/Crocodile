$(document).ready(function () {
    // Xử lý button xóa product-detail-custom
    $('#product-detail-container').on('click', '.product-detail-delete', function () {
        $(this).closest('.product-detail-custom').remove();
    });

    // Xử lý button thêm product-detail-custom
    $('#product-detail-add').click(function () {
        $('#product-detail-container').append(`
                <div class="mb-3 row product-detail-custom">
                    <input type="text" class="col-md-2 col-form-label text-end border-0 border-bottom"
                           aria-label=""/>
                    <div class="col">
                        <input class="form-control" type="text" id="???" name="???"/>
                    </div>
                    <button class="col-1 btn btn-danger product-detail-delete">Xóa</button>
                </div>`
        );
    });

    // Xử lý cập nhật ảnh preview khi thay đổi file
    $('.upload-image input[type="file"]').on('change', function () {
        let filePath = $(this).val();
        console.log(filePath);
        $(this).closest('.upload-image').find('.upload-image-preview').attr('src', filePath);
        $(this).closest('.upload-image').find('.add-img-icon').remove();
    });

    // Xử lý cập nhật option khi thay đổi nội dung
    $('.options-container').on('change', '.option .option-value', function () {
        const $optionContainer = $(this).closest('.options-container');
        const $currentOption = $(this).closest('.option');

        // Nếu nội dung rỗng và không phải phần tử duy nhất -> xóa option
        if ($optionContainer.children().length > 1) {
            if ($(this).val().trim() === '') {
                $currentOption.remove();
                return;
            }
        }

        // Nếu nội dung thay đổi và là phần tử cuối cùng -> thêm option
        if ($currentOption.is(':last-child')) {
            let withImage = $currentOption.find('.upload-image').length > 0;
            $optionContainer.append(getOptionHtmlTemplate(withImage));
        }
    });

    // Cập nhật variants-table khi có thay đổi
    $('#option-group-type1, #option-group-type2').on('change', function () {
        const optionGroup1 = createOptionGroupObject($('#option-group-type1'));
        const optionGroup2 = createOptionGroupObject($('#option-group-type2'));

        console.log("type1", optionGroup1); //Test
        console.log("type2", optionGroup2); //Test

        updateVariantsTable($('#variants-table'), optionGroup1, optionGroup2);
    });
});

// Hàm trả về template HTML cho phần tử option
function getOptionHtmlTemplate(withImage) {
    let html;
    if (withImage) {
        html = `
                    <div class="[ option ] d-flex align-items-center w-100">
                        <input class="[ option-value ] form-control" type="text" aria-label="" name="option-value" placeholder="Nhập phân loại">
                        <div class="[ upload-image ] ms-2 d-flex">
                            <input class="option-img form-control d-none " type="file" accept="image/jpeg, image/jpg, image/png" name=""/>
                            <label class="cursor-pointer">
                                <span class="position-relative">
                                    <img src="" alt="" class="[ upload-image-preview ] d-block" style="width: 2rem; height: 2rem; object-fit: cover">
                                    <span class="[ add-img-icon ] fs-2 position-absolute translate-middle top-50 start-50">+</span>
                                </span>
                              </label>
                        </div>
                    </div>
                `;
    } else {
        html = `
                    <div class="[ option ] d-flex align-items-center w-100">
                        <input class="[ option-value ] form-control" type="text" aria-label="" name="option-value" placeholder="Nhập phân loại">
                    </div>
                `;
    }
    return html;
}

// Hàm cập nhật hiển thị variants-table
function updateVariantsTable($table, optionGroup1, optionGroup2) {

    //-----------------Cập nhật tiêu đề bảng------------------//
    const key1 = optionGroup1.key || "Phân loại 1";
    const key2 = optionGroup2.key || "Phân loại 2";
    const $tableHead = $table.find('thead');
    $tableHead.find('th:nth-child(1)').text(key1);
    $tableHead.find('th:nth-child(2)').text(key2);

    //----------------Cập nhật nội dung bảng---------------------//
    const $tableBody = $table.find('tbody');
    const values1 = optionGroup1.values || [];
    const values2 = optionGroup2.values || [];

    // Nếu không có dữ liệu, hiển thị thông báo
    if (values1.length === 0) {
        $tableBody.html(`<tr><td colspan="99">Chưa có dữ liệu hoặc dữ liệu không hợp lệ</td></tr>`);
        return;
    }

    // Hàm tạo dòng dữ liệu
    const createRow = (v1, v2, rowspan = 1, isFirstRow = false) => {
        const row = $('<tr></tr>');
        if (isFirstRow) row.append('<td rowspan="' + rowspan + '">' + v1 + '</td>');
        row.append('<td>' + v2 + '</td>');
        row.append('<td><input type="number" class="form-control" aria-label=""></td>');
        row.append('<td><input type="number" class="form-control" aria-label=""></td>');
        return row;
    };

    // Xóa dữ liệu cũ
    $tableBody.empty();

    // Tạo dữ liệu mới
    values1.forEach(v1 => {
        if (values2.length === 0) {
            $tableBody.append(createRow(v1, '', 1, true));
        } else {
            values2.forEach((v2, index) => {
                const isFirstRow = index === 0;
                $tableBody.append(createRow(v1, v2, values2.length, isFirstRow));
            });
        }
    });
}

// Hàm tạo object optionGroup
function createOptionGroupObject($optionGroup) {
    let optionGroupObject = {};
    const key = $optionGroup.find('input[name = "option-key"]:first').val();
    const values = [];
    $optionGroup.find('input[name = "option-value"]').each(function () {
        const value = $(this).val();
        if (value) values.push(value);
    });

    optionGroupObject.key = key || null;
    optionGroupObject.values = values;

    return optionGroupObject;
}
