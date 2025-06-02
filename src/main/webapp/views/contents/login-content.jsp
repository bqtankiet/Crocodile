<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .g-recaptcha {
        display: none;
    }
</style>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<div id="page">
    <!-- Form đăng nhập -->
    <div class="container-fluid d-flex flex-wrap justify-content-center align-items-center gap-4 py-5">
        <!-- phần logo -->
        <div class="mb-4">
            <img src="https://www.crocodileinternational.com/img/crocodile-logo-1609222037.jpg"
                 class="img-fluid"
                 style="max-width: 100%; height: auto;"
                 alt="Logo">
        </div>
        <!-- phần đăng nhập -->
        <div class="card shadow p-4" style="width: 28rem">
            <h3 class="text-center mb-4">Đăng Nhập</h3>
            <%--            <c:url var="forwardUrl" value="${requestScope.forwardUrl}"/>--%>
            <form id="loginForm" class="d-grid gap-4" action="<c:url value='/login'/>" method="post">
                <input class="form-control d-none" type="text" id="forwardUrl" name="forwardUrl"
                       value="${requestScope.forwardUrl}">
                <%--                <h1>${requestScope.forwardUrl}</h1>--%>
                <input class="form-control" type="text" id="username" name="username" placeholder="Nhập Email hoặc số điện thoại"
                       required>
                <input class="form-control" type="password" id="password" name="password" placeholder="Nhập mật khẩu"
                       required>
                <%-- thêm bảo mật reCaptcha vào phần đăng nhập--%>
                <div class="g-recaptcha"
                     data-sitekey="6Le5eOsqAAAAAP1g0oVT2AQyKqXMnbibrG4SgAzL"
                     data-callback="enableSubmit"></div>
                <button type="submit" id="submitBtn" class="btn custom-btn-primary btn-block w-100 p-2" disabled>Đăng
                    Nhập
                </button>
                <div class="d-flex justify-content-between mt-2">
                    <a href="<c:url value="/forget-password"/>"
                       class="custom-text-primary text-decoration-none">Quên Mật
                        Khẩu</a>
                    <a href="#" class="custom-text-primary text-decoration-none">Đăng Nhập Bằng SMS</a>
                </div>
                <div class="d-flex align-items-center justify-content-center">
                    <div style="height: 1px; background-color: #dbdbdb; width: 100%"></div>
                    <div class="px-2" style="color: #ccc">HOẶC</div>
                    <div style="height: 1px; background-color: #dbdbdb; width: 100%"></div>
                </div>
                <div class="d-flex gap-3 justify-content-between mt-3">
                    <a
                            target="_blank"
                            class="d-flex flex-grow-1 align-items-center justify-content-center text-decoration-none border p-2">
                        <div class="custom-icon" id="facebook-login-btn" style="--size: 2rem">
                            <!-- Icon Facebook -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 48 48">
                                <path fill="#039be5" d="M24 5A19 19 0 1 0 24 43A19 19 0 1 0 24 5Z"></path>
                                <path fill="#fff"
                                      d="M26.572,29.036h4.917l0.772-4.995h-5.69v-2.73c0-2.075,0.678-3.915,2.619-3.915h3.119v-4.359c-0.548-0.074-1.707-0.236-3.897-0.236c-4.573,0-7.254,2.415-7.254,7.917v3.323h-4.701v4.995h4.701v13.729C22.089,42.905,23.032,43,24,43c0.875,0,1.729-0.08,2.572-0.194V29.036z"></path>
                            </svg>
                        </div>
                        <span class="text-black ps-1">Facebook</span>
                    </a>
                    <a
                            target="_blank"
                            class="d-flex flex-grow-1 align-items-center justify-content-center text-decoration-none border p-2">
                        <div class="custom-icon" id="google-login-btn" style="--size: 2rem">
                            <!-- Icon Google -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 48 48">
                                <path fill="#fbc02d"
                                      d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12	s5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24s8.955,20,20,20	s20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"></path>
                                <path fill="#e53935"
                                      d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039	l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"></path>
                                <path fill="#4caf50"
                                      d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36	c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"></path>
                                <path fill="#1565c0"
                                      d="M43.611,20.083L43.595,20L42,20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571	c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"></path>
                            </svg>
                        </div>
                        <span class="text-black ps-1">Google</span>
                    </a>

                </div>
                <div>
                    <p class="text-center">Bạn Chưa Có Tài Khoản? <a
                            href="${pageContext.request.contextPath}/signup"
                            class="custom-text-primary ">Đăng
                        Ký </a> Ngay</p>
                </div>
            </form>
        </div>
    </div>

</div>

<script>
    // Quản lý số lần đăng nhập sai và hiển thị captcha
    document.addEventListener('DOMContentLoaded', function() {
        const LOGIN_ATTEMPTS_KEY = 'loginAttempts';
        const MAX_ATTEMPTS_BEFORE_CAPTCHA = 3;

        // Lấy các element cần thiết
        const loginForm = document.getElementById('loginForm');
        const captchaDiv = document.querySelector('.g-recaptcha');
        const submitBtn = document.getElementById('submitBtn');

        // Lấy số lần đăng nhập sai từ sessionStorage
        function getLoginAttempts() {
            return parseInt(sessionStorage.getItem(LOGIN_ATTEMPTS_KEY) || '0');
        }

        // Lưu số lần đăng nhập sai
        function setLoginAttempts(attempts) {
            sessionStorage.setItem(LOGIN_ATTEMPTS_KEY, attempts.toString());
        }

        // Xóa số lần đăng nhập sai (khi đăng nhập thành công)
        function clearLoginAttempts() {
            sessionStorage.removeItem(LOGIN_ATTEMPTS_KEY);
        }

        // Kiểm tra và ẩn/hiện captcha
        function toggleCaptcha() {
            const attempts = getLoginAttempts();

            if (attempts < MAX_ATTEMPTS_BEFORE_CAPTCHA) {
                // Ẩn captcha và enable submit button
                captchaDiv.style.display = 'none';
                submitBtn.disabled = false;
                console.log(`Số lần thử: ${attempts}/${MAX_ATTEMPTS_BEFORE_CAPTCHA} - Captcha ẩn`);
            } else {
                // Hiện captcha và disable submit button cho đến khi hoàn thành captcha
                captchaDiv.style.display = 'block';
                submitBtn.disabled = true;
                console.log(`Số lần thử: ${attempts}/${MAX_ATTEMPTS_BEFORE_CAPTCHA} - Captcha hiển thị`);
            }
        }

        // Kiểm tra xem có thông báo lỗi đăng nhập không
        function checkLoginError() {
            // Kiểm tra nếu có error message từ server (có thể thêm hidden input hoặc check URL params)
            const urlParams = new URLSearchParams(window.location.search);
            const hasError = urlParams.get('error') === 'true' ||
                document.querySelector('.alert-danger') !== null ||
                '${requestScope.errorMessage}' !== '';

            if (hasError) {
                const currentAttempts = getLoginAttempts();
                setLoginAttempts(currentAttempts + 1);
                console.log('Đăng nhập thất bại, tăng số lần thử lên:', currentAttempts + 1);
            }
        }

        // Khởi tạo khi trang load
        function initialize() {
            checkLoginError();
            toggleCaptcha();
        }

        // Xử lý khi form được submit
        loginForm.addEventListener('submit', function(e) {
            const attempts = getLoginAttempts();

            // Nếu >= 3 lần thử và captcha chưa được hoàn thành
            if (attempts >= MAX_ATTEMPTS_BEFORE_CAPTCHA) {
                const recaptchaResponse = grecaptcha.getResponse();
                if (!recaptchaResponse) {
                    e.preventDefault();
                    alert('Vui lòng hoàn thành captcha để tiếp tục.');
                    return false;
                }
            }

            console.log('Form submitted với số lần thử:', attempts);
        });

        // Khởi chạy
        initialize();
    });

    // Hàm được gọi khi captcha hoàn thành (callback từ reCAPTCHA)
    function enableSubmit() {
        const submitBtn = document.getElementById("submitBtn");
        if (submitBtn) {
            submitBtn.disabled = false;
            console.log('Captcha hoàn thành - Enable submit button');
        }
    }

    // Hàm để reset số lần thử (có thể gọi khi đăng nhập thành công)
    function resetLoginAttempts() {
        sessionStorage.removeItem('loginAttempts');
        console.log('Đã reset số lần đăng nhập sai');
    }

    // Hàm để kiểm tra trạng thái hiện tại (dành cho debug)
    function checkCurrentStatus() {
        const attempts = parseInt(sessionStorage.getItem('loginAttempts') || '0');
        const captchaVisible = document.querySelector('.g-recaptcha').style.display !== 'none';
        console.log('Trạng thái hiện tại:', {
            attempts: attempts,
            captchaVisible: captchaVisible,
            maxAttempts: 3
        });
    }
</script>
