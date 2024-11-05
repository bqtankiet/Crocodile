const linkCSS = "/components/product_gallery/product_gallery.css";
const linkHTML = "/components/product_gallery/product_gallery.html";
$('head').append(`<link rel="stylesheet" type="text/css" href=${linkCSS}>`);

$(document).ready(function () {
    const $templates = $('.product_gallery_template');
    $templates.each(function () {
        const $template = $(this);
        const items = $template.html();
        $template.load(linkHTML, function () {
            const owlMain = $template.data('owl-main');
            const owlThumbnail = $template.data('owl-thumb');

            if (owlMain) {
                $template.find(".main-carousel").html(items);
            }
            if (owlThumbnail) {
                $template.find(".thumbnail-carousel").removeClass("d-none");
                $template.find(".thumbnail-carousel").html(items);
            }

            createOwlCarousel($template, owlMain, owlThumbnail);
        });
    });
});

function createOwlCarousel($template, owlMain, owlThumbnail){
    // Khởi tạo carousel cho hình ảnh lớn
    const mainCarousel = $template.find('.main-carousel').owlCarousel(owlMain);

    // Khởi tạo carousel cho thumbnail
    const thumbnailCarousel = $template.find('.thumbnail-carousel').owlCarousel(owlThumbnail);

    // Sự kiện khi nhấp vào thumbnail để đồng bộ với main-carousel
    thumbnailCarousel.find('.item').click(function () {
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

    $template.find('.owl-prev').click(function () {
        mainCarousel.trigger('prev.owl.carousel');
    });

    $template.find('.owl-next').click(function () {
        mainCarousel.trigger('next.owl.carousel');
    });
}
