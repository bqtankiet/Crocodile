$(document).ready(function() {
    $(".quantity-control").each(function() {
        const $control = $(this);
        const $input = $control.find(".quantity-input");
        const min = parseInt($control.data("min")) || 0;
        const max = parseInt($control.data("max")) || 100;

        // Khởi tạo giá trị ban đầu
        $input.val(min);

        // Sự kiện khi nhập số vào input
        $input.on("input", function() {
            let value = parseInt($input.val()) || 0;
            if (value < min) {
                $input.val(min);
            } else if (value > max) {
                $input.val(max);
            }
        });

        // Sự kiện khi nhấn nút tăng
        $control.find(".increment").on("click", function() {
            let currentValue = parseInt($input.val()) || 0;
            if (currentValue < max) {
                $input.val(currentValue + 1);
            }
        });

        // Sự kiện khi nhấn nút giảm
        $control.find(".decrement").on("click", function() {
            let currentValue = parseInt($input.val()) || 0;
            if (currentValue > min) {
                $input.val(currentValue - 1);
            }
        });
    });
});