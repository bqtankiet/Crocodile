$('#option-group').on('change', '.option .option-value', function () {
    const $optionContainer = $('#option-container');
    const $currentOption = $(this).closest('.option');
    if ($optionContainer.children().length > 1) {
        if($(this).val().trim() === ''){
            $currentOption.remove();
            return;
        }
    }
    if ($currentOption.is(':last-child')) {
        const n = $optionContainer.children().length + 1;
        const newOptionDiv = createOptionDiv(n);
        $optionContainer.append(newOptionDiv);
    }
});

function createOptionDiv(n){
    const $optionDiv = $('<div class="[ option ] d-flex align-items-center w-25"></div>');
    $optionDiv.html(`
                    <div class="[ upload-image ] me-2 d-flex">
                        <input class="option-img form-control d-none" type="file"
                               accept="image/jpeg, image/jpg, image/png"
                               id="uploadOptionImg${n}" name="optionImg${n}"/>
                        <label for="uploadOptionImg${n}" class="cursor-pointer">
                            <span class="position-relative">
                                <img src="" alt="" class="[ preview ] d-block" style="width: 2rem; height: 2rem; object-fit: cover">
                                <span class="[ add-img-icon ] fs-2 position-absolute translate-middle top-50 start-50">+</span>
                            </span>
                        </label>
                    </div>
                    <input type="text" aria-label="" name="option${n}" placeholder="Nhập phân loại" class="option-value form-control">`);
    return $optionDiv;
}