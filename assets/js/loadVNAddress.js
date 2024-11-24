let data = [];

// Hàm load dữ liệu Tỉnh/Thành phố vào #cityList
function loadCities() {
    const $cityList = $("#cityList");
    data.forEach(city => {
        $cityList.append(`<option value="${city.FullName}"></option>`);
    });
}

// Hàm load Quận/Huyện vào #districtList khi chọn Tỉnh/Thành phố
function loadDistricts(cityName) {
    const $districtList = $("#districtList");
    $districtList.empty(); // Xóa các option hiện tại

    const city = data.find(city => city.FullName === cityName);
    if (city) {
        city.District.forEach(district => {
            $districtList.append(`<option value="${district.FullName}"></option>`);
        });
    }
}

// Hàm load Phường/Xã vào #wardList khi chọn Quận/Huyện
function loadWards(districtName, cityName) {
    const $wardList = $("#wardList");
    $wardList.empty(); // Xóa các option hiện tại

    const city = data.find(city => city.FullName === cityName);
    if (city) {
        const district = city.District.find(district => district.FullName === districtName);
        if (district) {
            district.Ward.forEach(ward => {
                $wardList.append(`<option value="${ward.FullName}"></option>`);
            });
        }
    }
}

// Gọi hàm load Tỉnh/Thành phố khi trang tải
$(document).ready(function () {
    $.getJSON('/assets/js/addressData.json', function (jsonData) {
        data = jsonData; // Lưu dữ liệu vào biến `data`
        loadCities(); // Load danh sách Tỉnh/Thành phố
    });

    // Sự kiện khi thay đổi Tỉnh/Thành phố
    $("#city").on("input", function () {
        loadDistricts($(this).val());
        $("#district").val("");
        $("#ward").val("");
    });

    // Sự kiện khi thay đổi Quận/Huyện
    $("#district").on("input", function () {
        loadWards($(this).val(), $("#city").val());
        $("#ward").val("");
    });
});
