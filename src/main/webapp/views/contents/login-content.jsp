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
            <form id="loginForm" class="d-grid gap-4" action="<c:url value='/login'/>" method="post">
                <input class="form-control d-none" type="text" id="forwardUrl" name="forwardUrl"
                       value="${requestScope.forwardUrl}">
                <input class="form-control" type="text" id="username" name="username" placeholder="Nhập Email hoặc số điện thoại"
                       required>
                <input class="form-control" type="password" id="password" name="password" placeholder="Nhập mật khẩu"
                       required>
                <div class="g-recaptcha"
                     data-sitekey="6Le5eOsqAAAAAP1g0oVT2AQyKqXMnbibrG4SgAzL"
                     data-callback="enableSubmit"></div>
                <button type="submit" id="submitBtn" class="btn custom-btn-primary btn-block w-100 p-2" disabled>Đăng Nhập</button>
                <div class="d-flex justify-content-between mt-2">
                    <a href="<c:url value="/forget-password"/>" class="custom-text-primary text-decoration-none">Quên Mật Khẩu</a>
                    <a href="#" class="custom-text-primary text-decoration-none">Đăng Nhập Bằng SMS</a>
                </div>
                <div class="d-flex align-items-center justify-content-center">
                    <div style="height: 1px; background-color: #dbdbdb; width: 100%"></div>
                    <div class="px-2" style="color: #ccc">HOẶC</div>
                    <div style="height: 1px; background-color: #dbdbdb; width: 100%"></div>
                </div>
                <div class="d-flex gap-3 justify-content-between mt-3">
                    <a href="#" class="d-flex flex-grow-1 align-items-center justify-content-center text-decoration-none border p-2" id="facebook-login-link">
                        <div class="custom-icon" id="facebook-login-btn" style="--size: 2rem">
                            <!-- Icon Facebook -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 48 48">
                                <path fill="#039be5" d="M24 5A19 19 0 1 0 24 43A19 19 0 1 0 24 5Z"></path>
                                <path fill="#fff" d="M26.572,29.036h4.917l0.772-4.995h-5.69v-2.73c0-2.075,0.678-3.915,2.619-3.915h3.119v-4.359c-0.548-0.074-1.707-0.236-3.897-0.236c-4.573,0-7.254,2.415-7.254,7.917v3.323h-4.701v4.995h4.701v13.729C22.089,42.905,23.032,43,24,43c0.875,0,1.729-0.08,2.572-0.194V29.036z"></path>
                            </svg>
                        </div>
                        <span class="text-black ps-1">Facebook</span>
                    </a>
                    <a href="#" class="d-flex flex-grow-1 align-items-center justify-content-center text-decoration-none border p-2" id="google-login-link">
                        <div class="custom-icon" id="google-login-btn" style="--size: 2rem">
                            <!-- Icon Google -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 48 48">
                                <path fill="#fbc02d" d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12	s5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24s8.955,20,20,20	s20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"></path>
                                <path fill="#e53935" d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039	l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"></path>
                                <path fill="#4caf50" d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36	c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"></path>
                                <path fill="#1565c0" d="M43.611,20.083L43.595,20L42,20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571	c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"></path>
                            </svg>
                        </div>
                        <span class="text-black ps-1">Google</span>
                    </a>
                </div>
                <div>
                    <p class="text-center">Bạn Chưa Có Tài Khoản? <a href="${pageContext.request.contextPath}/signup" class="custom-text-primary">Đăng Ký</a> Ngay</p>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Firebase SDK - Sử dụng cú pháp module đúng cách -->
<script type="module">
    import {initializeApp} from "https://www.gstatic.com/firebasejs/11.4.0/firebase-app.js";
    import {getAuth, GoogleAuthProvider, signInWithPopup, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/11.4.0/firebase-auth.js";

    // Firebase configuration
    const firebaseConfig = {
        apiKey: "AIzaSyAN1bs13AN-4mMYf3pzTDH99643kZe41uM",
        authDomain: "crocodile-bd209.firebaseapp.com",
        projectId: "crocodile-bd209",
        storageBucket: "crocodile-bd209.firebasestorage.app",
        messagingSenderId: "653977599527",
        appId: "1:653977599527:web:01f54465f4d33e39f75802"
    };

    // Initialize Firebase
    const app = initializeApp(firebaseConfig);
    const auth = getAuth(app);
    const provider = new GoogleAuthProvider();

    // Đợi DOM load xong trước khi thêm event listeners
    document.addEventListener('DOMContentLoaded', function() {
        console.log('DOM loaded, initializing Google login...');

        // Google Sign-In - Lấy cả link và button
        const googleLoginLink = document.getElementById('google-login-link');
        const googleLoginBtn = document.getElementById('google-login-btn');

        if (googleLoginLink) {
            googleLoginLink.addEventListener('click', function(e) {
                e.preventDefault();
                console.log('Google login clicked');
                handleGoogleLogin();
            });
        }

        if (googleLoginBtn) {
            googleLoginBtn.addEventListener('click', function(e) {
                e.preventDefault();
                console.log('Google login button clicked');
                handleGoogleLogin();
            });
        }
    });

    function handleGoogleLogin() {
        const googleLoginLink = document.getElementById('google-login-link');
        if (!googleLoginLink) {
            console.error('Google login element not found');
            return;
        }

        // Hiển thị loading state
        const originalHTML = googleLoginLink.innerHTML;
        googleLoginLink.innerHTML = `
            <div class="d-flex align-items-center justify-content-center">
                <div class="spinner-border spinner-border-sm me-2" role="status"></div>
                <span>Đang đăng nhập...</span>
            </div>
        `;
        googleLoginLink.style.pointerEvents = 'none';

        // Cấu hình provider
        provider.addScope('email');
        provider.addScope('profile');

        console.log('Starting Google sign in...');

        signInWithPopup(auth, provider)
            .then((result) => {
                const user = result.user;
                console.log('User info:', user);
                console.log('User email:', user.email);
                console.log('User name:', user.displayName);

                // Lấy ID token
                return user.getIdToken();
            })
            .then((idToken) => {
                console.log('ID Token received, sending to server...');
                // Gửi token đến server
                sendTokenToServer(idToken);
            })
            .catch((error) => {
                console.error('Error during sign in:', error);
                console.error('Error code:', error.code);
                console.error('Error message:', error.message);

                // Khôi phục trạng thái button
                googleLoginLink.innerHTML = originalHTML;
                googleLoginLink.style.pointerEvents = 'auto';

                // Hiển thị lỗi user-friendly
                let errorMessage = 'Đăng nhập thất bại. Vui lòng thử lại.';
                switch(error.code) {
                    case 'auth/popup-closed-by-user':
                        errorMessage = 'Đăng nhập bị hủy bỏ.';
                        break;
                    case 'auth/popup-blocked':
                        errorMessage = 'Popup bị chặn. Vui lòng cho phép popup và thử lại.';
                        break;
                    case 'auth/network-request-failed':
                        errorMessage = 'Lỗi kết nối mạng. Vui lòng kiểm tra internet và thử lại.';
                        break;
                    case 'auth/unauthorized-domain':
                        errorMessage = 'Domain này chưa được cấu hình trong Firebase. Vui lòng liên hệ quản trị viên.';
                        break;
                    default:
                        errorMessage = 'Đăng nhập thất bại: ' + error.message;
                }

                // Hiển thị thông báo lỗi
                showErrorMessage(errorMessage);
            });
    }

    function sendTokenToServer(idToken) {
        console.log('Preparing to send token to server...');

        // Tạo form để gửi POST request
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '${pageContext.request.contextPath}/google-login';
        form.style.display = 'none';

        // Thêm ID token
        const tokenInput = document.createElement('input');
        tokenInput.type = 'hidden';
        tokenInput.name = 'idToken';
        tokenInput.value = idToken;

        // Thêm forward URL (nếu có)
        const forwardUrlInput = document.createElement('input');
        forwardUrlInput.type = 'hidden';
        forwardUrlInput.name = 'forwardUrl';

        // Lấy URL chuyển hướng từ form hoặc URL hiện tại
        const forwardUrlElement = document.getElementById('forwardUrl');
        const currentUrl = new URL(window.location.href);
        const returnUrl = currentUrl.searchParams.get('returnUrl');

        if (forwardUrlElement && forwardUrlElement.value) {
            forwardUrlInput.value = forwardUrlElement.value;
        } else if (returnUrl && returnUrl !== '/login') {
            forwardUrlInput.value = returnUrl;
        } else {
            // Mặc định chuyển về trang chủ
            forwardUrlInput.value = '${pageContext.request.contextPath}/';
        }

        form.appendChild(tokenInput);
        form.appendChild(forwardUrlInput);
        document.body.appendChild(form);

        console.log('Submitting form to server with action:', form.action);
        form.submit();
    }

    function showErrorMessage(message) {
        console.log('Showing error message:', message);

        // Kiểm tra xem đã có thông báo lỗi chưa
        let errorDiv = document.getElementById('google-login-error');

        if (!errorDiv) {
            // Tạo div thông báo lỗi mới
            errorDiv = document.createElement('div');
            errorDiv.id = 'google-login-error';
            errorDiv.className = 'alert alert-danger mt-3';
            errorDiv.style.display = 'none';

            // Thêm vào trong form
            const form = document.getElementById('loginForm');
            if (form) {
                form.appendChild(errorDiv);
            }
        }

        errorDiv.innerHTML = `
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            ${message}
        `;
        errorDiv.style.display = 'block';

        // Tự động ẩn sau 5 giây
        setTimeout(() => {
            errorDiv.style.display = 'none';
        }, 5000);
    }

    // Xử lý trạng thái đăng nhập khi trang load
    onAuthStateChanged(auth, (user) => {
        if (user) {
            console.log('User is signed in:', user.email);
        } else {
            console.log('User is signed out');
        }
    });

    // Export functions để có thể sử dụng từ scripts khác nếu cần
    window.firebaseAuth = {
        auth: auth,
        handleGoogleLogin: handleGoogleLogin
    };
</script>

<script>
    // Quản lý số lần đăng nhập sai và hiển thị captcha
    document.addEventListener('DOMContentLoaded', function() {
        console.log('Initializing login attempts management...');

        const LOGIN_ATTEMPTS_KEY = 'loginAttempts';
        const MAX_ATTEMPTS_BEFORE_CAPTCHA = 3;

        const loginForm = document.getElementById('loginForm');
        const captchaDiv = document.querySelector('.g-recaptcha');
        const submitBtn = document.getElementById('submitBtn');

        function getLoginAttempts() {
            return parseInt(sessionStorage.getItem(LOGIN_ATTEMPTS_KEY) || '0');
        }

        function setLoginAttempts(attempts) {
            sessionStorage.setItem(LOGIN_ATTEMPTS_KEY, attempts.toString());
        }

        function clearLoginAttempts() {
            sessionStorage.removeItem(LOGIN_ATTEMPTS_KEY);
        }

        function toggleCaptcha() {
            const attempts = getLoginAttempts();
            console.log('Current login attempts:', attempts);

            if (attempts < MAX_ATTEMPTS_BEFORE_CAPTCHA) {
                captchaDiv.style.display = 'none';
                submitBtn.disabled = false;
            } else {
                captchaDiv.style.display = 'block';
                submitBtn.disabled = true;
                console.log('Captcha enabled due to multiple failed attempts');
            }
        }

        function checkLoginError() {
            const urlParams = new URLSearchParams(window.location.search);
            const hasError = urlParams.get('error') === 'true' || '${requestScope.errorMessage}' !== '';
            if (hasError) {
                const currentAttempts = getLoginAttempts();
                setLoginAttempts(currentAttempts + 1);
                console.log('Login error detected, attempts increased to:', currentAttempts + 1);
            }
        }

        function initialize() {
            checkLoginError();
            toggleCaptcha();
        }

        if (loginForm) {
            loginForm.addEventListener('submit', function(e) {
                const attempts = getLoginAttempts();
                if (attempts >= MAX_ATTEMPTS_BEFORE_CAPTCHA) {
                    if (typeof grecaptcha !== 'undefined') {
                        const recaptchaResponse = grecaptcha.getResponse();
                        if (!recaptchaResponse) {
                            e.preventDefault();
                            alert('Vui lòng hoàn thành captcha để tiếp tục.');
                            return false;
                        }
                    } else {
                        console.warn('reCAPTCHA not loaded');
                    }
                }
            });
        }

        initialize();
    });

    function enableSubmit() {
        const submitBtn = document.getElementById("submitBtn");
        if (submitBtn) {
            submitBtn.disabled = false;
        }
    }

    // Thêm debug function để kiểm tra
    function debugGoogleLogin() {
        console.log('Debug Google Login:');
        console.log('Google login link:', document.getElementById('google-login-link'));
        console.log('Google login btn:', document.getElementById('google-login-btn'));
        console.log('Firebase auth available:', typeof window.firebaseAuth !== 'undefined');

        if (window.firebaseAuth) {
            console.log('Firebase auth object:', window.firebaseAuth);
        }
    }

    // Gọi debug sau khi trang load
    window.addEventListener('load', function() {
        setTimeout(debugGoogleLogin, 1000);
    });
    document.addEventListener('DOMContentLoaded', function() {
        // Kiểm tra thông báo thành công từ URL
        const urlParams = new URLSearchParams(window.location.search);
        const loginSuccess = urlParams.get('login');
        const loginMethod = urlParams.get('method');

        if (loginSuccess === 'success') {
            let message = 'Đăng nhập thành công!';
            if (loginMethod === 'google') {
                message = 'Đăng nhập Google thành công!';
            }

            // Hiển thị thông báo thành công
            showSuccessMessage(message);

            // Xóa parameters khỏi URL để tránh hiển thị lại khi refresh
            const newUrl = window.location.origin + window.location.pathname;
            window.history.replaceState({}, document.title, newUrl);
        }
    });

    function showSuccessMessage(message) {
        // Tạo toast notification
        const toast = document.createElement('div');
        toast.className = 'toast align-items-center text-white bg-success border-0 position-fixed';
        toast.style.cssText = `
        top: 20px;
        right: 20px;
        z-index: 9999;
        min-width: 300px;
    `;
        toast.setAttribute('role', 'alert');
        toast.setAttribute('aria-live', 'assertive');
        toast.setAttribute('aria-atomic', 'true');

        toast.innerHTML = `
        <div class="d-flex">
            <div class="toast-body">
                <i class="bi bi-check-circle-fill me-2"></i>
                ${message}
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    `;

        document.body.appendChild(toast);

        // Hiển thị toast
        const bsToast = new bootstrap.Toast(toast, {
            autohide: true,
            delay: 3000
        });
        bsToast.show();

        // Xóa element sau khi ẩn
        toast.addEventListener('hidden.bs.toast', function() {
            toast.remove();
        });
    }

    // Thêm CSS cho toast nếu Bootstrap toast không có sẵn
    if (!window.bootstrap || !window.bootstrap.Toast) {
        console.warn('Bootstrap Toast not available, using simple alert');

        // Alternative simple notification
        window.showSuccessMessage = function(message) {
            const alert = document.createElement('div');
            alert.className = 'alert alert-success alert-dismissible position-fixed';
            alert.style.cssText = `
            top: 20px;
            right: 20px;
            z-index: 9999;
            min-width: 300px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        `;

            alert.innerHTML = `
            <i class="bi bi-check-circle-fill me-2"></i>
            ${message}
            <button type="button" class="btn-close" onclick="this.parentElement.remove()"></button>
        `;

            document.body.appendChild(alert);

            // Tự động ẩn sau 3 giây
            setTimeout(() => {
                if (alert.parentElement) {
                    alert.remove();
                }
            }, 3000);
        };
    }
</script>