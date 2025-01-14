<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    .tooltip-custom .tooltip-inner {
        background-color: white;
        color: black;
        border: 1px solid #339933;
        padding: 8px;
        font-weight: bold;
        border-radius: 5px;
    }

    .eye-icon {
        width: 24px;
        height: 24px;
        cursor: pointer;
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
    }
</style>
<div id="page">
    <div class="container-fluid d-flex justify-content-center align-items-center flex-wrap gap-4 py-5">
        <div class="mb-4">
            <img src="https://www.crocodileinternational.com/img/crocodile-logo-1609222037.jpg"
                 class="img-fluid"
                 style="max-width: 100%; height: auto;"
                 alt="Logo">
        </div>
        <div class="card shadow-sm" style="height: 23rem; width: 30rem">
            <div class="card-body">
                <h3 class="card-title mb-3 text-center">Đặt Lại Mật Khẩu</h3>
                <div style="height: 2px; background-color: #dbdbdb; width: 100%;"></div>
                <p class="text-center mt-3">Vui lòng nhập mật khẩu mới để đặt lại mật khẩu của bạn.</p>
                <form id="resetPasswordForm" class="d-grid gap-lg-4" action="<c:url value="/reset-password"/>"
                      method="post">

                    <!-- Trường nhập mật khẩu mới -->
                    <div class="position-relative mb-3">
                        <input
                                class="form-control"
                                type="password"
                                id="password"
                                name="password"
                                placeholder="Mật khẩu mới"
                                required
                                data-bs-toggle="tooltip"
                                data-bs-placement="top">
                        <span class="position-absolute top-50 end-0 translate-middle-y pe-3 eye-icon-container"
                              id="toggle-password"
                              onclick="togglePassword()">
        <svg id="eye-icon" class="eye-icon" viewBox="0 0 122.88 96.32">
            <path d="M104.54,23.28c6.82,6.28,12.8,14.02,17.67,22.87l0.67,1.22l-0.67,1.21c-6.88,12.49-15.96,22.77-26.48,29.86 c-8.84,5.95-18.69,9.67-29.15,10.59l6.73-11.66c5.25-1.42,10.24-3.76,14.89-6.9c8.18-5.51,15.29-13.45,20.79-23.1 c-2.98-5.22-6.43-9.94-10.26-14.05L104.54,23.28L104.54,23.28z M88.02,0l17.84,10.3L56.2,96.32l-17.83-10.3l0.69-1.2 c-4.13-1.69-8.11-3.83-11.9-6.38C16.62,71.35,7.55,61.07,0.67,48.59L0,47.37l0.67-1.22C7.55,33.67,16.62,23.39,27.15,16.3 C37.42,9.38,49.08,5.48,61.44,5.48c7.35,0,14.44,1.38,21.14,3.94L88.02,0L88.02,0L88.02,0z M44.36,75.63l5-8.67 c-5.94-3.78-9.89-10.42-9.89-17.99c0-11.77,9.54-21.31,21.31-21.31c3.56,0,6.92,0.87,9.87,2.42l6.61-11.44 c-5.04-1.85-10.35-2.85-15.83-2.85c-9.61,0-18.71,3.06-26.76,8.48c-8.18,5.51-15.29,13.45-20.8,23.11 c5.5,9.66,12.62,17.6,20.8,23.1C37.76,72.55,41,74.28,44.36,75.63L44.36,75.63z M63.93,41.74l6.73-11.66 c-1.82-0.95-3.77-1.64-5.79-2.03c-1.45,2.18-2.31,4.82-2.31,7.67C62.56,37.88,63.06,39.93,63.93,41.74L63.93,41.74L63.93,41.74z"></path>
        </svg>
    </span>
                    </div>
                    <!-- Trường nhập lại mật khẩu để xác nhận -->
                    <div class="position-relative">
                        <input
                                class="form-control"
                                type="password"
                                id="confirmPassword"
                                name="confirmPassword"
                                placeholder="Xác nhận mật khẩu mới"
                                required
                                data-bs-toggle="tooltip"
                                data-bs-placement="top">
                        <span class="position-absolute top-50 end-0 translate-middle-y pe-3"
                              id="toggle-confirm-password"
                              onclick="toggleConfirmPassword()">
        <svg id="confirm-eye-icon" class="eye-icon" viewBox="0 0 122.88 96.32">
            <path d="M104.54,23.28c6.82,6.28,12.8,14.02,17.67,22.87l0.67,1.22l-0.67,1.21c-6.88,12.49-15.96,22.77-26.48,29.86 c-8.84,5.95-18.69,9.67-29.15,10.59l6.73-11.66c5.25-1.42,10.24-3.76,14.89-6.9c8.18-5.51,15.29-13.45,20.79-23.1 c-2.98-5.22-6.43-9.94-10.26-14.05L104.54,23.28L104.54,23.28z M88.02,0l17.84,10.3L56.2,96.32l-17.83-10.3l0.69-1.2 c-4.13-1.69-8.11-3.83-11.9-6.38C16.62,71.35,7.55,61.07,0.67,48.59L0,47.37l0.67-1.22C7.55,33.67,16.62,23.39,27.15,16.3 C37.42,9.38,49.08,5.48,61.44,5.48c7.35,0,14.44,1.38,21.14,3.94L88.02,0L88.02,0L88.02,0z M44.36,75.63l5-8.67 c-5.94-3.78-9.89-10.42-9.89-17.99c0-11.77,9.54-21.31,21.31-21.31c3.56,0,6.92,0.87,9.87,2.42l6.61-11.44 c-5.04-1.85-10.35-2.85-15.83-2.85c-9.61,0-18.71,3.06-26.76,8.48c-8.18,5.51-15.29,13.45-20.8,23.11 c5.5,9.66,12.62,17.6,20.8,23.1C37.76,72.55,41,74.28,44.36,75.63L44.36,75.63z M63.93,41.74l6.73-11.66 c-1.82-0.95-3.77-1.64-5.79-2.03c-1.45,2.18-2.31,4.82-2.31,7.67C62.56,37.88,63.06,39.93,63.93,41.74L63.93,41.74L63.93,41.74z"></path>
        </svg>
    </span>
                    </div>
                    <div class="d-flex justify-content-center mt-4">
                        <button id="save-password-btn" type="submit" class="btn custom-btn-primary btn-block w-100 p-2"
                        >Đặt Lại
                            Mật Khẩu
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="successUpdateModal" tabindex="-1" aria-labelledby="successModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Thay đổi mật khẩu thành công!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Mật khẩu của bạn đã được thay đổi. Vui lòng đăng nhập lại!
                </div>
                <div class="modal-footer">
                    <button id="redirectLoginBtn" type="button" class="btn custom-btn-primary" data-bs-dismiss="modal">
                        Đóng
                    </button>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </c:if>

</div>
<script>
    let isPasswordVisible = false;
    let isConfirmPasswordVisible = false;

    function togglePassword() {
        const passwordInput = document.getElementById("password");
        const eyeIcon = document.getElementById("eye-icon");

        isPasswordVisible = !isPasswordVisible;
        passwordInput.type = isPasswordVisible ? "text" : "password";
        eyeIcon.innerHTML = isPasswordVisible

            ? `
<path d="M95.73,10.81c10.53,7.09,19.6,17.37,26.48,29.86l0.67,1.22l-0.67,1.21c-6.88,12.49-15.96,22.77-26.48,29.86 C85.46,79.88,73.8,83.78,61.44,83.78c-12.36,0-24.02-3.9-34.28-10.81C16.62,65.87,7.55,55.59,0.67,43.1L0,41.89l0.67-1.22 c6.88-12.49,15.95-22.77,26.48-29.86C37.42,3.9,49.08,0,61.44,0C73.8,0,85.45,3.9,95.73,10.81L95.73,10.81z M60.79,22.17l4.08,0.39 c-1.45,2.18-2.31,4.82-2.31,7.67c0,7.48,5.86,13.54,13.1,13.54c2.32,0,4.5-0.62,6.39-1.72c0.03,0.47,0.05,0.94,0.05,1.42 c0,11.77-9.54,21.31-21.31,21.31c-11.77,0-21.31-9.54-21.31-21.31C39.48,31.71,49.02,22.17,60.79,22.17L60.79,22.17L60.79,22.17z M109,41.89c-5.5-9.66-12.61-17.6-20.79-23.11c-8.05-5.42-17.15-8.48-26.77-8.48c-9.61,0-18.71,3.06-26.76,8.48 c-8.18,5.51-15.29,13.45-20.8,23.11c5.5,9.66,12.62,17.6,20.8,23.1c8.05,5.42,17.15,8.48,26.76,8.48c9.62,0,18.71-3.06,26.77-8.48 C96.39,59.49,103.5,51.55,109,41.89L109,41.89z"/>
`
            : `
<path d="M104.54,23.28c6.82,6.28,12.8,14.02,17.67,22.87l0.67,1.22l-0.67,1.21c-6.88,12.49-15.96,22.77-26.48,29.86 c-8.84,5.95-18.69,9.67-29.15,10.59l6.73-11.66c5.25-1.42,10.24-3.76,14.89-6.9c8.18-5.51,15.29-13.45,20.79-23.1 c-2.98-5.22-6.43-9.94-10.26-14.05L104.54,23.28L104.54,23.28z M88.02,0l17.84,10.3L56.2,96.32l-17.83-10.3l0.69-1.2 c-4.13-1.69-8.11-3.83-11.9-6.38C16.62,71.35,7.55,61.07,0.67,48.59L0,47.37l0.67-1.22C7.55,33.67,16.62,23.39,27.15,16.3 C37.42,9.38,49.08,5.48,61.44,5.48c7.35,0,14.44,1.38,21.14,3.94L88.02,0L88.02,0L88.02,0z M44.36,75.63l5-8.67 c-5.94-3.78-9.89-10.42-9.89-17.99c0-11.77,9.54-21.31,21.31-21.31c3.56,0,6.92,0.87,9.87,2.42l6.61-11.44 c-5.04-1.85-10.35-2.85-15.83-2.85c-9.61,0-18.71,3.06-26.76,8.48c-8.18,5.51-15.29,13.45-20.8,23.11 c5.5,9.66,12.62,17.6,20.8,23.1C37.76,72.55,41,74.28,44.36,75.63L44.36,75.63z M63.93,41.74l6.73-11.66 c-1.82-0.95-3.77-1.64-5.79-2.03c-1.45,2.18-2.31,4.82-2.31,7.67C62.56,37.88,63.06,39.93,63.93,41.74L63.93,41.74L63.93,41.74z"/>
`;
    }

    function toggleConfirmPassword() {
        const confirmPasswordInput = document.getElementById("confirmPassword");
        const confirmEyeIcon = document.getElementById("confirm-eye-icon");

        isConfirmPasswordVisible = !isConfirmPasswordVisible;
        confirmPasswordInput.type = isConfirmPasswordVisible ? "text" : "password";

        confirmEyeIcon.innerHTML = isConfirmPasswordVisible
            ? `
                <path d="M95.73,10.81c10.53,7.09,19.6,17.37,26.48,29.86l0.67,1.22l-0.67,1.21c-6.88,12.49-15.96,22.77-26.48,29.86 C85.46,79.88,73.8,83.78,61.44,83.78c-12.36,0-24.02-3.9-34.28-10.81C16.62,65.87,7.55,55.59,0.67,43.1L0,41.89l0.67-1.22 c6.88-12.49,15.95-22.77,26.48-29.86C37.42,3.9,49.08,0,61.44,0C73.8,0,85.45,3.9,95.73,10.81L95.73,10.81z M60.79,22.17l4.08,0.39 c-1.45,2.18-2.31,4.82-2.31,7.67c0,7.48,5.86,13.54,13.1,13.54c2.32,0,4.5-0.62,6.39-1.72c0.03,0.47,0.05,0.94,0.05,1.42 c0,11.77-9.54,21.31-21.31,21.31c-11.77,0-21.31-9.54-21.31-21.31C39.48,31.71,49.02,22.17,60.79,22.17L60.79,22.17L60.79,22.17z M109,41.89c-5.5-9.66-12.61-17.6-20.79-23.11c-8.05-5.42-17.15-8.48-26.77-8.48c-9.61,0-18.71,3.06-26.76,8.48 c-8.18,5.51-15.29,13.45-20.8,23.11c5.5,9.66,12.62,17.6,20.8,23.1c8.05,5.42,17.15,8.48,26.76,8.48c9.62,0,18.71-3.06,26.77-8.48 C96.39,59.49,103.5,51.55,109,41.89L109,41.89z"/>`
            : `
                <path d="M104.54,23.28c6.82,6.28,12.8,14.02,17.67,22.87l0.67,1.22l-0.67,1.21c-6.88,12.49-15.96,22.77-26.48,29.86 c-8.84,5.95-18.69,9.67-29.15,10.59l6.73-11.66c5.25-1.42,10.24-3.76,14.89-6.9c8.18-5.51,15.29-13.45,20.79-23.1 c-2.98-5.22-6.43-9.94-10.26-14.05L104.54,23.28L104.54,23.28z M88.02,0l17.84,10.3L56.2,96.32l-17.83-10.3l0.69-1.2 c-4.13-1.69-8.11-3.83-11.9-6.38C16.62,71.35,7.55,61.07,0.67,48.59L0,47.37l0.67-1.22C7.55,33.67,16.62,23.39,27.15,16.3 C37.42,9.38,49.08,5.48,61.44,5.48c7.35,0,14.44,1.38,21.14,3.94L88.02,0L88.02,0L88.02,0z M44.36,75.63l5-8.67 c-5.94-3.78-9.89-10.42-9.89-17.99c0-11.77,9.54-21.31,21.31-21.31c3.56,0,6.92,0.87,9.87,2.42l6.61-11.44 c-5.04-1.85-10.35-2.85-15.83-2.85c-9.61,0-18.71,3.06-26.76,8.48c-8.18,5.51-15.29,13.45-20.8,23.11 c5.5,9.66,12.62,17.6,20.8,23.1C37.76,72.55,41,74.28,44.36,75.63L44.36,75.63z M63.93,41.74l6.73-11.66 c-1.82-0.95-3.77-1.64-5.79-2.03c-1.45,2.18-2.31,4.82-2.31,7.67C62.56,37.88,63.06,39.93,63.93,41.74L63.93,41.74L63.93,41.74z"/>`;

    }

    // Hàm để hiển thị modal khi cập nhật thành công
    function showSuccessModal() {
        const successModal = new bootstrap.Modal(document.getElementById('successUpdateModal'));
        successModal.show();

        // Lắng nghe sự kiện khi modal đóng, chuyển hướng đến trang login
        document.getElementById('redirectLoginBtn').addEventListener('click', function () {
            window.location.href = 'login.html'; // Đường dẫn đến trang login
        });
    }

    // Gọi hàm showSuccessModal() khi cập nhật thành công
    // Ví dụ:
    // if (passwordUpdateSuccess) {
    //     showSuccessModal();
    // }

</script>
</html>
