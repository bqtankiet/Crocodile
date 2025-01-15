<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                    <%--                    <c:choose>--%>
                    <%--                        <c:when test="${not empty sessionScope.userName && not empty sessionScope.fullName}">--%>
                    <div class="col d-flex flex-column gap-1 justify-content-center">
                        <!-- Hiển thị fullName và userName từ session -->
                        <div class="fw-bold text-capitalize">${sessionScope.fullName}</div>
                        <div class="text-muted">#${sessionScope.userName}</div>
                    </div>
                    <%--                        </c:when>--%>
                    <%--                        <c:otherwise>--%>
                    <%--                            <!-- Hiển thị nếu chưa đăng nhập -->--%>
                    <%--                            <div class="col d-flex flex-column gap-1 justify-content-center">--%>
                    <%--                                <div class="fw-bold text-capitalize">Chưa đăng nhập</div>--%>
                    <%--                                <div class="text-muted">#N/A</div>--%>
                    <%--                            </div>--%>
                    <%--                        </c:otherwise>--%>
                    <%--                    </c:choose>--%>

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
                        <form action="<c:url value="/update-profile"/>" method="post" class="d-flex flex-column gap-4">
                            <div class="row">
                                <label for="username" class="col-form-label col-sm-2 text-muted">Tên đăng nhập</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext" id="username"
                                           value="${sessionScope.userName != null ? sessionScope.userName : ''}">
                                </div>
                            </div>
                            <div class="row">
                                <label for="fullname" class="col-form-label col-sm-2 text-muted">Họ và tên</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="fullname" name="fullname"
                                           value="${sessionScope.fullName != null ? sessionScope.fullName : ''}">
                                </div>
                            </div>
                            <div class="row">
                                <label for="email" class="col-form-label col-sm-2 text-muted">Email</label>
                                <div class="col-sm-10 d-flex align-items-center">
                                    <input type="text" class="form-control" id="email" name="email"
                                           value="${sessionScope.email != null ? sessionScope.email : ''}">
                                </div>
                            </div>

                            <div class="row">
                                <label class="col-form-label col-sm-2 text-muted">Giới tính</label>
                                <div class="col-sm-10">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender-male"
                                               value="Nam" ${sessionScope.gender == 'Nam' ? 'checked' : ''}>
                                        <label class="form-check-label" for="gender-male">Nam</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender-female"
                                               value="Nữ" ${sessionScope.gender == 'Nữ' ? 'checked' : ''}>
                                        <label class="form-check-label" for="gender-female">Nữ</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender-other"
                                               value="Khác" ${sessionScope.gender == 'Khác' ? 'checked' : ''}>
                                        <label class="form-check-label" for="gender-other">Khác</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <label for="phone-number" class="col-form-label col-sm-2 text-muted">Số điện
                                    thoại</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="phone-number" name="phone-number"
                                           value="${sessionScope.phone != null ? sessionScope.phone : ''}">
                                </div>
                            </div>

                            <div class="row">
                                <label for="birth-date" class="col-form-label col-sm-2 text-muted">Ngày sinh</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control-plaintext" id="birth-date" name="birth-date"
                                           value="${sessionScope.birthDate != null ? sessionScope.birthDate : ''}"
                                           style="width: min-content;">
                                </div>
                            </div>
                            <button type="submit" class="btn custom-btn-primary btn-block p-2 ms-auto w-100"
                                    style="width: max-content">Lưu thay đổi
                            </button>
                        </form>
                    </div>

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
                            <c:if test="${not empty success}">
                                <div class="alert alert-success">${success}</div>
                            </c:if>
                            <c:if test="${not empty fail}">
                                <div class="alert alert-danger">${fail}</div>
                            </c:if>
                        </form>
                    </div>

                    <div class="tab-pane fade" id="account-address">
                        <div class="card-body pb-2">
                            <div class="form-group">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h4 class="fw-semibold">Địa chỉ của tôi</h4>
                                    <button type="button" class="btn custom-btn-primary btn-block p-2 mb-3"
                                            data-bs-toggle="modal"
                                            data-bs-target="#newAddressModal">+ Thêm địa chỉ mới
                                    </button>
                                </div>
                                <div style="height: 1px; background-color: #dbdbdb; width: 100%"></div>
                            </div>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body pb-2">
                            <h6 class="mb-4">Địa Chỉ</h6>
                            <div id="addressList">
                                <c:forEach var="address" items="${requestScope.addressList}">
                                    <div class="mb-3">
                                        <h6 class="fw-bold">${address.fullname}</h6>
                                        <p class="mb-1">${address.street}, ${address.ward}, ${address.district}, ${address.province}</p>
                                        <p class="mb-1">Số điện thoại: ${address.phoneNumber}</p>
                                    </div>

                                </c:forEach>
                                <c:if test="${not empty message}">
                                    <div class="alert alert-info">${message}</div>
                                </c:if>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="account-purchase-order">
                            <div class="tab-header">
                                <h4 class="fw-semibold">Đơn mua </h4>
                                <hr>
                            </div>
                            <div class="tab-body d-grid gap-4">
                                <div class="order-item p-3 bg-secondary-subtle">
                                    <div class="order-info d-flex">
                                        <div>
                                            <span class="order-id">2406069WHSDP56</span>
                                            <span class="px-2">-</span>
                                            <span class="order-date col">
                                        10:22 01/01/2024
                                    </span>
                                        </div>
                                        <div class="order-status ms-auto">
                                            <span class="badge text-bg-danger">Hoàn thành</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="order-product row g-0">
                                        <div class="col-2 me-3 position-relative" style="width: 5em;">
                                            <div class="ratio ratio-1x1">
                                                <img src="https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-3.jpg"
                                                     class="img-fluid border rounded-2" alt="">
                                            </div>
                                        </div>
                                        <div class="col lh-1 my-auto">
                                            <div class="w-100">
                                                <div class="d-flex align-items-center">
                                                    <div class="me-2">
                                                        <p class="fw-semibold mb-0 line-clamp-2"
                                                           style="height: fit-content ;max-height: 2.5rem; line-height: 1.2">
                                                            Ví gấp nam da cá sấu V7068
                                                        </p>
                                                        <p class="text-muted mt-1 mb-0">Da trơn</p>
                                                    </div>
                                                    <div class="ms-auto fw-medium fs-6">1.100.000<sup>₫</sup> × 1</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="order-total">
                                        <div class="text-end">
                                            Thành tiền:
                                            <span class="fw-medium text-danger fs-5">1.100.000₫</span>
                                        </div>
                                    </div>
                                </div>
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
                        <input type="tel" autocomplete="none" name="edit-phone" id="edit-phone" class="form-control">
                    </form>
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
                        <input type="tel" autocomplete="none" name="edit-email" id="edit-email" class="form-control">
                    </form>
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
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">${errorMessage}</div>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script>
        // const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        // const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
        // document.getElementById('save-password-btn').addEventListener('click', function (event) {
        //     const newPassword = document.getElementById('new-password');
        //     const newPasswordCheck = document.getElementById('new-password-check');
        //     // Kiểm tra độ dài mật khẩu mới, có ít nhất 1 kí tự in hoa và số
        //     const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
        //     let isValid = true;
        //     // Tạo tooltip tùy chỉnh cho mật khẩu mới
        //     if (!passwordRegex.test(newPassword.value)) {
        //         new bootstrap.Tooltip(newPassword, {
        //             title: 'Mật khẩu phải chứa ít nhất 8 kí tự, bao gồm chữ viết hoa, số và kí tự đặc biệt',
        //             placement: 'right',
        //             trigger: 'manual',
        //             customClass: 'tooltip-custom' // Thêm lớp tùy chỉnh
        //         }).show();
        //         isValid = false;
        //     }
        //     // Kiểm tra mật khẩu mới và mật khẩu nhập lại có khớp không
        //     if (newPassword.value !== newPasswordCheck.value) {
        //         new bootstrap.Tooltip(newPasswordCheck, {
        //             title: 'Mật khẩu nhập lại không khớp với mật khẩu mới',
        //             placement: 'right',
        //             trigger: 'manual',
        //             customClass: 'tooltip-custom'
        //         }).show();
        //         isValid = false;
        //     }
        //     if (!isValid) {
        //         event.preventDefault();
        //     } else {
        //         bootstrap.Tooltip.getInstance(newPassword)?.hide();
        //         bootstrap.Tooltip.getInstance(newPasswordCheck)?.hide();
        //         const successModal = new bootstrap.Modal(document.getElementById('passwordChangeSuccessModal'));
        //         successModal.show();
        //     }
        //     newPassword.addEventListener('input', () => bootstrap.Tooltip.getInstance(newPassword)?.hide());
        //     newPasswordCheck.addEventListener('input', () => bootstrap.Tooltip.getInstance(newPasswordCheck)?.hide());
        // });


        function showValidationTooltips(fields) {
            Object.keys(fields).forEach(key => {
                const value = fields[key];
                const inputElement = document.getElementById(key);
                if (!value) {
                    // Gắn tooltip vào các trường bị thiếu
                    const tooltip = new bootstrap.Tooltip(inputElement, {
                        title: 'Vui lòng nhập thông tin này!',
                        placement: 'top',
                        trigger: 'manual',
                        customClass: 'tooltip-custom'
                    });
                    tooltip.show();
                    // Ẩn tooltip sau 3 giây
                    setTimeout(() => {
                        tooltip.dispose();
                    }, 3000);
                    inputElement.classList.add('is-invalid');
                } else {
                    inputElement.classList.remove('is-invalid');
                }
            });
        }

        // Hàm để xóa địa chỉ
        function removeAddress(button) {
            const addressCard = button.parentElement;
            addressCard.remove();
        }

        document.addEventListener('DOMContentLoaded', loadSampleAddresses);

        function getAuthorizationCode() {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get('code');

        }


    </script>
</div>