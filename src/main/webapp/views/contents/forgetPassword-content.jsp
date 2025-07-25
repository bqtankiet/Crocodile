<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<div id="page" class="bg-light" style="height: 100vh">
    <div class="container-fluid d-flex flex-column flex-wrap justify-content-center align-items-center gap-4 py-5">
        <a class="mb-5" tabindex="-1" href="<c:url value="/"/>">
            <img src="https://www.crocodileinternational.com/img/crocodile-logo-1609222037.jpg"
                 class="img-fluid"
                 style="max-width: 100%; height: auto;"
                 alt="Logo">
        </a>
        <div class="card shadow-sm card-custom shadow-lg p-3">
            <div class="card-body">
                <h3 class="card-title mb-3 text-center custom-text-primary">Hỗ trợ lấy lại mật khẩu</h3>
                <div style="height: 2px; background-color: #dbdbdb; width: 100%;"></div>
                <p class="text-center mt-3">Vui lòng nhập email đã được liên kết với tài khoản
                    Crocodile của bạn.</p>
                <form id="forgotPasswordForm" method="post" action="<c:url value='/forget-password'/>">
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" name="email"
                               placeholder="example@gmail.com" required>
                    </div>

                    <div class="d-flex justify-content-center gap-4">
                        <a href="<c:url value='/login'/>" class="btn btn-secondary">Trở về</a>
                        <button type="submit" class="btn custom-btn-primary" id="sendCodeBtn">Gửi Mã</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmationModalLabel">Thông Báo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Link đổi mật khẩu đã được gửi tới email của bạn.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn custom-btn-primary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="errorModalLabel">Thông Báo Lỗi</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Email bạn nhập không tồn tại trong hệ thống. Vui lòng nhập lại email chính xác.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn custom-btn-primary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="emptyTokenModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="emptyTokenModalLabel">Thông Báo Lỗi</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn chưa thể truy cập vào trang web này ngay lúc này. Hãy thử vào lúc khác!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn custom-btn-primary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    // Tự động hiển thị modal khi load trang nếu có thông báo
    window.onload = function () {
        <c:if test="${not empty success}">
        var confirmationModal = new bootstrap.Modal(document.getElementById('confirmationModal'));
        confirmationModal.show();
        </c:if>
        <c:if test="${not empty error}">
        var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
        errorModal.show();
        </c:if>
        <c:if test="${not empty showEmptyTokenModal}">
        var emptyTokenModal = new bootstrap.Modal(document.getElementById('emptyTokenModal'));
        emptyTokenModal.show();
        </c:if>
    }
</script>


</html>
