// Cập nhật variants-table khi có thay đổi
$('#option-group-type1, #option-group-type2').on('change', function () {
    const optionGroup1 = createOptionGroupObject($('#option-group-type1'));
    const optionGroup2 = createOptionGroupObject($('#option-group-type2'));

    variantsTable($('#variants-table'), optionGroup1, optionGroup2);
});


// Hàm cập nhật hiển thị variants-table
function variantsTable($table, optionGroup1, optionGroup2) {

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

