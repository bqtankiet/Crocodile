<%@ page import="vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>

<c:url var="url_home" value="<%= UrlProperties.home()%>"/>
<c:url var="urlCart" value="<%=UrlProperties.cart()%>"/>

<c:url var="urlAddToCart" value="<%=UrlProperties.addToCart()%>"/>
<c:url var="url_categoryId" value="<%= UrlProperties.productList()%>">
    <c:param name="idCate" value="${requestScope.product.category.id}"/>
</c:url>

<div id="CONTENT">
    <div id="liveAlertPlaceholder" class="fixed-top"></div>
    <script>
        const alertPlaceholder = document.getElementById('liveAlertPlaceholder')

        // Hàm để thêm alert
        const appendAlert = (message, type) => {
            const wrapper = document.createElement('div')
            wrapper.innerHTML = [
                `<div class="alert alert-` + type + ` alert-dismissible" role="alert">`,
                `   <div class="text-center fw-semibold">` + message + `</div>`,
                '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
                '</div>'
            ].join('')

            alertPlaceholder.append(wrapper)

            // Tự động ẩn alert sau 5 giây
            setTimeout(() => {
                wrapper.remove()  // Loại bỏ alert sau 5 giây
            }, 5000)  // 5000ms = 5s
        }

        const liveMessage = sessionStorage.getItem('liveMessage');
        const messageType = sessionStorage.getItem('liveMessageType');
        if (liveMessage) {
            appendAlert(liveMessage, messageType);
            sessionStorage.removeItem('liveMessage');
            sessionStorage.removeItem('liveMessageType');
            if(messageType==='success'){
                $('#offcanvasRight').toggleClass('show');
            }
        }
    </script>

    <!-------------------- Breadcrumb -------------------->
    <div class="container">
        <nav style="--bs-breadcrumb-divider: '>'">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${url_home}">Trang Chủ</a></li>
                <li class="breadcrumb-item"><a href="${url_categoryId}">${requestScope.product.category.name}</a></li>
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
                    <%-- template product_gallery_template.js --%>
                    <div id="gallery-main" class="product_gallery_template"
                         data-owl-main='{"items": 1, "dots": false, "startPosition": "URLHash"}'
                         data-owl-thumb='{"items": 4, "margin": 10, "dots": false}'>
                        <%-- TODO: Hiển thị hình ảnh bìa của sản phẩm (data-hash = 0)--%>
                        <c:if test="${empty requestScope.productImages}">
                            <div class="item" data-hash=0>
                                <div class="ratio ratio-1x1 overflow-hidden">
                                    <img src="${requestScope.product.image}" alt="" style="object-fit: cover">
                                </div>
                            </div>
                        </c:if>
                        <%-- TODO: Hiển thị các hình ảnh minh họa của ản phẩm (data-hash = img.id) --%>
                        <c:forEach var="img" items="${requestScope.productImages}">
                            <div class="item" data-hash=${img.index}>
                                <div class="ratio ratio-1x1 overflow-hidden">
                                    <img src="${img.image}" alt="" style="object-fit: cover">
                                </div>
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
                        <%-- TODO Giá tiền chưa giảm của sản phẩm --%>
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
                                                    <c:if test="${not empty o.image}">
                                                        onclick=window.location.href='#${o.imageIndex}'
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
                                <div class="quantity-control input-group" data-min="1" data-max="1000">
                                    <button type="button" class="decrement btn custom-btn-primary">-</button>
                                    <input id="user-input-quantity" type="number" name="quantity" value="1"
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
                                <input id="submit-idVariant" type="number" name="idVariant" value="0" hidden="hidden">
                                <input id="submit-quantity" type="number" name="quantity" value="0" hidden="hidden">
                                <input id="submit-acition" type="text" name="action" value="buyNow" hidden="hidden">
                                <button class="btn custom-btn-primary flex-grow-1 text-uppercase text-center custom-bg-primary p-3 fw-semibold"
                                        role="button" type="button" onclick="handleSubmitBuyNowV2()">
                                        Đặt mua ngay
                                </button>
                                <button class="btn custom-btn-primary custom-icon px-4 btn-add-to-cart"
                                        data-bs-toggle="tooltip" data-bs-title="Thêm vào giỏ hàng" style="--size: 2rem"
                                        role="button" data-action="add">
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
                        <div id="product_descriptions">
                        <c:if test="${empty requestScope.product.description}">
                            Sản phẩm chưa có mô tả.
                        </c:if>
                            ${requestScope.product.description}
                        </div>
<%--                        <div class="show-more">--%>
<%--                            <div class="d-flex justify-content-center">--%>
<%--                                <button id="show-more-btn" class="btn btn-outline-primary">Xem thêm</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="show-less d-none">--%>
<%--                            <div class="d-flex justify-content-center">--%>
<%--                                <button id="show-less-btn" class="btn btn-outline-primary">Thu gọn</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container mt-5">
        <h4 class="mb-3">ĐÁNH GIÁ SẢN PHẨM</h4>

        <!-- Tổng điểm và bộ lọc -->
        <div class="border rounded p-3 mb-4">
            <div class="d-flex align-items-center">
                <h1 class="text-success mb-0 me-2">${String.format("%.1f", avgRating)} / 5</h1>
                <div>
                    <div class="text-warning fs-4">
                        <c:forEach var="i" begin="1" end="5">
                            <c:choose>
                                <c:when test="${i <= avgRating}">
                                    <i class="fas fa-star"></i>
                                </c:when>
                                <c:when test="${i - avgRating < 1}">
                                    <i class="fas fa-star-half-alt" style="color: rgb(255 193 39)"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="far fa-star"></i>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="mt-3 d-flex flex-wrap gap-2">
                <button class="btn btn-outline-success btn-sm rating active" data-idProduct="${requestScope.product.id}" data-rating="0">
                    Tất Cả
                </button>
                <button class="btn btn-outline-success btn-sm rating" data-idProduct="${requestScope.product.id}" data-rating="5">
                    5 Sao (${requestScope.rating5Star})
                </button>
                <button class="btn btn-outline-success btn-sm rating" data-idProduct="${requestScope.product.id}" data-rating="4">
                    4 Sao (${requestScope.rating4Star})
                </button>
                <button class="btn btn-outline-success btn-sm rating" data-idProduct="${requestScope.product.id}" data-rating="3">
                    3 Sao (${requestScope.rating3Star})
                </button>
                <button class="btn btn-outline-success btn-sm rating" data-idProduct="${requestScope.product.id}" data-rating="2">
                    2 Sao (${requestScope.rating2Star})
                </button>
                <button class="btn btn-outline-success btn-sm rating" data-idProduct="${requestScope.product.id}" data-rating="1">
                    1 Sao (${requestScope.rating1Star})
                </button>
            </div>
        </div>

        <!-- Một đánh giá -->
        <div id="reviewList">
            <c:forEach var="review" items="${productReviews}">
                <div class="border-bottom pb-4 mb-4">
                    <div class="d-flex align-items-center mb-2">
                        <img src="https://i1.sndcdn.com/artworks-ozhbsDOfLNl8quTs-ayDhHA-t240x240.jpg"
                             class="rounded-circle me-2" alt="avatar" style="width: 70px">
                        <div class="user-info">
                            <strong>
                                <c:choose>
                                    <c:when test="${review.isShowUsername == 1}">
                                        <strong>${review.username}</strong>
                                    </c:when>
                                    <c:otherwise>
                                        Người dùng
                                    </c:otherwise>
                                </c:choose>
                            </strong>

                            <div class="text-warning mb-2">
                                <c:forEach begin="1" end="5" var="i">
                                    <c:choose>
                                        <c:when test="${i <= review.rating}">
                                            ★
                                        </c:when>
                                        <c:otherwise>
                                            ☆
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                            <div class="text-muted small">${review.createdAt}
                                <c:choose>
                                    <c:when test="${not empty review.option1Value}">
                                        | Phân loại hàng: ${review.option1Value}
                                        <c:choose>
                                            <c:when test="${not empty review.option2Value}">
                                                , ${review.option2Value}
                                            </c:when>
                                        </c:choose>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <p class="mb-1"><strong>Chất lượng sản phẩm:</strong> <span class="text-success">${review.productQuality}</span></p>
                    <p class="mb-1"><strong>Đúng với mô tả:</strong> <span class="text-success">${review.matchDescription}</span></p>
                    <p>${review.reviewText}</p>

                    <!-- Hình ảnh -->
                    <div class="d-flex gap-2 mb-2">
                        <c:if test="${not empty review.images}">
                            <c:forEach var="img" items="${review.images}">
                                <img src="${img.imageUrl}" class="img-thumbnail" width="60" height="60">
                            </c:forEach>
                        </c:if>

                    </div>


                    <!-- Phản hồi của người bán -->
                    <c:if test="${review.sellerReply != null}">
                        <div class="bg-light p-3 rounded">
                            <strong>Phản Hồi Của Người Bán</strong>
                            <p class="mb-0">${review.sellerReply}</p>
                        </div>
                    </c:if>

                    <!-- Like -->
                    <div class="mt-2 text-muted small">
                        <button class="btn btn-sm btn-outline-success like-btn" data-review-id="${review.id}">
                            👍
                        </button>
                        <span class="like-count">${review.likeCount}</span>
                    </div>
                </div>
            </c:forEach>

        </div>
        <c:if test="${hasMore}">
            <div class="text-center">
                <button id="loadMoreBtn" data-idProduct="${requestScope.product.id}"
                        class="btn btn-outline-success mt-3">
                    Xem thêm đánh giá
                </button>
            </div>
        </c:if>
    </div>

    <!-------------------- San pham tuong tu -------------------->
    <div class="container my-5">
        <div class="section-title py-2 mb-2 row">
            <h2 class="best-sale-title fw-bold text-center text-uppercase">Sản phẩm tương tự </h2>
            <hr>
        </div>
        <%-- product gallery --%>
        <div id="gallery-main" class="product_gallery_template" data-owl-main='{"items": 4, "margin": 10, "dots": false}'>
            <%-- product cards--%>
            <c:forEach var="p" items="${requestScope.similarProducts}">
                <div class="item">
                    <c:url var="productUrl" value="<%=UrlProperties.productDetail()%>">
                        <c:param name="id" value="${p.id}"/>
                    </c:url>
                    <fmt:formatNumber var="fmtPrice" value="${p.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                    <a class="product_card_template" href="${productUrl}"
                       data-json='{
                            "img": "${p.image}",
                            "name": "${p.name}",
                            "price": "${fmtPrice}",
                            "basePrice": "",
                            "discount": "",
                            "badge": "HOT"
                            }'>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>


    <script>
        // Danh sách các variants lấy từ servlet ở dạng Json
        const productVariants = JSON.parse('${requestScope.productVariantsJson}');

        // Nếu chỉ có 1 variant thì hiển thị số lượng luôn. Không cần đợi chọn các options
        if (productVariants.length === 1) {
            updateProductStock()
        }

        function updateProductStock() {
            // 2 radio input để lấy thông tin option
            let idOption1 = parseInt($('input[type=radio][name=idOption1]:checked').val() || 0);
            let idOption2 = parseInt($('input[type=radio][name=idOption2]:checked').val() || 0);

            // thẻ hiển thị số lượng sản phẩm
            const $productStock = $('#product-stock');

            // tìm kiếm variant dựa trên 2 option
            const matchedVariant = productVariants.find(
                pv => pv.idOption1 === idOption1 && pv.idOption2 === idOption2
            );

            // Cập nhật hiển thị số lượng sản phẩm
            if (matchedVariant) {
                $productStock.text(matchedVariant.stock + " sản phẩm có sẵn");
            } else {
                $productStock.text("");
            }
        }

        // Thêm idVariant và quantity khi submit form đặt hàng
        function handleOnSubmitProductForm() {
            let idOption1 = parseInt($('input[type=radio][name=idOption1]:checked').val() || 0);
            let idOption2 = parseInt($('input[type=radio][name=idOption2]:checked').val() || 0);
            const matchedVariant = productVariants.find(
                pv => pv.idOption1 === idOption1 && pv.idOption2 === idOption2
            );
            if(matchedVariant) {
                const quantity = $('#user-input-quantity').val();
                const idVariant = matchedVariant.id;

                $('#submit-idVariant').val(idVariant);
                $('#submit-quantity').val(quantity);
            }
        }

        // Xử lý gửi đến link buy now
        function handleSubmitBuyNow() {
            const $form = $('#product-form');
            $form.attr('method', 'GET');
            $form.attr('action', '<c:url value="<%=UrlProperties.checkout()%>"/>');
            $form.submit();
        }

        function handleSubmitBuyNowV2() {
            handleOnSubmitProductForm()
            const idVariant = $('#submit-idVariant').val();
            const quantity = $('#submit-quantity').val();
            let items = [
                { variantId: idVariant, quantity: quantity },
            ];

            $.ajax({
                url: 'https://crocodile.nludemo.id.vn/checkout/v2',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ items }),
                success: function(response) {
                    console.log('Request successful:', response);
                    window.location.href = 'https://crocodile.nludemo.id.vn/checkout/v2';
                },
                error: function(xhr, status, error) {
                    console.error('Request failed:', status, error);
                    if(xhr.status === 406){
                        window.location.href = 'https://crocodile.nludemo.id.vn/login';
                    }
                }
            });
        }

        // Xử lý gửi đến link add to cart
        <%--function handleSubmitAddToCart() {--%>
        <%--    const $form = $('#product-form');--%>
        <%--    $form.attr('method', 'POST');--%>
        <%--    $form.attr('action', '${urlCart}');--%>
        <%--    $form.submit();--%>
        <%--}--%>
    </script>

    <!-- ajax thêm sản phẩm vào giỏi hàng  -->
    <script>
        $(document).on('click', '.btn-add-to-cart', function (event) {
            event.preventDefault();
            handleOnSubmitProductForm()
            const idVariant = $('#submit-idVariant').val();
            const quantity = $('#submit-quantity').val();
            const action =$(this).data('action');

            $.ajax({
                url: "${urlCart}",
                type: "POST",
                data: {
                    action: action,
                    idVariant: idVariant,
                    quantity: quantity
                },
                success: function (response) {
                    sessionStorage.setItem('liveMessage', 'Thêm vào giỏ hàng thành công!');
                    sessionStorage.setItem('liveMessageType', 'success');
                    window.location.reload();
                    // appendAlert('Thêm vào giỏ hàng thành công!', 'success')
                    // alert("Thêm vào giỏ hàng thành công!");
                },
                error: function (xhr, status, error) {
                    if (xhr.status === 404) {
                        alert("Không tìm thấy endpoint " + "${urlCart}");
                    } else {
                        sessionStorage.setItem('liveMessage', 'Thêm thất bại. Bạn chưa chọn phân loại!');
                        sessionStorage.setItem('liveMessageType', 'danger');
                        window.location.reload();
                    }
                    console.error("Error:", error);
                }
            })

        });
    </script>
</div>




