// Xử lý button xóa product-detail-custom
$('#product-detail-container').on('click', '.product-detail-delete', function () {
    $(this).closest('.product-attribute').remove();
});

// Xử lý button thêm product-detail-custom
$('#product-detail-add').click(function () {
    $('#product-detail-container').append(`
        <div class="[ product-attribute ] row mb-3">
            <input type="text" class="[ attr-key ] col-md-2 col-form-label text-end border-0 border-bottom"/>
            <div class="col">
                <input class="[ attr-value ] form-control" type="text" aria-label=""/>
            </div>
            <button class="col-1 btn btn-danger product-detail-delete">Xóa</button>
        </div>`
    );
});
