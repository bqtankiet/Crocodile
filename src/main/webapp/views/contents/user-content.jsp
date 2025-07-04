<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    .hidden {
        display: none;
    }

    .nav.nav-pills .nav-link {
        color: gray;

        &.active {
            color: white;
            background-color: var(--custom-bg-primary);
        }
    }

    .eye-icon {
        width: 24px;
        height: 24px;
        cursor: pointer;
    }

    .card-custom {
        border-radius: 8px; /* Viền tròn cho các thẻ */
        box-shadow: 0 4px 8px rgba(0, 128, 0, 0.2); /* Bóng xanh lá nhẹ */
        transition: transform 0.2s ease-in-out; /* Hiệu ứng chuyển động khi hover */
    }

    .card-custom:hover {
        transform: scale(1.03); /* Khi hover, thẻ sẽ phóng to một chút */
        box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4); /* Bóng đậm hơn khi hover */
    }


    .tooltip-custom .tooltip-inner {
        background-color: white; /* Màu nền nhạt hơn */
        color: black; /* Màu chữ nổi bật */
        border: 1px solid #339933; /* Khung viền đỏ */
        padding: 8px;
        font-weight: bold;
        border-radius: 5px;
    }

    .tooltip-custom .tooltip-arrow::before {
        border-top-color: #ffdddd; /* Màu nền mũi tên */
    }
</style>

<div id="CONTENT" class="bg-secondary-subtle">
    <div class="container light-style py-5">
        <div class="row">
            <!-- left side -->
            <div class="col-3 me-3 bg-white shadow rounded-2 px-4" style="min-height: 40rem">
                <div class="row pt-3 pb-2 mb-3 border-bottom">
                    <div class="col-3 me-1">
                        <div class="text-bg-secondary rounded-circle ratio-1x1 ratio" style="width: 4rem;">
                            <div class="custom-icon" style="--size: 3rem">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-person" viewBox="0 0 16 16">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"></path>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <div class="col d-flex flex-column gap-1 justify-content-center">
                        <!-- Hiển thị fullName và userName từ session -->
                        <div class="fw-bold text-capitalize">${sessionScope.fullName}</div>
                    </div>

                </div>
                <div>
                </div>
                <div class="nav nav-pills flex-column gap-3" id="v-pills-tab" role="tablist">
                    <div role="button" class="nav-link active" data-bs-toggle="pill" data-bs-target="#account-general">
                        <div class="custom-icon me-2 float-start" style="--size: 1.5rem">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-person" viewBox="0 0 16 16">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"></path>
                            </svg>
                        </div>
                        Tài khoản của tôi
                    </div>
                    <div role="button" class="nav-link" data-bs-toggle="pill" data-bs-target="#account-purchase-order">
                        <div class="custom-icon me-2 float-start" style="--size: 1.5rem">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-receipt" viewBox="0 0 16 16">
                                <path d="M1.92.506a.5.5 0 0 1 .434.14L3 1.293l.646-.647a.5.5 0 0 1 .708 0L5 1.293l.646-.647a.5.5 0 0 1 .708 0L7 1.293l.646-.647a.5.5 0 0 1 .708 0L9 1.293l.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .801.13l.5 1A.5.5 0 0 1 15 2v12a.5.5 0 0 1-.053.224l-.5 1a.5.5 0 0 1-.8.13L13 14.707l-.646.647a.5.5 0 0 1-.708 0L11 14.707l-.646.647a.5.5 0 0 1-.708 0L9 14.707l-.646.647a.5.5 0 0 1-.708 0L7 14.707l-.646.647a.5.5 0 0 1-.708 0L5 14.707l-.646.647a.5.5 0 0 1-.708 0L3 14.707l-.646.647a.5.5 0 0 1-.801-.13l-.5-1A.5.5 0 0 1 1 14V2a.5.5 0 0 1 .053-.224l.5-1a.5.5 0 0 1 .367-.27m.217 1.338L2 2.118v11.764l.137.274.51-.51a.5.5 0 0 1 .707 0l.646.647.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.509.509.137-.274V2.118l-.137-.274-.51.51a.5.5 0 0 1-.707 0L12 1.707l-.646.647a.5.5 0 0 1-.708 0L10 1.707l-.646.647a.5.5 0 0 1-.708 0L8 1.707l-.646.647a.5.5 0 0 1-.708 0L6 1.707l-.646.647a.5.5 0 0 1-.708 0L4 1.707l-.646.647a.5.5 0 0 1-.708 0z"></path>
                                <path d="M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5m8-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5"></path>
                            </svg>
                        </div>
                        Đơn mua
                    </div>
                    <div role="button" class="nav-link" data-bs-toggle="pill" data-bs-target="#account-address">
                        <div class="custom-icon me-2 float-start" style="--size: 1.5rem">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-geo-alt" viewBox="0 0 16 16">
                                <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"></path>
                                <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"></path>
                            </svg>
                        </div>
                        Địa Chỉ
                    </div>
                    <div role="button" class="nav-link" data-bs-toggle="pill" data-bs-target="#account-change-password">
                        <div class="custom-icon float-start me-2" style="--size: 1.5rem">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-key" viewBox="0 0 16 16">
                                <path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8m4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5"></path>
                                <path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0"></path>
                            </svg>
                        </div>
                        Đổi Mật Khẩu
                    </div>
                    <a href="${pageContext.request.contextPath}/logout" class="nav-link text-danger fw-semibold"
                       role="button">
                        <div class="custom-icon me-2 float-start" style="--size: 1.5rem">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                      d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0z"></path>
                                <path fill-rule="evenodd"
                                      d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708z"></path>
                            </svg>
                        </div>
                        Đăng xuất
                    </a>
                </div>
            </div>
            <!-- right side -->
            <div class="col bg-white rounded-2 shadow p-5">
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade active show" id="account-general">
                        <div>
                            <h4 class="fw-semibold">Quản lý thông tin cá nhân</h4>
                            <hr class="text-light">
                        </div>
                        <form action="<c:url value='/update-profile'/>" method="post" class="d-flex flex-column gap-4" onsubmit="return validateForm()">
                            <div class="row">
                                <label for="fullname" class="col-form-label col-sm-2 text-muted">Họ và tên</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="fullname" name="fullname" value="${sessionScope.fullName != null ? sessionScope.fullName : ''}"
                                           maxlength="20" oninput="validateFullname()" required>
                                    <div id="fullname-error" class="text-danger" style="display: none;">Họ và tên không được chứa ký tự đặc biệt và không quá 20 ký tự.</div>
                                </div>
                            </div>

                            <div class="row">
                                <label class="col-form-label col-sm-2 text-muted">Số điện thoại</label>
                                <div class="col-sm-10 d-flex align-items-center">
                                    <span>
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.phone}">
                                                <span id="phone-number">${sessionScope.phone}</span>
                                            </c:when>
                                            <c:otherwise>
                                                Chưa thêm số điện thoại
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    <a role="button" class="ms-auto" data-bs-toggle="modal" data-bs-target="#modal-edit-phone">
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.phone}">
                                                Chỉnh sửa
                                            </c:when>
                                            <c:otherwise>
                                                Thêm
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                </div>
                            </div>

                            <div class="row">
                                <label class="col-form-label col-sm-2 text-muted">Email</label>
                                <div class="col-sm-10 d-flex align-items-center">
                                    <span>
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.email}">
                                                <span id="email">${sessionScope.email}</span>
                                            </c:when>
                                            <c:otherwise>
                                                Chưa thêm email
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    <a role="button" class="ms-auto" data-bs-toggle="modal" data-bs-target="#modal-edit-email">
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.email}">
                                                Chỉnh sửa
                                            </c:when>
                                            <c:otherwise>
                                                Thêm
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                </div>
                            </div>

                            <div class="row">
                                <label class="col-form-label col-sm-2 text-muted">Giới tính</label>
                                <div class="col-sm-10">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender-male" value="Nam"
                                        ${sessionScope.gender == 'Nam' ? 'checked' : ''}>
                                        <label class="form-check-label" for="gender-male">Nam</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender-female" value="Nữ"
                                        ${sessionScope.gender == 'Nữ' ? 'checked' : ''}>
                                        <label class="form-check-label" for="gender-female">Nữ</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender-other" value="Khác"
                                        ${sessionScope.gender == 'Khác' ? 'checked' : ''}>
                                        <label class="form-check-label" for="gender-other">Khác</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <label for="birth-date" class="col-form-label col-sm-2 text-muted">Ngày sinh</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control-plaintext" id="birth-date" name="birth-date"
                                           value="${sessionScope.birthDate != null ? sessionScope.birthDate : ''}" style="width: min-content;">
                                </div>
                            </div>

                            <button type="submit" class="btn custom-btn-primary btn-block p-2 ms-auto w-100" style="width: max-content">Lưu thay đổi</button>
                        </form>
                    </div>

            <%--------------------------------------Đổi mật khẩu----------------------------------------%>
                    <div class="tab-pane fade" id="account-change-password">
                        <div>
                            <h4 class="fw-semibold">Thay đổi mật khẩu </h4>
                            <hr class="text-light">
                        </div>
                        <form action="<c:url value="/password-change"/>" method="POST" class="d-flex flex-column gap-4">
                            <div class="row">
                                <label for="current-password" class="col-form-label text-muted">Mật khẩu hiện
                                    tại</label>
                                <div class="col-12">
                                    <input type="password" class="form-control" id="current-password"
                                           name="current-password" required>
                                </div>
                            </div>
                            <div class="row">
                                <label for="new-password" class="col-form-label text-muted">
                                    Mật khẩu mới
                                    <span class="text-danger" data-bs-toggle="tooltip"
                                          data-bs-title="Mật khẩu mới phải chứa ít nhất 8 kí tự. Có ít nhất 1 kí tự in hoa và số"
                                          data-bs-placement="right">*</span>
                                </label>
                                <div class="col-12">
                                    <input type="password" class="form-control" id="new-password" name="new-password"
                                           required>
                                </div>
                            </div>
                            <div class="row">
                                <label for="new-password-check" class="col-form-label text-muted">
                                    Nhập lại mật khẩu mới
                                    <span class="text-danger" data-bs-toggle="tooltip"
                                          data-bs-title="Mật khẩu phải khớp với mật khẩu mới" data-bs-placement="right">*</span>
                                </label>
                                <div class="col-12">
                                    <input type="password" class="form-control" id="new-password-check"
                                           name="new-password-check" required>
                                </div>
                            </div>
                            <button type="submit" id="save-password-btn"
                                    class="btn custom-btn-primary btn-block w-100 p-2 ms-auto "
                                    style="width: max-content">Lưu
                            </button>
                            <c:if test="${not empty requestScope.success}">
                                <div class="alert alert-success">${requestScope.success}</div>
                            </c:if>
                            <c:if test="${not empty requestScope.fail}">
                                <div class="alert alert-danger">${requestScope.fail}</div>
                            </c:if>
                        </form>
                    </div>

            <%--------------------------------------Địa chỉ----------------------------------------%>
                    <div class="tab-pane fade" id="account-address">
                        <div class="card-body pb-2">
                            <div class="form-group">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h4 class="fw-semibold">Địa chỉ của tôi</h4>
                                    <button type="button" class="btn custom-btn-primary btn-block p-2 mb-3"
                                            data-bs-toggle="modal" data-bs-target="#newAddressModal">
                                        + Thêm địa chỉ mới
                                    </button>
                                </div>
                                <div style="height: 1px; background-color: #dbdbdb; width: 100%"></div>
                            </div>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body pb-2">
                            <h6 class="mb-4">Địa Chỉ</h6>
                            <div id="addressList" class="row">
                                <!-- Hiển thị danh sách địa chỉ -->
                                <c:forEach var="address" items="${requestScope.addressList}">
                                    <div class="col-md-6 col-lg-4 mb-4">
                                        <div class="card card-custom border shadow-sm h-100">
                                            <!-- Thêm class card-custom -->
                                            <div class="card-body">
                                                <h6 class="fw-bold">${address.fullname}</h6>
                                                <p class="mb-1">${address.street}, ${address.ward}, ${address.district}, ${address.province}</p>
                                                <p class="mb-1">Số điện thoại: ${address.phoneNumber}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <!-- Hiển thị thông báo nếu không có địa chỉ -->
                                <c:if test="${not empty requestScope.message}">
                                    <div class="col-12">
                                        <div class="alert alert-info">${requestScope.message}</div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>


                    <!-- hiển thị thông tin đơn hàng (order) -->
                    <div class="tab-pane fade" id="account-purchase-order">
                        <div class="card-body pb-2">
                            <div class="form-group">
                                <!-- Filter Section -->
                                <div class="mb-4 mt-3">
                                    <div class="btn-group" role="group" style="width: 100%">
                                        <button type="button" class="btn btn-outline-success status-filter active" data-filter="all">Tất cả</button>
                                        <button type="button" class="btn btn-outline-success status-filter" data-filter="awaiting">Chờ xử lý</button>
                                        <button type="button" class="btn btn-outline-success status-filter" data-filter="processing">Đang xử lý</button>
                                        <button type="button" class="btn btn-outline-success status-filter" data-filter="completed">Đã giao</button>
                                        <button type="button" class="btn btn-outline-success status-filter" data-filter="cancelled">Đã hủy</button>
                                    </div>
                                </div>
                                <div style="height: 1px; background-color: #dbdbdb; width: 100%"></div>
                            </div>

                            <div id="ordersList" class="row">
                                <c:choose>
                                    <c:when test="${empty ordersList}">
                                        <div class="col-12">
                                            <div class="alert alert-info">Không có đơn hàng nào.</div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="order" items="${ordersList}">
                                            <div class="col-12 mb-4">
                                                <div class="card card-custom border shadow-sm">
                                                    <div class="card-body">
                                                        <!-- Shop Info -->
                                                        <div class="d-flex align-items-center mb-3">
                                                            <span class="badge bg-danger text-white me-2">Mall</span>
                                                            <h6 class="fw-bold mb-0">Crocodile</h6>

                                                            <span class="ms-auto text-success">
                                                                <c:choose>
                                                                    <c:when test="${order.status == 'AWAITING'}">Chờ xử lý</c:when>
                                                                    <c:when test="${order.status == 'PROCESSING'}">Đang xử lý</c:when>
                                                                    <c:when test="${order.status == 'COMPLETED'}">Hoàn thành</c:when>
                                                                    <c:when test="${order.status == 'CANCELLED'}">Đã hủy</c:when>
                                                                    <c:when test="${order.status == 'AWAITING'}">Đang chờ</c:when>
                                                                    <c:otherwise>Không xác định</c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </div>
                                                        <!-- Product Info -->
                                                        <div class="d-flex align-items-center mb-3">
                                                            <img src="${order.productImage}" alt="Product Image" style="width: 60px; height: 60px; object-fit: cover; margin-right: 15px;">
                                                            <div class="flex-grow-1">
                                                                <p class="mb-1">${order.productName}</p>
                                                                <c:choose>
                                                                    <c:when test="${not empty order.option1Value}">
                                                                        <small class="text-muted">Phân loại: ${order.option1Value}
                                                                            <c:choose>
                                                                                <c:when test="${not empty order.option2Value}">
                                                                                    , ${order.option2Value}
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </small><br>

                                                                    </c:when>
                                                                </c:choose>
                                                                <small class="text-muted">x${order.quantity}</small>

                                                            </div>
                                                            <div class="text-end">
                                                                <fmt:formatNumber var="fmtProductPrice" value="${order.productPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                                                <span class="fw-bold">${fmtProductPrice}</span>
                                                            </div>
                                                        </div>
                                                        <!-- Order Details -->
                                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                                            <small class="text-muted">Ngày đặt hàng: ${order.invoiceDate}</small>
                                                            <small class="text-muted">Mã đơn hàng: ${order.id}</small>
                                                        </div>
                                                        <!-- Total and Actions -->
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div>
                                                                <strong>Thành tiền:</strong>
                                                                <fmt:formatNumber var="fmtTotal" value="${order.total}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                                                <span class="text-danger fw-bold fs-5">${fmtTotal}</span>
                                                            </div>
                                                            <div>
                                                                <c:if test="${order.status == 'COMPLETED'}">
                                                                    <button
                                                                            class="btn btn-review"
                                                                            style="background-color: #007b5f !important; color: white"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#feedback-form"
                                                                            data-id-product="${order.idProduct}"
                                                                            data-id-variant="${order.idVariant}"
                                                                            data-product-name="${order.productName}"
                                                                            data-product-image="${order.productImage}"
                                                                            data-product-option="${order.option1Value} ${order.option2Value}">
                                                                        Đánh Giá
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${order.status == 'CANCELLED' || order.status == 'COMPLETED'}">
                                                                    <button class="btn btn-danger" onclick="window.location.href='product-detail?id=${order.idProduct}'">Mua Lại</button>
                                                                </c:if>
                                                                <c:if test="${order.status == 'AWAITING'}">
                                                                    <button class="btn btn-outline-secondary ms-2">Xem Chi Tiết Đơn</button>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <!--######### MODAL ########-->
    <!-- Modal edit phone -->
    <div class="modal fade" tabindex="-1" id="modal-edit-phone">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Chỉnh sửa số điện thoại</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="" id="form-edit-phone">
                        <label for="edit-phone">Số điện thoại mới</label>
                        <input type="tel" autocomplete="none" name="edit-phone" id="edit-phone"
                               class="form-control mb-2" placeholder="Nhập số điện thoại mới"
                               oninput="validateInputPhoneNumber()" required>
                        <div id="phone-number-error" class="text-danger" style="display: none;">Số điện thoại không hợp lệ.</div>
                        <label for="OTP-code">Nhập mã xác thực</label>
                        <input type="text" autocomplete="none" name="OTP-code" id="OTP-code" class="form-control" placeholder="Nhập mã OTP" required>
                    </form>
                    <button type="button" id="send-otp" class="btn btn-primary mt-2">Gửi mã OTP</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại</button>
                    <button type="submit" form="form-edit-phone" class="btn custom-btn-primary">Lưu thay đổi</button>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal edit email -->
    <div class="modal fade" tabindex="-1" id="modal-edit-email">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Chỉnh sửa email</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="" id="form-edit-email">
                        <label for="edit-email">Nhập email mới</label>
                        <input type="email" autocomplete="none" name="edit-email"
                               id="edit-email" class="form-control mb-2"
                               oninput="validateInputEmail()" placeholder="Nhập email mới" required>
                        <div id="email-error" class="text-danger" style="display: none;">Email không hợp lệ.</div>

                        <label for="OTP-email-code">Nhập mã xác thực</label>
                        <input type="text" autocomplete="none" name="OTP-email-code" id="OTP-email-code" class="form-control" placeholder="Nhập mã OTP" required>
                    </form>
                    <button type="button" id="send-email-otp" class="btn btn-primary mt-2">Gửi mã OTP</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại</button>
                    <button type="submit" form="form-edit-email" class="btn custom-btn-primary">Lưu thay đổi</button>
                </div>
            </div>
        </div>
    </div>



    <!-- Modal Address -->
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

<%--    model đánh giá--%>
    <div class="modal fade" tabindex="-1" id="feedback-form" >
        <div class="modal-dialog modal-dialog-centered" style="min-width: 60%">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Đánh giá sản phẩm</h4>

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/product-review" id="form-feedback" method="post">
                        <div class="container mb-5">
                            <!-- Thông tin sản phẩm -->
                            <div class="d-flex align-items-center border rounded p-3 mb-3">
                                <img class="product-image" src="https://www.gento.vn/wp-content/uploads/2024/07/vi-nam-da-ca-sau8.jpg" class="me-3 rounded" alt="sản phẩm"
                                     style="width: 50px">
                                <div>
                                    <strong class="product-name">Ví gấp nam da cá sấu V7068</strong><br>
                                    <span class="product-types text-muted small">Phân loại hàng: Da lưng</span>
                                </div>
                            </div>

                            <!-- Chất lượng sản phẩm -->
                            <div class="mb-3">
                                <div id="product-rating" class="text-warning fs-4">
                                    <i class="fa-regular fa-star" data-value="1"></i>
                                    <i class="fa-regular fa-star" data-value="2"></i>
                                    <i class="fa-regular fa-star" data-value="3"></i>
                                    <i class="fa-regular fa-star" data-value="4"></i>
                                    <i class="fa-regular fa-star" data-value="5"></i>
                                    <span class="ms-2" id="rating-label">Chưa đánh giá</span>
                                </div>
                            </div>

                            <input type="hidden" class="form-control" name="id-product" >

                            <input type="hidden" class="form-control" name="id-variant" >

                            <!-- Chất lượng sản phẩm -->
                            <div class="mb-3">
                                <label class="product-quality mb-2"><strong>Chất lượng sản phẩm:</strong></label>
                                <input type="text" class="form-control" id="product-quality" name="product-quality"
                                       placeholder="Hãy để lại đánh giá.">
                            </div>

                            <!-- Đúng với mô tả -->
                            <div class="mb-3">
                                <label class="match-description mb-2"><strong>Đúng với mô tả:</strong></label>
                                <input type="text" class="form-control" id="match-description" name="match-description"
                                       placeholder="Hãy để lại đánh giá.">
                            </div>

                            <!-- Nội dung đánh giá -->
                            <div class="mb-3">
                                <label class="form-label"><strong>Nhận xét:</strong></label>
                                <textarea class="form-control" rows="4" name="review-text"
                                          placeholder="Hãy chia sẻ những điều bạn thích về sản phẩm này với những người mua khác nhé."></textarea>
                            </div>

                            <!-- Upload -->
                            <div class="mb-3 d-flex gap-2">
                                <button class="btn btn-outline-danger btn-sm"><i class="fa-solid fa-camera"></i> Thêm Hình ảnh</button>
                            </div>

                            <!-- Tùy chọn -->
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" id="showName" checked>
                                <label class="form-check-label" for="showName">
                                    Hiển thị tên đăng nhập trên đánh giá này
                                    <div class="text-muted small">Tên tài khoản sẽ hiển thị như <strong>${sessionScope.fullName}</strong></div>
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- Nút -->
                <div class="modal-footer d-flex justify-content-end gap-2">
                    <button class="btn btn-danger" data-bs-dismiss="modal" aria-label="Close">TRỞ LẠI</button>
                    <button type="submit" form="form-feedback" class="btn" style="background-color: #007b5f !important; color: white">HOÀN THÀNH</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JS xử lý chọn sao -->
<script>
    const stars = document.querySelectorAll('#product-rating i');
    const ratingLabel = document.getElementById('rating-label');
    const ratingText = ['Tệ', 'Không hài lòng', 'Bình thường', 'Hài lòng', 'Tuyệt vời'];

    stars.forEach((star, index) => {
        star.addEventListener('click', () => {
            stars.forEach((s, i) => {
                s.classList.toggle('fa-solid', i <= index);
                s.classList.toggle('fa-regular', i > index);
            });
            ratingLabel.textContent = ratingText[index];
        });
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const reviewButtons = document.querySelectorAll(".btn-review");

        reviewButtons.forEach(button => {
            button.addEventListener("click", function () {
                const idProduct = this.dataset.idProduct;
                const idVariant = this.dataset.idVariant;
                const productName = this.dataset.productName;
                const productImage = this.dataset.productImage;
                const productOption = this.dataset.productOption;

                const modal = document.getElementById("feedback-form");
                modal.querySelector('input[name="id-product"]').value = idProduct;
                modal.querySelector('input[name="id-variant"]').value = idVariant;

                modal.querySelector(".modal-body strong").textContent = productName;

                modal.querySelector("img").src = productImage;

                modal.querySelector(".text-muted.small").textContent = "Phân loại hàng: " + productOption;



            });
        });
    });
</script>

<script>
    function getReviewFormData() {
        const form = document.getElementById('form-feedback');

        // Lấy đánh giá sao
        const stars = form.querySelectorAll('#product-rating i');
        let rating = 0;
        stars.forEach(star => {
            if (star.classList.contains('fa-solid')) {
                rating++;
            }
        });

        const productId = form.querySelector('input[name="id-product"]')?.value;
        const variantId = form.querySelector('input[name="id-variant"]')?.value;

        const quality = form.querySelector('input[name="product-quality"]')?.value.trim();
        const descriptionMatch = form.querySelector('input[name="match-description"]')?.value.trim();
        const reviewText = form.querySelector('textarea[name="review-text"]')?.value.trim();

        const showName = form.querySelector('#showName')?.checked;

        return {
            productId,
            variantId,
            rating,
            quality,
            descriptionMatch,
            reviewText,
            showName
        };
    }

    const productReview = async (url, data) => {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        });
        return response.json();
    }

    document.getElementById('form-feedback').addEventListener('submit', async function(e) {
        e.preventDefault();

        const data = getReviewFormData();

        if (data.rating === 0) {
            Swal.fire({
                icon: 'warning',
                title: 'Thiếu đánh giá sao',
                text: 'Vui lòng chọn số sao để đánh giá sản phẩm.',
            });
            return;
        }

        try {
            const response = await productReview("/product-review", data);

            if (response.status === "success") {
                Swal.fire({
                    icon: 'success',
                    title: "Đánh giá thành công",
                    text: response.message,
                    confirmButtonText: 'OK',
                }).then(() => {
                    window.location.reload();
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: "Lỗi",
                    text: response.message,
                });
            }

        } catch (error) {
            Swal.fire({
                icon: 'error',
                title: "Lỗi kết nối",
                text: "Không thể gửi đánh giá. Vui lòng thử lại sau.",
            });
            console.error("Lỗi khi gửi đánh giá:", error);
        }
    });



</script>


