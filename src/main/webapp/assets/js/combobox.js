document.querySelectorAll('.combo-box').forEach(function (combobox) {
    const input = combobox.querySelector('input');
    const datalist = combobox.querySelector('datalist');

    // !Important
    input.autocomplete = "off";
    input.list = "";

    // hiển datalist khi focus vào input
    input.onfocus = function () {
        datalist.style.display = "block";
    }

    // ẩn datalist khi blur khỏi input
    input.onblur = function () {
        datalist.style.display = "none";
    };

    // ẩn hiện các gợi ý
    input.oninput = function () {
        // currentFocus = -1;
        let text = input.value.toUpperCase();
        let hasSuggestions = false;
        for (let option of datalist.options) {
            if (option.value.toUpperCase().indexOf(text) > -1) {
                hasSuggestions = true;
                option.style.display = "block";
            } else {
                option.style.display = "none";
            }
        }
        if (!hasSuggestions) {
            datalist.style.display = "none";
        } else {
            datalist.style.display = "block";
        }
    };


    // khi nhấn vào option -> cập nhật input value + ẩn datalist
    for (let option of datalist.options) {
        option.onmousedown = function (event) {
            event.preventDefault();
            input.value = option.value;
            datalist.style.display = "none";
        }
    }

    // Xử lý sự kiện ArrowUp, ArrowDown, Enter (Vẫn đang bị lỗi khi gợi ý)
    // let currentFocus = -1;
    // input.onkeydown = function (e) {
    //     if (e.key === 'ArrowDown') {
    //         currentFocus++
    //         addActive(datalist.options);
    //     } else if (e.key === 'ArrowUp') {
    //         currentFocus--;
    //         addActive(datalist.options);
    //     } else if (e.key === 'Enter') {
    //         e.preventDefault();
    //         if (currentFocus > -1) {
    //             if (datalist.options) datalist.options[currentFocus].click();
    //         }
    //     }
    // }
    //
    // function addActive(x) {
    //     if (!x) return false;
    //     removeActive(x);
    //     if (currentFocus >= x.length) currentFocus = 0;
    //     if (currentFocus < 0) currentFocus = (x.length - 1);
    //     x[currentFocus].classList.add("active");
    // }
    //
    // function removeActive(x) {
    //     for (let i = 0; i < x.length; i++) {
    //         x[i].classList.remove("active");
    //     }
    // }

});