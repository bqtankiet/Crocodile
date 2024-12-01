$(document).ready(function () {
    const $editBtn = $('.dropdown-menu a:contains("Chỉnh sửa")');

    $editBtn.on('click', function (e) {
        e.preventDefault();
        const row = $(this).closest('tr');

        // Tên sản phẩm
        const $prodName = row.find('.product-name');
        const currentName = $prodName.text();
        $prodName.html(
            `<input type="text" 
                class="form-control border-0 shadow-none" 
                id="edit-prod-name" value="${currentName}">`
        );
        const editProdName = $('#edit-prod-name');

        // Loại danh mục
        const $cateName = row.find('.category-name');
        const currentCateName = $cateName.text();
        const $cateSelectBox = row.find('.category-dropdown');
        $cateName.toggleClass('d-none');
        $cateSelectBox.toggleClass('d-none');

        let editCateName = currentCateName;
        $cateSelectBox.off('change').change(function () {
            editCateName = $(this).find("option:selected").text();
        });

        // Giá tiền
        const $prodPrice = row.find('.product-price');
        const currentPrice = $prodPrice.text();
        $prodPrice.html(
            `<input type="text" 
                class="form-control border-0 shadow-none" 
                id="edit-prod-price" value="${currentPrice}">`
        );
        const $editPrice = $('#edit-prod-price');

        // Kho
        const $prodQuantity = row.find('.product-quantity');
        const currentQuantity = $prodQuantity.text();
        $prodQuantity.html(
            `<input type="text" 
                class="form-control border-0 shadow-none" 
                id="edit-prod-quantity" value="${currentQuantity}">`
        );
        const $editQuantity = $('#edit-prod-quantity');

        // Trạng thái hiển thị
        const $status = row.find('.status');
        const currentStatus = $status.text();
        const $statusSelectBox = row.find('.status-dropdown');
        $status.toggleClass('d-none');
        $statusSelectBox.toggleClass('d-none');

        let statusValue = currentStatus;
        $statusSelectBox.off('change').change(function () {
            statusValue = $(this).find("option:selected").text();
        });

        // Tác vụ
        const $optionBox = row.find('.option-box');
        $optionBox.toggleClass('d-none');

        const $btnBox = row.find('.btn-box');
        $btnBox.toggleClass('d-none');

        // Lưu 
        const $save = row.find('.btn-success');
        $save.off('click').on('click', function () {
            // ẩn hiện danh mục
            $cateName.toggleClass('d-none');
            $cateSelectBox.toggleClass('d-none');
            // ẩn hiện trạng thái
            $status.toggleClass('d-none');
            $statusSelectBox.toggleClass('d-none');
            // ẩn hiện tác vụ
            $optionBox.toggleClass('d-none');
            $btnBox.toggleClass('d-none');

            $prodName.text(editProdName.val());
            $cateName.text(editCateName);
            $prodPrice.text($editPrice.val());
            $prodQuantity.text($editQuantity.val());
            $status.text(statusValue);
        });

        // Hủy
        const $cancel = row.find('.btn-danger');
        $cancel.off('click').on('click', function () {
            if (confirm("Bạn có chắc chắn muốn bỏ chỉnh sửa này không?")) {
                // ẩn hiện danh mục
                $cateName.toggleClass('d-none');
                $cateSelectBox.toggleClass('d-none');
                // ẩn hiện trạng thái
                $status.toggleClass('d-none');
                $statusSelectBox.toggleClass('d-none');
                // ẩn hiện tác vụ
                $optionBox.toggleClass('d-none');
                $btnBox.toggleClass('d-none');

                $prodName.text(currentName);
                $cateName.text(currentCateName);
                $prodPrice.text(currentPrice);
                $prodQuantity.text(currentQuantity);
                $status.text(currentStatus);
            }
        });
    });

    // Xóa
    const $delBtn = $('.dropdown-menu a:contains("Xóa")');
    $delBtn.on('click', function (e) {
        e.preventDefault();
        const row = $(this).closest('tr');
        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?")) {
            row.remove();
        }
    });
});
