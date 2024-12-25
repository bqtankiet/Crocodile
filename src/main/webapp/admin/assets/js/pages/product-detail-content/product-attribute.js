// Xử lý button xóa product-detail-custom
$('#product-detail-container').on('click', '.product-detail-delete', function () {
    $(this).closest('.product-detail-custom').remove();
});

// Xử lý button thêm product-detail-custom
$('#product-detail-add').click(function () {
    $('#product-detail-container').append(`
        <div class="mb-3 row product-detail-custom">
            <input type="text" class="col-md-2 col-form-label text-end border-0 border-bottom"aria-label=""/>
            <div class="col">
                <input class="form-control" type="text" id="???" name="???"/>
            </div>
            <button class="col-1 btn btn-danger product-detail-delete">Xóa</button>
        </div>`
    );
});
