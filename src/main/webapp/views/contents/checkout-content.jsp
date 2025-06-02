<%@ page import="vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url var="url_home" value="<%= UrlProperties.home()%>"/>
<c:url var="urlCart" value="<%=UrlProperties.cart()%>"/>
<c:url var="urlCheckout" value="<%=UrlProperties.checkout()%>"/>
<c:url var="urlApiAddress" value="/api/user/profile/address"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<%-- Combobox --%>
<script src="<c:url value="/assets/components/combobox/combobox.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/assets/components/combobox/combobox.css"/>">
<%-- open-api.vn location selector --%>
<%--<script src="<c:url value="/assets/js/OpenApiVNLocationSelector.js"/>" defer></script>--%>
<script src="<c:url value='/assets/js/fetchProvinceGHN.js'/>"></script>

<style>
    body {
        padding-right: 0 !important
    }

    .combobox {
        .combobox-list {
            z-index: 99;
            min-width: 300px;
        }

        .combobox-item {
            padding: 0.25rem 1rem;
        }
    }
</style>

<div id="page" class="layout-default ">
    <div id="CONTENT" class="h-100" style="margin-bottom: 10rem;">
        <!-------------------- Breadcrumb -------------------->

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
                            <a role="button" class="ms-auto text-decoration-none" data-bs-toggle="modal"
                               data-bs-target="#addressModal">Thay đổi</a>
                            <%--TODO: Thay đổi địa chỉ--%>
                        </div>
                        <div>
                            <table class="table mb-0">
                                <tbody>
                                <tr>
                                    <td class="col-3 text-muted"> Tên người nhận</td>
                                    <td class="id-user" id="address-fullName"
                                        data-id-user="${sessionScope.userId}">${requestScope.order.address.recipientName}</td>
                                </tr>
                                <tr>
                                    <td class="col-3 text-muted">Liên hệ</td>
                                    <td id="address-phone">${requestScope.order.address.recipientPhone}</td>
                                </tr>
                                <tr>
                                    <td class="col-3 text-muted">Địa chỉ</td>
                                    <td class="address" data-id-address="1" id="address-fullAddress">
                                        ${requestScope.order.address.fullAddress}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%--mã giảm giá--%>
                    <div class="mt-5">
                        <div class="d-flex align-items-center mb-2">
                            <p class="h5 flex-grow-1">Mã giảm giá</p>
                            <a class="" id="btnChooseVoucher" role="button" data-bs-toggle="modal"
                               data-bs-target="#chooseVoucherModal">Chọn voucher</a>
                        </div>
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="Nhập mã giảm giá" id="discountCode"
                                   value="${sessionScope.order.discountCode.code}">
                            <button class="btn custom-btn-primary" id="btnApplyDiscount" disabled>Áp dụng</button>
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
                        <c:set var="totalAmount" value="0"/>

                        <c:choose>

                            <%--<<<<<<< HEAD--%>
                            <c:when test="${empty requestScope.order.items}">
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="oi" items="${requestScope.order.items}">
                                    <%--=======--%>
                                    <%--                            <c:when test="${empty requestScope.cartItem}">--%>
                                    <%--                                <c:forEach var="item" items="${sessionScope.selectedCartItems}">--%>
                                    <%--                                    <c:set var="productVariant" value="${item.productVariant}"/>--%>
                                    <%--                                    <input class="idVariant" type="text" value="${productVariant.id}"--%>
                                    <%--                                           hidden="hidden" data-action="buySuccess">--%>

                                    <%--                                    <input class="quantity" type="text" value="${item.quantity}"--%>
                                    <%--                                           hidden="hidden">--%>
                                    <%-->>>>>>> develop--%>
                                    <div class="d-flex flex-column">
                                        <div class="row g-0">
                                            <div class="col-2 me-3 position-relative">
                                                <div class="ratio ratio-1x1">
                                                    <img src="${oi.productImage}"
                                                         class="img-fluid border rounded-2" alt="">
                                                </div>
                                            </div>
                                            <div class="col lh-1 my-auto">
                                                <div class="w-100">
                                                    <div class="d-flex align-items-center">
                                                        <div class="me-2">
                                                            <p class="fw-semibold mb-0 line-clamp-2"
                                                               style="height: fit-content ;max-height: 2.5rem; line-height: 1.2">
                                                                    ${oi.productName}
                                                            </p>
                                                                <%--                                                            <c:if test="${i.idOption1 != null}">--%>
                                                                <%--                                                                <p class="fw-normal">${i.pOption1.key}: ${i.pOption1.value}--%>
                                                                <%--                                                                    <c:if test="${i.pOption2 != null}">--%>
                                                                <%--                                                                        , ${i.pOption2.key}: ${i.pOption2.value}--%>
                                                                <%--                                                                    </c:if>--%>
                                                                <%--                                                                </p>--%>
                                                                <%--                                                            </c:if>--%>
                                                            <c:if test="${oi.variantOption != null}">
                                                            <p class="fw-normal">${oi.variantOption}
                                                                </c:if>
                                                        </div>
                                                        <div class="ms-auto fw-bold fs-6 text-nowrap"
                                                             style="width: max-content">
                                                            <fmt:formatNumber value="${oi.unitPrice}" type="number"
                                                                              pattern="#,##0"/>
                                                            <sup>₫</sup> × ${oi.quantity}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="border-top border-secondary-subtle mt-3 mb-2"></div>
                                </c:forEach>
                                <div class="d-flex align-items-center mt-3">
                                    <span class="fw-medium text-muted">Phí giao hàng: </span>
                                    <div class="ms-auto">
                                    <span class="fw-bold">
                                        <fmt:formatNumber value="${requestScope.order.shippingFee}" type="number"
                                                          pattern="#,##0"/>
                                         <sup>₫</sup>
                                    </span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mt-3">
                                    <span class="fw-medium text-muted">Tổng đơn hàng: </span>
                                    <div class="ms-auto">
                                    <span class="fw-bold">
                                        <fmt:formatNumber value="${requestScope.order.itemsTotal}" type="number"
                                                          pattern="#,##0"/>
                                         <sup>₫</sup>
                                    </span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mt-3">
                                    <span class="fw-medium text-muted">Giảm giá: </span>
                                    <div class="ms-auto">
                                    <span class="fw-bold">
                                        <c:set var="discountType" value="${sessionScope.order.discountCode.type}"/>
                                        <c:set var="discountValue" value="${sessionScope.order.discountCode.value}"/>
                                        <c:choose>
                                            <c:when test="${discountType == 'FIXED'}">
                                                <fmt:formatNumber value="${discountValue}" type="number" pattern="#,##0" />
                                                <sup>₫</sup>
                                            </c:when>
                                            <c:when test="${discountType == 'PERCENTAGE'}">
                                                ${discountValue}%
                                            </c:when>
                                            <c:otherwise>
                                                Không có
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    </div>
                                </div>

                                <div class="border-top border-secondary-subtle mt-3 mb-2"></div>


                                <%--                                <c:set var="i" value="${requestScope.cartItem.productVariant}"/>--%>
                                <%--                                <div class="d-flex flex-column">--%>
                                <%--                                    <div class="row g-0">--%>
                                <%--                                        <div class="col-2 me-3 position-relative">--%>
                                <%--                                            <div class="ratio ratio-1x1">--%>
                                <%--                                                <img src="${i.product.image}"--%>
                                <%--                                                     class="img-fluid border rounded-2" alt="">--%>
                                <%--                                            </div>--%>
                                <%--                                        </div>--%>
                                <%--                                        <div class="col lh-1 my-auto">--%>
                                <%--                                            <div class="w-100">--%>
                                <%--                                                <div class="d-flex align-items-center">--%>
                                <%--                                                    <div class="me-2">--%>
                                <%--                                                        <p class="fw-semibold mb-0 line-clamp-2"--%>
                                <%--                                                           style="height: fit-content ;max-height: 2.5rem; line-height: 1.2">--%>
                                <%--                                                                ${i.product.name}--%>
                                <%--                                                        </p>--%>
                                <%--                                                        <c:if test="${i.idOption1 != null}">--%>
                                <%--                                                            <p class="fw-normal">${i.pOption1.key}: ${i.pOption1.value}--%>
                                <%--                                                                <c:if test="${i.pOption2 != null}">--%>
                                <%--                                                                    , ${i.pOption2.key}: ${i.pOption2.value}--%>
                                <%--                                                                </c:if>--%>
                                <%--                                                            </p>--%>
                                <%--                                                        </c:if>--%>
                                <%--                                                    </div>--%>
                                <%--                                                    <div class="ms-auto fw-bold fs-6 text-nowrap"--%>
                                <%--                                                         style="width: max-content">--%>
                                <%--                                                        <fmt:formatNumber value="${i.product.price}" type="number"--%>
                                <%--                                                                          pattern="#,##0"/>--%>
                                <%--                                                        <sup>₫</sup> × ${requestScope.cartItem.quantity}--%>
                                <%--                                                    </div>--%>
                                <%--                                                </div>--%>
                                <%--                                            </div>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                                <%--                                <div class="d-flex align-items-center mt-3">--%>
                                <%--                                    <div class="d-flex align-items-center mt-3">--%>
                                <%--                                        <span class="fw-medium text-muted">Phí giao hàng: </span>--%>
                                <%--                                        <div class="ms-auto">--%>
                                <%--                                    <span class="fw-bold">--%>
                                <%--                                        <fmt:formatNumber value="${requestScope.shippingFee}" type="number" pattern="#,##0"/>--%>
                                <%--                                         <sup>₫</sup>--%>
                                <%--                                    </span>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>

                                <%--                                    <div class="d-flex align-items-center mt-3">--%>
                                <%--                                        <span class="fw-medium text-muted">Tổng đơn hàng: </span>--%>
                                <%--                                        <div class="ms-auto">--%>
                                <%--                                    <span class="fw-bold">--%>
                                <%--                                        <fmt:formatNumber value="${item.caculatePrice()}" type="number" pattern="#,##0"/>--%>
                                <%--                                         <sup>₫</sup>--%>
                                <%--                                    </span>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="border-top border-secondary-subtle mt-3 mb-2"></div>--%>
                                <%--                                <c:set var="totalAmount" value="${requestScope.cartItem.caculatePrice()}"/>--%>
                            </c:otherwise>

                        </c:choose>

                        <div class="d-flex align-items-center mt-3">
                            <span class="fw-bold fs-5">Tổng thanh toán: </span>
                            <div class="ms-auto">
                                <span class="fs-5 fw-bold total-amount" data-total="${totalAmount}">
                                    <fmt:formatNumber value="${requestScope.order.total}" type="number"
                                                      pattern="#,##0"/>
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
                    <ul class="d-flex flex-column gap-2" id="listSavedAddresses">
                        <c:forEach var="address" items="${requestScope.savedAddressList}" varStatus="status">
                            <%--                            <c:set var="inUse"--%>
                            <%--                                   value="${address.id == requestScope.defaultAddress.id ? 'inUse disabled' : ''}"/>--%>
                            <li class="bg-body-secondary p-2 rounded d-flex align-items-center">
                                <div class="col me-2">
                                    <i class='bx bxs-map'></i>
                                    <span>${address.fullname} - ${address.phoneNumber}</span>
                                    <small class="text-muted d-block line-clamp-2">
                                            ${address.fullAddress}
                                    </small>
                                </div>
                                <div class="d-flex align-items-center justify-content-end">
                                    <button class="[ btn-apply-address ] btn btn-outline-success"
                                            data-address-id="${address.id}">Áp dụng
                                    </button>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn custom-btn-primary" role="button" data-bs-toggle="modal"
                            data-bs-target="#newAddressModal">
                        Địa chỉ mới
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- Close Modal Saved Address -->


    <!-- Modal New Address -->
    <div class="modal fade" tabindex="-1" id="newAddressModal"
         data-bs-keyboard="false">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content p-2">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Nhập địa chỉ mới</h1>
                </div>
                <div class="modal-body">
                    <form class="d-flex flex-column gap-3" id="openApiVnLocationSelector"
                          id="newAddressForm">
                        <div class="row">
                            <div class="col-6 form-group">
                                <input class="form-control" id="nameInput" name="name" required
                                       placeholder="Nhập họ và tên" aria-label="">
                            </div>
                            <div class="col-6 form-group">
                                <input type="text" class="form-control" id="phoneInput" name="phone" required
                                       placeholder="Nhập số điện thoại" aria-label="">
                            </div>
                        </div>
                        <div class="form-group combobox" id="provinceCombobox">
                            <input class="form-control combobox-input" id="provinceInput" name="province"
                                   autocomplete="off" required
                                   placeholder="Chọn Tỉnh/Thành phố" aria-label="">
                            <ul class="combobox-list" id="provinceList"></ul>
                        </div>
                        <div class="form-group combobox" id="districtCombobox">
                            <input class="form-control combobox-input" id="districtInput" name="district" required
                                   autocomplete="off" disabled
                                   placeholder="Chọn Quận/Huyện" aria-label="">
                            <ul class="combobox-list" id="districtList"></ul>
                        </div>
                        <div class="form-group combobox" id="wardCombobox">
                            <input type="text" class="form-control combobox-input" id="wardInput" name="ward" required
                                   autocomplete="off" disabled
                                   placeholder="Chọn Phường/Xã" aria-label="">
                            <ul class="combobox-list" id="wardList"></ul>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="homeAddressInput" name="soNha"
                                   autocomplete="off" disabled required
                                   placeholder="Số nhà, tên đường, ..." aria-label="">
                        </div>

                        <%-- Modal footer buttons --%>
                        <div class="modal-footer">
                            <button type="submit" id="submitAddess" class="btn btn-success" form="newAddressForm"
                                    data-bs-dismiss="modal">
                                Hoàn thành
                            </button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Quay lại
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Close Modal New Address -->

    <!-- Modal Voucher -->
    <div class="modal fade" tabindex="-1" id="chooseVoucherModal"
         data-bs-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" style="min-width:1000px">
            <div class="modal-content p-2">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">Chọn voucher</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body row">
                    <%--TODO: Triển khai chức năng sử dụng voucher --%>
                    <p>Các voucher đã lưu</p>
                    <c:forEach var="ud" items="${requestScope.userVouchers}">
                            <c:set var="v" value="${ud.discountCode}"/>
                            <div class="col-12 col-lg-6 d-flex justify-content-center">
                                <div id="voucher-${v.id}" class="voucher-card d-inline-flex" style="height: 125px; --color:#dc3545">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="-0.5 -0.5 4 16" class="flex-none" style="height: 125px;">
                                        <path d="M4 0h-3q-1 0 -1 1a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3q0 1 1 1h3"
                                              stroke-width="1.2" transform="" style="stroke: var(--color); fill: var(--color)"></path>
                                    </svg>
                                    <div class="bg-danger" style="width: 25px">
                                    </div>
                                    <div class="border border-1 d-inline-flex shadow-sm">
                                        <div class="d-flex flex-column p-3 justify-content-center ">
                                            <h5 class="m-0">Giảm ${v.value}${v.type.name().equals("PERCENTAGE")?"%":"đ"}</h5>
                                            <p class="m-0">Có hiệu lực từ: <fmt:formatDate value="${v.startDateFmt}" pattern="dd/MM/yyyy" /></p>
                                            <p class="m-0 text-muted">Còn lại: ${v.maxUses} voucher</p>
                                        </div>
                                        <div class="d-flex position-relative p-3">
                                            <c:choose>
                                                <c:when test="${v.saved}">
                                                    <button class="btn btn-secondary disabled px-4 my-auto" style="width: 100px">Đã lưu</button>
                                                </c:when>
                                                <c:when test="${v.maxUses <= 0}">
                                                    <button class="btn btn-secondary disabled px-4 my-auto" style="width: 100px">Đã hết</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button class="btn btn-danger px-4 my-auto" style="width: 100px" onclick="useVoucher('${v.code}')">Dùng</button>
                                                </c:otherwise>
                                            </c:choose>
                                            <a href="${pageContext.request.contextPath}/voucher-detail?id=${v.id}" role="button" class="position-absolute bottom-0 mb-2">Điều kiện</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <!-- Close Modal Voucher -->

</div>


<script>
    $('#submitAddess').on('click', function (event) {
        const fullName = $('#nameInput').val();
        const phoneNumber = $('#phoneInput').val();
        const province = $('#provinceInput').val();
        const district = $('#districtInput').val();
        const ward = $('#wardInput').val();
        const street = $('#homeAddressInput').val();

        $('#address-fullName').text(fullName);
        $('#address-phone').text(phoneNumber);
        $('#address-fullAddress').text([street, ward, district, province].join(', '));
    });
</script>


<%--Xử lý khi nhấn đặt hàng --%>
<script>
    const URL = '<c:url value="/checkout/confirm"/>';
    $(document).on('click', '.payBtn', () => {
        const selectedPaymentMethod = $('input[name="payment-method"]:checked').val();
        $.ajax({
            url: URL,
            type: "POST",
            data: {
                paymentMethod: selectedPaymentMethod
            },
            success: function (response) {
                Swal.fire({
                    icon: 'success',
                    title: "Đặt hàng thành công",
                    text: "Cảm ơn bạn đã đặt hàng tại Crocodile Shop! Chúng tôi sẽ sớm gửi xác nhận đơn hàng qua email hoặc số điện thoại của bạn.",
                    confirmButtonText: 'OK',
                }).then((result) => {
                    if ((result.isConfirmed || result.dismiss)) {
                        window.location.href = '<c:url value="/"/>';
                    }
                });
            },
            error: function (xhr, status, error) {
                const errorMessage = xhr.responseText || 'Đặt hàng thất bại, vui lòng thử lại!';
                Swal.fire({
                    icon: 'error',
                    title: "Thất bại",
                    text: "Đã có lỗi xảy ra, đặt hàng không thành công. Vui lòng thử lại sau.",
                    confirmButtonText: 'OK'
                });
            }
        })
    });
</script>

<%--<script>--%>
<%--    $(document).on('click', '.payBtn', ()=> {--%>
<%--        const idUser = $('.id-user').data('id-user');--%>
<%--        const idAddress = $('.address').data('id-address');--%>

<%--        const selectedPaymentMethod = $('input[name="payment-method"]:checked').val();--%>
<%--        const totalAmount = $('.total-amount').data('total')--%>

<%--        const idVariant = $('.idVariant');--%>

<%--        const idBuys = idVariant.map(function() {--%>
<%--            return $(this).val();--%>
<%--        }).get();--%>
<%--        console.log(idBuys)--%>

<%--        const quantities = $('.quantity').map(function() {--%>
<%--            return $(this).val();--%>
<%--        }).get();--%>
<%--        console.log(quantities)--%>
<%--        const action = idVariant.data('action')--%>

<%--        $.ajax({--%>
<%--            url: "${urlCheckout}",--%>
<%--            type: "POST",--%>
<%--            data: {--%>
<%--                idUser: idUser,--%>
<%--                idAddress: idAddress,--%>
<%--                paymentMethod: selectedPaymentMethod,--%>
<%--                total: totalAmount,--%>
<%--                action: action,--%>
<%--                idBuys: idBuys.join(','),--%>
<%--                quantities: quantities.join(',')--%>
<%--            },--%>
<%--            success: function (response) {--%>
<%--                sessionStorage.setItem('liveMessage', 'Đặt hàng thành công!');--%>
<%--                sessionStorage.setItem('liveMessageType', 'success');--%>
<%--                window.location.reload();--%>
<%--            },--%>
<%--            error: function (xhr, status, error) {--%>
<%--                const errorMessage = xhr.responseText || 'Đặt hàng thất bại, vui lòng thử lại!';--%>
<%--                sessionStorage.setItem('liveMessage', errorMessage);--%>
<%--                sessionStorage.setItem('liveMessageType', 'danger');--%>
<%--                window.location.reload();--%>
<%--            }--%>
<%--        })--%>
<%--    });--%>
<%--</script>--%>

<%-- Xử lý thay đổi địa chỉ nhận hàng --%>
<script>
    $(document).ready(function () {
        const $listSavedAddresses = $('#listSavedAddresses');

        $listSavedAddresses.on('click', '.btn-apply-address', function () {
            const $button = $(this);
            if ($button.hasClass('inUse')) return;

            // Xóa class khỏi tất cả các nút khác và thêm class vào nút hiện tại
            $listSavedAddresses.find('.btn-apply-address').removeClass('inUse disabled');
            $button.addClass('inUse disabled');

            // Lấy Id từ data-attribute
            const addressId = $button.data('address-id');
            $.ajax({
                url: "${urlApiAddress}",
                type: "GET",
                data: {id: addressId},
                dataType: "json",
                success: function (response) {
                    if (response.data) {
                        $('#addressModal').find('.btn-close').trigger('click');
                        updateAddress(response.data);
                    }
                },
            });
        });
    });

    function updateAddress(address) {
        let fullName = address.fullname;
        let phoneNumber = address.phoneNumber;
        let province = address.province;
        let district = address.district;
        let ward = address.ward;
        let street = address.street;

        $('#address-fullName').text(fullName);
        $('#address-phone').text(phoneNumber);
        $('#address-fullAddress').text([street, ward, district, province].join(', '));
    }
</script>

<%-- Xử lý combobox lấy địa chỉ từ API của GHN --%>
<script>
    fetchAndRenderProvinces('#provinceCombobox .combobox-list');
    new Combobox(document.getElementById('provinceCombobox'), {
        onItemSelected: function (item) {
            fetchAndRenderDistricts('#districtCombobox .combobox-list', parseInt(item.dataset.id));
            clearInput('#wardCombobox .combobox-input', 'disabled');
            clearInput('#districtCombobox .combobox-input');
            clearInput('#homeAddressInput', 'disabled');
        }
    });

    new Combobox(document.getElementById('districtCombobox'), {
        onItemSelected: function (item) {
            fetchAndRenderWards('#wardCombobox .combobox-list', parseInt(item.dataset.id));
            clearInput('#wardCombobox .combobox-input');
            clearInput('#homeAddressInput', 'disabled');
        }
    });

    new Combobox(document.getElementById('wardCombobox'), {
        onItemSelected: function (item) {
            clearInput('#homeAddressInput');
        }
    });

    function clearInput(selector, disabled = '') {
        const input = document.querySelector(selector);
        input.value = '';
        input.disabled = disabled;
    }
</script>

<%-- Xử lý nhấn áp dụng voucher --%>
<script>
    // Cho phép nhấn nút áp dụng chỉ khi input mã giảm giá có dữ liệu
    $('#discountCode').on('input', function () {
        if ($(this).val()) {
            $('#btnApplyDiscount').prop('disabled', false);
        } else {
            $('#btnApplyDiscount').prop('disabled', true);
        }
    });

    // xử lý khi nhấn vào nút apply discount bằng ajax
    $('#btnApplyDiscount').on('click', function () {
        const discountCode = $('#discountCode').val();
        const baseUrl = "${pageContext.request.contextPath}";
        const endpoint = "/checkout/apply-discount";
        $.ajax(
            {
                url: baseUrl + endpoint,
                method: "POST",
                data: {discountCode: discountCode},
                success: function (response) {
                    // Cập nhật giao diện hiển thị giá tiền thanh toán
                    Swal.fire({
                        icon: 'success',
                        title: "Thành công",
                        text: "Áp dụng thành công mã giảm giá " + discountCode.toUpperCase(),
                        timer: 1500,              // tự đóng sau 1.5 giây
                        timerProgressBar: true,   // thanh tiến trình thời gian
                        showConfirmButton: true,  // vẫn hiện nút OK để người dùng có thể đóng sớm
                    }).then((result) => {
                        // Reload khi popup đóng (bấm OK hoặc timeout)
                        location.reload();
                    });
                },
                error: function (xhr, error) {
                    // Thông báo lỗi cho người dùng
                    try {
                        const res = JSON.parse(xhr.responseText);
                        Swal.fire({
                            icon: 'error',
                            title: "Thất bại",
                            text: res.message,
                            confirmButtonText: 'OK'
                        });
                    } catch (e) {
                        alert("Có lỗi xảy ra. Vui lòng thử lại.");
                    }
                }
            }
        );
    });
</script>

<script>
    const useVoucher = (discountCode) => {
        const baseUrl = "${pageContext.request.contextPath}";
        const endpoint = "/checkout/apply-discount";
        $.ajax(
            {
                url: baseUrl + endpoint,
                method: "POST",
                data: {discountCode: discountCode},
                success: function (response) {
                    // Cập nhật giao diện hiển thị giá tiền thanh toán
                    Swal.fire({
                        icon: 'success',
                        title: "Thành công",
                        text: "Áp dụng thành công mã giảm giá " + discountCode.toUpperCase(),
                        timer: 1500,              // tự đóng sau 1.5 giây
                        timerProgressBar: true,   // thanh tiến trình thời gian
                        showConfirmButton: true,  // vẫn hiện nút OK để người dùng có thể đóng sớm
                    }).then((result) => {
                        // Reload khi popup đóng (bấm OK hoặc timeout)
                        location.reload();
                    });
                },
                error: function (xhr, error) {
                    // Thông báo lỗi cho người dùng
                    try {
                        const res = JSON.parse(xhr.responseText);
                        Swal.fire({
                            icon: 'error',
                            title: "Thất bại",
                            text: res.message,
                            confirmButtonText: 'OK'
                        });
                    } catch (e) {
                        alert("Có lỗi xảy ra. Vui lòng thử lại.");
                    }
                }
            }
        );
    };
</script>