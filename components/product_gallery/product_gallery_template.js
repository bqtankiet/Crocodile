const linkCSS = "/components/product_gallery/product_gallery.css";
const linkHTML = "/components/product_gallery/product_gallery.html";
$('head').append(`<link rel="stylesheet" type="text/css" href=${linkCSS}>`);

$(document).ready(function () {
    const $templates = $('.product_gallery_template');
    $templates.each(function () {
        const $template = $(this);
        const items = $template.html();
        $template.load(linkHTML, function () {
            const thumbnailItems = $template.data('thumbnail-items');
            const mainItems = $template.data('main-items');

            if (mainItems > 0) {
                $template.find(".main-carousel").html(items);
            }
            if (thumbnailItems > 0) {
                $template.find(".thumbnail-carousel").removeClass("d-none");
                $template.find(".thumbnail-carousel").html(items);
            }

            initOwlCarousel(mainItems, thumbnailItems);
        });
    });
});

function initOwlCarousel(mainItems = 1, thumbnailItems = 4) {
    // Khởi tạo carousel cho hình ảnh lớn
    var mainCarousel = $('.main-carousel').owlCarousel({
        items: mainItems,
        // nav: true,
        dots: false,
        smartSpeed: 500,
        URLhashListener: true,
        hash: true
    });

    // Khởi tạo carousel cho thumbnail
    var thumbnailCarousel = $('.thumbnail-carousel').owlCarousel({
        items: thumbnailItems,
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
}
