export function loadTopSaleProducts(){
    // Hàm dùng chung để gọi API và render
    function loadTopSaleProducts(period) {
        $.ajax({
            url: topSaleProductsUrl + period,
            method: "GET",
            success: function (data) {
                $('#topSaleProductsContainer').html(data);
            },
            error: function (err) {
                console.log(err);
            }
        });
    }

// Load mặc định lúc vào trang (lastweek)
    loadTopSaleProducts('/lastweek');

// Gắn sự kiện thay đổi select
    document.getElementById('timeFilter').addEventListener('change', function () {
        let selectedValue = this.value;

        if (selectedValue === '1week') {
            loadTopSaleProducts('/lastweek');
        } else if (selectedValue === '1month') {
            loadTopSaleProducts('/lastmonth');
        } else if (selectedValue === '1year') {
            loadTopSaleProducts('/lastyear');
        }
    });
}