$(document).ready(function () {
    const $card_templates = $('.product_card_template');
    $card_templates.each(function () {
        const $card_template = $(this);
        const data = $card_template.data('json');

        $card_template.html(getTemplateHtml());

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

    });
});

function getTemplateHtml(){
    return `
<div class="card product-card rounded-0 p-0 position-relative">
    <div class="discount d-flex position-absolute end-0 z-1 m-2" style="--height: 1.5rem;">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="-0.5 -0.5 4 16"
             style="height: var(--height); margin-right: -1px">
            <path d="M4 0h-3q-1 0 -1 1a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3q0 1 1 1h3"
                  stroke="#F69113"
                  fill="#F69113">
            </path>
        </svg>
        <span class="[ product_discount ] text-white px-1"
              style="background-color: #F69113;">Giảm 27%</span>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="-0.5 -0.5 4 16"
             style="height: var(--height); transform: rotate(180deg); margin-left: -1px">
            <path d="M4 0h-3q-1 0 -1 1a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3q0 1 1 1h3"
                  stroke="#F69113"
                  fill="#F69113">
            </path>
        </svg>
    </div>
    <div class="ratio ratio-1x1 overflow-hidden">
        <img src="https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-3.jpg"
             class="[ product_img ] card-img-top rounded-0 bg-secondary" draggable="false" alt="product image"
             style="object-fit: cover">
    </div>
    <div class="card-body pt-1 d-flex flex-column">
        <div class="card-title line-clamp-2 mb-0">
            <span class="[ product_badge ] badge text-bg-success">NEW</span>
            <span class="[ product_name ]"> Ví gấp nam da cá sấu V7068</span>
        </div>
        <div class="d-flex gap-1 custom-text-primary mt-2">
            <span><span class="[ product_price ] fs-5">1.100.000</span><sup class="[ vnd-currency ] fs-6">₫</sup></span>
            <span class="text-secondary text-decoration-line-through ms-2"><span class="[ product_base_price ]">1.500.000</span></span>
        </div>
    </div>
</div>
    `;
}