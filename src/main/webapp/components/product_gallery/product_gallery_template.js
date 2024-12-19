const linkHTML = "/crocodile/components/product_gallery/product_gallery.html";
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
                const $thumbnailCarousel = $template.find('.thumbnail-carousel');
                $thumbnailCarousel.removeClass("d-none");
                $thumbnailCarousel.html(items);
                $thumbnailCarousel.find('.item').removeAttr('data-hash');
            }

            createOwlCarousel($template, owlMain, owlThumbnail);
        });
    });
});

function createOwlCarousel($template, owlMain, owlThumbnail) {
    // Khởi tạo carousel cho hình ảnh lớn
    const mainCarousel = $template.find('.main-carousel').owlCarousel(owlMain);

    // Khởi tạo carousel cho thumbnail
    const thumbnailCarousel = $template.find('.thumbnail-carousel').owlCarousel(owlThumbnail);

    // Sự kiện khi nhấp vào thumbnail để đồng bộ với main-carousel
    thumbnailCarousel.on('click', '.owl-item', function () {
        let index = $(this).index();
        mainCarousel.trigger('to.owl.carousel', [index, 500]); // Chuyển main-carousel đến ảnh tương ứng
        console.log('thumbnail on click - item index:', index);
    });

    // Đồng bộ thumbnail khi main-carousel thay đổi
    mainCarousel.on('changed.owl.carousel', function (event) {
        let currentIndex = event.item.index;
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
