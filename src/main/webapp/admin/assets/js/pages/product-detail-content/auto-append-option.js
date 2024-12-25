$(document).ready(function() {
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
});

function getOptionHtmlTemplate(withImage) {
    let html;
    if (withImage) {
        html = `
                    <div class="[ option ] d-flex align-items-center w-100 gap-2">
                        <input class="[ option-value ] form-control" type="text" aria-label="" name="option-value" placeholder="Nhập phân loại">
                        <div class="[ upload-image ]" onclick="handlePopupCkfinder(this)">
                            <input class="form-control d-none" type="text" name="image-url" aria-label=""/>
                            <div class="cursor-pointer">
                                <div class="position-relative">
                                    <span class="[ add-img-icon ] fs-1 position-absolute translate-middle top-50 start-50">+</span>
                                    <img src="" alt="" class="[ preview ] d-block" style="width: 2rem; height: 2rem; object-fit: cover">
                                </div>
                            </div>
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
