function importCSS(link) {
    $('head').append(`<link rel="stylesheet" type="text/css" href=${link}>`);
};

$(document).ready(function () {
    const linkCSS = "/components/product_card/product_card.css";
    const linkHTML = "/components/product_card/product_card.html";
    importCSS(linkCSS);

    const $card_templates = $('.product_card_template');
    $card_templates.each(function () {
        const $card_template = $(this);
        $card_template.load(linkHTML, function (response, status) {
            if (status === "success") {
                const data = $card_template.data('json');

                // product_img
                $card_template.find('.product_img').attr('src', data["img"] || null);
                // product_name
                $card_template.find('.product_name').text(data["name"] || null);
                // product_price
                $card_template.find('.product_price').text(data["price"] || null);
                // product_base_price
                $card_template.find('.product_base_price').text(data["basePrice"] || null);
                // product_discount
                if (data["discount"]) {
                    $card_template.find('.product_discount').text(data["discount"] || null);
                } else {
                    $card_template.find('.product_discount').parent().remove();
                }
                // product_badge
                $card_template.find('.product_badge').text(data["badge"] || null);
                // product_target
                $card_template.find('.product_target').attr('src', data["target"] || null);
            }
        });
    });
});