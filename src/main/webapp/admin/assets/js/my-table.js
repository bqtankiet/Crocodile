// Xử lý checkbox "Chọn tất cả"
$('table.my-table #selectAll').on('change', function () {
    if(this.checked){
        $('.rowCheckbox').prop('checked', true).closest('tr').addClass('checked');
    } else {
        $('.rowCheckbox').prop('checked', false).closest('tr').removeClass('checked');
    }
});

// Nếu bỏ chọn bất kỳ checkbox nào, bỏ chọn "Chọn tất cả"
$('table.my-table .rowCheckbox').on('change', function () {
    $(this).closest('tr').toggleClass('checked');
    if (!this.checked) {
        $('#selectAll').prop('checked', false);
    }
});