$('.upload-image').on('click', function (){
    handlePopupCkfinder($(this));
});

// Xử lý khi chọn hình ảnh trong ckfinder -> cập nhật lại ảnh preview, input
function handlePopupCkfinder($element) {
    const startupPath = 'Images:/products';
    const callback = (url) => {
        $element.find('img').attr('src', url);
        $element.find('input').attr('value', url);
        $element.find('.add-img-icon').remove();
    };
    popupCkfinder(startupPath, callback);
}

