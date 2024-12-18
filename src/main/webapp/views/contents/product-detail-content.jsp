<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>

<div id="CONTENT">
    <!-------------------- Breadcrumb -------------------->
    <div class="container">
        <nav style="--bs-breadcrumb-divider: '>'">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="home.html">Trang Chủ</a></li>
                <li class="breadcrumb-item"><a href="products.html">${requestScope.product.category.name}</a></li>
                <li class="breadcrumb-item active" aria-current="page">${requestScope.product.name}</li>
            </ol>
        </nav>
        <hr>
    </div>

    <!-------------------- Thong tin san pham -------------------->
    <div class="container-xl pb-5">
        <div class="row">
            <%-- Prodct Gallery --%>
            <div class="col-6">
                <div class="col-12">
                    <div id="gallery-main" class="product_gallery_template"
                         data-owl-main='{"items": 1, "dots": false}' data-owl-thumb='{"items": 4, "margin": 10}'>
                        <%-- TODO: Hiển thị hình ảnh bìa của sản phẩm (data-hash = 0)--%>
                        <div class="item" data-hash="0">
                            <img src="${requestScope.product.image}" alt="">
                        </div>

                        <%-- TODO: Hiển thị các hình ảnh minh họa của ản phẩm (data-hash = img.id) --%>
                        <c:forEach var="img" items="${requestScope.productImages}">
                            <div class="item" data-hash=${img.id}>
                                <img src="${img.image}" alt="">
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <%-- Prodct Details --%>
            <div class="col-6 ps-4">
                <div>
                    <h1 class="fw-bold">${requestScope.product.name}</h1>
                    <div class="mt-4">
                        <span class="fs-2 me-3 custom-text-primary">
                            <fmt:formatNumber value="${requestScope.product.price}" type="currency" currencySymbol="₫"
                                              groupingUsed="true"/>
                        </span>
                        <%-- TODO--%>
                        <%-- <span class="fs-5 text-decoration-line-through text-secondary">1,500,000<sup>₫</sup></span>--%>
                    </div>
                    <div class="lh-lg mt-4 ps-4">
                        <ul>
                            <%-- TODO: Hiển thị thông tin chi tiết của sản phẩm theo key: value--%>
                            <c:forEach var="pd" items="${requestScope.productDetails}">
                                <li style="list-style-type: square">${pd.key}: ${pd.value}</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="d-grid gap-3 border-top pt-3">
                        <!--Phan loai-->
                        <div>
                            <%-- TODO: Hiển thị các option group --%>
                            <c:forEach var="og" items="${requestScope.optionGroups}">
                                <div class="d-flex gap-2 row">
                                    <p class="fw-semibold col-2 my-auto">${og.groupName}</p>
                                    <div class="col d-flex gap-2 flex-wrap pb-2">
                                            <%-- TODO: Hiển thị các options cụ thể --%>
                                        <c:forEach var="o" items="${og.options}">
                                            <input type="radio" class="btn-check" name="idOption${og.groupNo}"
                                                   id="idOption${o.id}" value="${o.id}" required
                                                   onclick="updateProductStock()">
                                            <label for="idOption${o.id}" class="btn btn-outline-dark"
                                                    <c:if test="${o.idImage != null}">
                                                        onclick=window.location.href='#${o.idImage}'
                                                    </c:if>>
                                                <c:if test="${o.image != null}">
                                                    <img src="${o.image}" alt="" class="img-fluid me-1" style="height: 2rem">
                                                </c:if>
                                                    ${o.value}
                                            </label>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!--So luong-->
                        <div class="d-flex gap-2 row">
                            <p class="fw-semibold col-2 my-auto">Số lượng</p>
                            <div class="col-3">
                                <div class="quantity-control input-group" data-min="1" data-max="200">
                                    <button type="button" class="decrement btn custom-btn-primary">-</button>
                                    <input id="user-input-quantity" type="number" name="quantity"
                                           class="quantity-input form-control text-center" aria-label="quantity">
                                    <button type="button" class="increment btn custom-btn-primary">+</button>
                                </div>
                            </div>
                            <%-- TODO: Hiển thị số lượng sản phẩm có sẵn ??? --%>
                            <p class="col my-auto" id="product-stock"></p>
                        </div>
                        <!--Submit-->
                        <form action="" id="product-form" onsubmit="handleOnSubmitProductForm()">
                            <div class="d-flex gap-2">
                                <input id="submit-idVariant" type="number" name="idVariant" value="?" hidden="hidden">
                                <input id="submit-quantity" type="number" name="quantity" value="?" hidden="hidden">
                                <button class="btn custom-btn-primary flex-grow-1 text-uppercase text-center custom-bg-primary p-3 fw-semibold"
                                        role="button" type="submit" onclick="handleSubmitBuyNow()">
                                    Đặt mua ngay
                                </button>
                                <button class="btn custom-btn-primary custom-icon px-4"
                                        data-bs-toggle="tooltip" data-bs-title="Thêm vào giỏ hàng" style="--size: 2rem"
                                        role="button" type="submit" onclick="handleSubmitAddToCart()">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-bag-plus" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                              d="M8 7.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0v-1.5H6a.5.5 0 0 1 0-1h1.5V8a.5.5 0 0 1 .5-.5"></path>
                                        <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"></path>
                                    </svg>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-------------------- Mo ta san pham-------------------->
    <div style="background-color: #ededed">
        <div class="container-xl py-5">
            <div class="row">
                <div class="col-9 mx-auto">
                    <h3 class="text-center text-uppercase mb-5 pb-2 fw-bold border-bottom">Mô tả sản phẩm</h3>
                    <div id="product_descriptions_wrapper">
                        <div id="product_descriptions"></div>
                        <div class="show-more">
                            <div class="d-flex justify-content-center">
                                <button id="show-more-btn" class="btn btn-outline-primary">Xem thêm</button>
                            </div>
                        </div>
                        <div class="show-less d-none">
                            <div class="d-flex justify-content-center">
                                <button id="show-less-btn" class="btn btn-outline-primary">Thu gọn</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-------------------- San pham tuong tu -------------------->
    <div class="container my-5">
        <div class="section-title py-2 mb-2 row">
            <h2 class="best-sale-title fw-bold text-center text-uppercase">Sản phẩm tương tự </h2>
            <hr>
        </div>
        <div class="product_gallery_template" data-owl-main='{"items": 4, "margin": 10, "dots": false}'>
            <a class="product_card_template"
               href="https://www.gento.vn/wp-content/uploads/2021/10/vi-cam-tay-da-ca-sau-gs9825.jpeg"
               data-json='{
                                "img": "https://www.gento.vn/wp-content/uploads/2021/10/vi-cam-tay-da-ca-sau-gs9825.jpeg",
                                "name": "Ví cầm tay da cá sấu cao cấp GS982 Nâu",
                                "price": "1.300.000",
                                "basePrice": "1.900.000",
                                "discount": "Giảm 32%",
                                "badge": "NEW"
                                }'>
            </a>
            <a class="product_card_template" href="404"
               data-json='{
                                "img":"https://casauhoanglong.com/wp-content/uploads/2024/01/Bop-da-ca-sau-nam-2-mat-da-bung-VN70HM.jpeg",
                                "name":"Ví cầm tay nam da cá sấu cao cấp Gento GS985",
                                "price":"1.100.000",
                                "basePrice":null,
                                "discount":null,
                                "badge":null
                                }'>
            </a>
            <a class="product_card_template"
               href="https://www.gento.vn/wp-content/uploads/2021/10/vi-cam-tay-da-ca-sau-gs9825.jpeg"
               data-json='{
                                "img": "https://www.gento.vn/wp-content/uploads/2021/10/vi-cam-tay-da-ca-sau-gs9825.jpeg",
                                "name": "Ví cầm tay da cá sấu cao cấp GS982 Nâu",
                                "price": "1.300.000",
                                "basePrice": "1.900.000",
                                "discount": "Giảm 32%",
                                "badge": "NEW"
                                }'>
            </a>
            <a class="product_card_template" href="404"
               data-json='{
                                "img":"https://casauhoanglong.com/wp-content/uploads/2024/01/Bop-da-ca-sau-nam-2-mat-da-bung-VN70HM.jpeg",
                                "name":"Ví cầm tay nam da cá sấu cao cấp Gento GS985",
                                "price":"1.100.000",
                                "basePrice":null,
                                "discount":null,
                                "badge":null
                                }'>
            </a>
        </div>
    </div>

    <script>
        const productVariants = JSON.parse('${requestScope.productVariantsJson}');

        if (productVariants.length === 1) {
            updateProductStock()
        }
        // console.log(productVariants)

        function updateProductStock() {
            let idOption1 = parseInt($('input[type=radio][name=idOption1]:checked').val() || 0);
            let idOption2 = parseInt($('input[type=radio][name=idOption2]:checked').val() || 0);

            const $productStock = $('#product-stock');

            const matchedVariant = productVariants.find(
                pv => pv.idOption1 === idOption1 && pv.idOption2 === idOption2
            );

            // console.log(matchedVariant)

            if (matchedVariant) {
                $productStock.text(matchedVariant.stock + " sản phẩm có sẵn");
            } else {
                $productStock.text("");
            }
        }

        function handleOnSubmitProductForm() {
            let idOption1 = parseInt($('input[type=radio][name=idOption1]:checked').val() || 0);
            let idOption2 = parseInt($('input[type=radio][name=idOption2]:checked').val() || 0);
            const matchedVariant = productVariants.find(
                pv => pv.idOption1 === idOption1 && pv.idOption2 === idOption2
            );


            const quantity = $('#user-input-quantity').val();
            const idVariant = matchedVariant.id;

            const $form = $('#product-form');
            $('#submit-idVariant').val(idVariant);
            $('#submit-quantity').val(quantity);
        }

        function handleSubmitBuyNow() {
            const $form = $('#product-form');
            $form.attr('method', 'GET');
            $form.attr('action', '/payment-detail');
            $form.submit();
        }

        function handleSubmitAddToCart() {
            const $form = $('#product-form');
            $form.attr('method', 'GET');
            $form.attr('action', '/add-to-cart');
            $form.submit();
        }

    </script>
</div>
