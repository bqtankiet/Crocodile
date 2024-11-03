$(document).ready(function () {
    // Khởi tạo carousel cho hình ảnh lớn
    var mainCarousel = $('.main-carousel').owlCarousel({
        items: 1,
        // nav: true,
        dots: false,
        smartSpeed: 500
    });

    // Khởi tạo carousel cho thumbnail
    var thumbnailCarousel = $('.thumbnail-carousel').owlCarousel({
        items: 4,
        margin: 10,
        dots: false,
    });

    // Sự kiện khi nhấp vào thumbnail để đồng bộ với main-carousel
    $('.thumbnail-carousel .item').click(function () {
        var index = $(this).parent().index(); // Lấy chỉ số của thumbnail
        mainCarousel.trigger('to.owl.carousel', [index, 500]); // Chuyển main-carousel đến ảnh tương ứng
    });

    // Đồng bộ thumbnail khi main-carousel thay đổi
    mainCarousel.on('changed.owl.carousel', function (event) {
        var currentIndex = event.item.index;

        // Đánh dấu ảnh thumbnail tương ứng
        thumbnailCarousel.find(".owl-item").removeClass("current-thumbnail");
        thumbnailCarousel.find(".owl-item").eq(currentIndex).addClass("current-thumbnail");

        // Cuộn thumbnail-carousel đến item tương ứng
        thumbnailCarousel.trigger('to.owl.carousel', [currentIndex, 500, true]);
    });

    $('.owl-prev').click(function () {
        $('.owl-carousel').trigger('prev.owl.carousel');
    });

    $('.owl-next').click(function () {
        $('.owl-carousel').trigger('next.owl.carousel');
    });
});