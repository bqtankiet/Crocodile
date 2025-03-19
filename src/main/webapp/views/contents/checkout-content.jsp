<%@ page import="vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url var="url_home" value="<%= UrlProperties.home()%>"/>
<c:url var="urlCart" value="<%=UrlProperties.cart()%>"/>
<c:url var="urlCheckout" value="<%=UrlProperties.checkout()%>"/>

<style>
    body { padding-right: 0 !important }
</style>

<div id="page" class="layout-default ">
    <div id="CONTENT" class="h-100" style="margin-bottom: 10rem;">
        <!-------------------- Breadcrumb -------------------->
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
            }
        </script>
        <div class="container">
            <nav style="--bs-breadcrumb-divider: '>'">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${url_home}">Trang Chủ</a></li>
                    <li class="breadcrumb-item"><a href="${urlCart}">Giỏ Hàng</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Thanh Toán</li>
                </ol>
            </nav>
            <hr>
        </div>

        <div class="container h-100">
            <div class="row">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="fw-bold mb-0">Thanh toán</h3>
                </div>
            </div>
            <div class="row gap-2">
                <div class="col">
                    <div class="">

                        <%-- TODO: sủa lại thành thông tin user --%>
                        <div class="d-flex align-items-center mb-2">
                            <h5>Địa chỉ nhận hàng</h5>
                            <a role="button" class="ms-auto text-decoration-none" data-bs-toggle="modal" data-bs-target="#addressModal">Thay đổi</a>
                            <%--TODO: Thay đổi địa chỉ--%>
                        </div>
                        <div>
                            <table class="table mb-0">
                                <tbody>
                                <tr>
                                    <td class="col-3 text-muted"> Tên người nhận </td>
                                    <td class="id-user" data-id-user="${sessionScope.userId}">${requestScope.defaultAddress.fullname}</td>
                                </tr>
                                <tr>
                                    <td class="col-3 text-muted">Liên hệ</td>
                                    <td>${requestScope.defaultAddress.formatedPhoneNumber}</td>
                                </tr>
                                <tr>
                                    <td class="col-3 text-muted">Địa chỉ</td>
                                    <td class="address" data-id-address="1">
                                        ${requestScope.defaultAddress.fullAddress}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="mt-5">
                        <div class="d-flex align-items-center mb-2">
                            <p class="h5">Phương thức thanh toán</p>
                        </div>
                        <div class="d-flex flex-column gap-2">
                            <div class="payment-method-wrapper rounded-2 border-secondary-subtle border">
                                <input type="radio" class="payment-radio form-check-input"
                                       style="border: 1px solid gray" value="1"
                                       name="payment-method" id="payment-cash" checked>
                                <label for="payment-cash" class="payment-label" style="cursor: pointer">Thanh toán khi
                                    nhận hàng</label>
                            </div>
                            <div class="payment-method-wrapper rounded-2 border-secondary-subtle border">
                                <input type="radio" class="payment-radio form-check-input"
                                       style="border: 1px solid gray" value="2"
                                       name="payment-method" id="payment-momo">
                                <label for="payment-momo" class="payment-label" style="cursor: pointer">Thanh toán qua
                                    Momo
                                    <img src="https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png" class="ms-2"
                                         style="width: 1.5rem; height: 1.5rem" alt="">
                                </label>
                            </div>
                            <div class="payment-method-wrapper rounded-2 border-secondary-subtle border">
                                <input type="radio" class="payment-radio form-check-input"
                                       style="border: 1px solid gray" value="3"
                                       name="payment-method" id="payment-zalopay">
                                <label for="payment-zalopay" class="payment-label" style="cursor: pointer">Thanh toán
                                    qua ZaloPay
                                    <img src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Logo-ZaloPay-Square.png"
                                         class="ms-2" style="width: 1.5rem; height: 1.5rem" alt="">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-5 ">
                    <div class="p-4 rounded-2 bg-secondary-subtle gap-3">
                        <c:set var="totalAmount" value="0" />

                        <c:choose>

                            <c:when test="${empty requestScope.cartItem}">
                                <c:forEach var="item" items="${sessionScope.selectedCartItems}">
                                    <c:set var="productVariant" value="${item.productVariant}"/>
                                    <input class="item-buy" type="text" value="${productVariant.id}"
                                           hidden="hidden" data-action="buySuccess">
                                    <div class="d-flex flex-column">
                                        <div class="row g-0">
                                            <div class="col-2 me-3 position-relative">
                                                <div class="ratio ratio-1x1">
                                                    <img src="${productVariant.product.image}"
                                                         class="img-fluid border rounded-2" alt="">
                                                </div>
                                            </div>
                                            <div class="col lh-1 my-auto">
                                                <div class="w-100">
                                                    <div class="d-flex align-items-center">
                                                        <div class="me-2">
                                                            <p class="fw-semibold mb-0 line-clamp-2"
                                                               style="height: fit-content ;max-height: 2.5rem; line-height: 1.2">
                                                                    ${productVariant.product.name}
                                                            </p>
                                                            <c:if test="${productVariant.idOption1 != null}">
                                                                <p class="fw-normal">${productVariant.pOption1.key}: ${productVariant.pOption1.value}
                                                                    <c:if test="${productVariant.pOption2 != null}">
                                                                        , ${productVariant.pOption2.key}: ${productVariant.pOption2.value}
                                                                    </c:if>
                                                                </p>
                                                            </c:if>
                                                        </div>
                                                        <div class="ms-auto fw-bold fs-6 text-nowrap" style="width: max-content">
                                                            <fmt:formatNumber value="${productVariant.product.price}" type="number" pattern="#,##0" />
                                                            <sup>₫</sup> × ${item.quantity}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center mt-3">
                                        <span class="fw-medium text-muted">Tổng đơn hàng: </span>
                                        <div class="ms-auto">
                                    <span class="fw-bold">
                                        <fmt:formatNumber value="${item.caculatePrice()}" type="number" pattern="#,##0" />
                                         <sup>₫</sup>
                                    </span>
                                        </div>
                                    </div>

                                    <div class="border-top border-secondary-subtle mt-3 mb-2"></div>

                                    <c:set var="totalAmount" value="${totalAmount + item.caculatePrice()}" />
                                </c:forEach>
                            </c:when>

                            <c:otherwise>
                                <c:set var="i" value="${requestScope.cartItem.productVariant}"/>
                                <div class="d-flex flex-column">
                                    <div class="row g-0">
                                        <div class="col-2 me-3 position-relative">
                                            <div class="ratio ratio-1x1">
                                                <img src="${i.product.image}"
                                                     class="img-fluid border rounded-2" alt="">
                                            </div>
                                        </div>
                                        <div class="col lh-1 my-auto">
                                            <div class="w-100">
                                                <div class="d-flex align-items-center">
                                                    <div class="me-2">
                                                        <p class="fw-semibold mb-0 line-clamp-2"
                                                           style="height: fit-content ;max-height: 2.5rem; line-height: 1.2">
                                                                ${i.product.name}
                                                        </p>
                                                        <c:if test="${i.idOption1 != null}">
                                                            <p class="fw-normal">${i.pOption1.key}: ${i.pOption1.value}
                                                                <c:if test="${i.pOption2 != null}">
                                                                    , ${i.pOption2.key}: ${i.pOption2.value}
                                                                </c:if>
                                                            </p>
                                                        </c:if>
                                                    </div>
                                                    <div class="ms-auto fw-bold fs-6 text-nowrap" style="width: max-content">
                                                        <fmt:formatNumber value="${i.product.price}" type="number" pattern="#,##0" />
                                                        <sup>₫</sup> × ${requestScope.cartItem.quantity}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mt-3">
                                    <span class="fw-medium text-muted">Tổng đơn hàng: </span>
                                    <div class="ms-auto">
                                    <span class="fw-bold">
                                        <fmt:formatNumber value="${requestScope.cartItem.caculatePrice()}" type="number" pattern="#,##0" />
                                         <sup>₫</sup>
                                    </span>
                                    </div>
                                </div>
                                <div class="border-top border-secondary-subtle mt-3 mb-2"></div>
                                <c:set var="totalAmount" value="${requestScope.cartItem.caculatePrice()}" />
                            </c:otherwise>

                        </c:choose>

                        <div class="d-flex align-items-center mt-3">
                            <span class="fw-bold fs-5">Tổng cộng: </span>
                            <div class="ms-auto">
                                <span class="fs-5 fw-bold total-amount" data-total="${totalAmount}">
                                    <fmt:formatNumber value="${totalAmount}" type="number" pattern="#,##0" />
                                     <sup>₫</sup>
                                </span>
                            </div>
                        </div>
                        <div class="mt-5">
                            <button class="btn custom-btn-primary py-2 fw-medium w-100 payBtn">
                                Thanh toán
                            </button>
                            <p class="text-center text-muted mt-1 small">Bạn muốn thay đổi số lượng sản phẩm hãy
                                <a href="${urlCart}">Quay lại giỏ hàng</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Saved Address -->
    <div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="addressModalLabel">Các địa chỉ đã lưu</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <ul class="d-flex flex-column gap-2">
                        <c:forEach var="address" items="${requestScope.savedAddressList}">
                            <li class="bg-body-secondary p-2 rounded d-flex align-items-center">
                                <div class="col me-2">
                                    <i class='bx bxs-map'></i>
                                    <span>${address.fullname} - ${address.phoneNumber}</span>
                                    <small class="text-muted d-block line-clamp-2">
                                        ${address.fullAddress}
                                    </small>
                                </div>
                                    <div class="d-flex align-items-center justify-content-end">
                                        <button class="btn btn-outline-success">Áp dụng</button>
                                    </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn custom-btn-primary" role="button" data-bs-toggle="modal" data-bs-target="#newAddressModal">
                        Địa chỉ mới
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- Close Modal Saved Address -->


    <!-- Modal New Address -->
    <div class="modal fade" tabindex="-1" id="newAddressModal" data-bs-backdrop="static"
         data-bs-keyboard="false">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content p-2">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Nhập địa chỉ mới</h1>
                </div>
                <div class="modal-body">
                    <form action="<c:url value="/address"/>" method="post" class="d-flex flex-column gap-3"
                          id="newAddressForm">
                        <div class="row">
                            <div class="col-6 form-group">
                                <input class="form-control" id="name" name="name"
                                       placeholder="Nhập họ và tên" aria-label="">
                            </div>
                            <div class="col-6 form-group">
                                <input type="text" class="form-control" id="phone" name="phone"
                                       placeholder="Nhập số điện thoại" aria-label="">
                            </div>
                        </div>
                        <div class="form-group">
                            <input class="form-control" id="city" name="cityName" autocomplete="off"
                                   list="cityList"
                                   placeholder="Nhập tỉnh/thành phố" aria-label="">
                            <datalist id="cityList"></datalist>
                        </div>
                        <div class="form-group">
                            <input class="form-control" id="district" name="districtName"
                                   autocomplete="off"
                                   list="districtList"
                                   placeholder="Nhập quận/huyện" aria-label="">
                            <datalist id="districtList"></datalist>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="ward" name="wardName"
                                   autocomplete="off"
                                   list="wardList"
                                   placeholder="Nhập phường/xã" aria-label="">
                            <datalist id="wardList"></datalist>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="soNha" name="soNha"
                                   autocomplete="off"
                                   placeholder="Nhập địa chỉ cụ thể" aria-label="">
                        </div>
                        <div class="modal-footer">
                            <button type="submit" id="submitAddess" class="btn btn-success" form="newAddressForm">
                                Hoàn thành
                            </button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Quay lại
                            </button>
                        </div>
                        <c:if test="${not empty requestScope.errorMessage}">
                            <div class="alert alert-danger">${requestScope.errorMessage}</div>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Close Modal New Address -->

</div>



<script>
    $(document).on('click', '.payBtn', function () {
        const idUser = $('.id-user').data('id-user');
        const idAddress = $('.address').data('id-address');

        const selectedPaymentMethod = $('input[name="payment-method"]:checked').val();
        const totalAmount = $('.total-amount').data('total')

        const idBuys = $('.item-buy').map(function () {
            return $(this).val();
        }).get();

        const action = $('.item-buy').data('action')

        $.ajax({
            url: "${urlCheckout}",
            type: "POST",
            data: {
                idUser: idUser,
                idAddress: idAddress,
                paymentMethod: selectedPaymentMethod,
                total: totalAmount,
                action: action,
                idBuys: idBuys.join(',')
            },
            success: function(response) {
                sessionStorage.setItem('liveMessage', 'Đặt hàng thành công!');
                sessionStorage.setItem('liveMessageType', 'success');
                window.location.reload();
            },
            error: function (xhr, status, error) {
                sessionStorage.setItem('liveMessage', 'Đặt hàng thất bại, vui lòng thử lại!');
                sessionStorage.setItem('liveMessageType', 'danger');
                window.location.reload();
            }
        })
    });
</script>



