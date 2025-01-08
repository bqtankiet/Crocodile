<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .card {
        min-height: 40rem; /* Đảm bảo chiều cao tối thiểu của card */
        display: flex;
        flex-direction: column;
    }

    .error {
        color: #dc3545;
        font-size: 14px;
        margin-top: 10px;
        display: block; /* Hiển thị khi có lỗi */
    }

    .form-control {
        padding-right: 35px; /* Dự trữ không gian cho biểu tượng mắt */
    }

    /* Khi không có lỗi, ẩn phần tử .error */
    #error-message {
        display: none;
    }

    .eye-icon {
        width: 24px;
        height: 24px;
        cursor: pointer;
        position: absolute;
        top: 50%;
        right: 10px; /* Khoảng cách từ bên phải */
        transform: translateY(-50%); /* Căn giữa dọc */
    }
</style>
<div id="page">
    <div id="HEADER"></div>
    <div class="container-fluid d-flex flex-wrap justify-content-center align-items-center gap-5 "
         style="padding-top: 4rem; padding-bottom: 5rem">
        <!-- phần logo -->
        <div class="mb-4">
            <img src="https://www.crocodileinternational.com/img/crocodile-logo-1609222037.jpg"
                 class="img-fluid"
                 style="max-width: 100%; height: auto;"
                 alt="Logo">
        </div>
        <div class="d-flex card shadow p-4" style="width: 28rem">
            <h3 class="text-center mb-4">Đăng Ký</h3>
            <form id="signinform" class="d-grid gap-3">
                <div class="d-flex gap-4">
                    <input class="form-control p-1" id="name" placeholder="Họ " required type="text">
                    <input class="form-control p-1" type="text" id="lastname" placeholder="Tên" required>
                </div>
                <label for="signinform">Ngày Sinh</label>
                <div class="d-flex gap-4 mb-1">
                    <select class="form-select-sm flex-grow-1" id="day"></select>
                    <select class="form-select-sm flex-grow-1" id="month"></select>
                    <select class="form-select-sm flex-grow-1" id="year"></select>
                </div>
            </form>
            <form id="dateform" class="d-grid gap-2 mb-3">
                <label for="dateform">Giới Tính:</label>
                <div class="d-flex gap-4 align-items-center justify-content-around">
                    <label for="Male" class="d-flex  flex-grow-1 border p-2"
                           style="border-radius: 7px; cursor: pointer;">
                        <input class="form-check-input me-2" type="radio" id="Male" name="gender" value="male">
                        <span class="text-black ps-1">Nam</span>
                    </label>
                    <label for="Female" class="d-flex flex-grow-1 border p-2"
                           style="border-radius: 7px; cursor: pointer;">
                        <input class="form-check-input me-2" type="radio" id="Female" name="gender" value="female">
                        <span class="text-black ps-1">Nữ</span>
                    </label>
                    <label for="Other" class="d-flex flex-grow-1 border p-2"
                           style="border-radius: 7px; cursor: pointer;">
                        <input class="form-check-input me-2" type="radio" id="Other" name="gender" value="other">
                        <span class="text-black ps-1">Khác</span>
                    </label>
                </div>
            </form>
            <form id="userform" class="d-grid gap-2 mb-1">
                <input class="form-control" type="text" id="email" placeholder="Nhập Email hoặc số điện thoại" required>
                <div class="error" id="accountError"></div>
                <div class="position-relative">
                    <input class="form-control" type="password" id="password" placeholder="Nhập Mật khẩu" required>
                    <span class="position-absolute top-50 end-0 translate-middle-y pe-3 eye-icon-container"
                          id="toggle-password"
                          onclick="togglePassword()">
                    <svg id="eye-icon" class="eye-icon" viewBox="0 0 122.88 96.32">
                        <path d="M104.54,23.28c6.82,6.28,12.8,14.02,17.67,22.87l0.67,1.22l-0.67,1.21c-6.88,12.49-15.96,22.77-26.48,29.86 c-8.84,5.95-18.69,9.67-29.15,10.59l6.73-11.66c5.25-1.42,10.24-3.76,14.89-6.9c8.18-5.51,15.29-13.45,20.79-23.1 c-2.98-5.22-6.43-9.94-10.26-14.05L104.54,23.28L104.54,23.28z M88.02,0l17.84,10.3L56.2,96.32l-17.83-10.3l0.69-1.2 c-4.13-1.69-8.11-3.83-11.9-6.38C16.62,71.35,7.55,61.07,0.67,48.59L0,47.37l0.67-1.22C7.55,33.67,16.62,23.39,27.15,16.3 C37.42,9.38,49.08,5.48,61.44,5.48c7.35,0,14.44,1.38,21.14,3.94L88.02,0L88.02,0L88.02,0z M44.36,75.63l5-8.67 c-5.94-3.78-9.89-10.42-9.89-17.99c0-11.77,9.54-21.31,21.31-21.31c3.56,0,6.92,0.87,9.87,2.42l6.61-11.44 c-5.04-1.85-10.35-2.85-15.83-2.85c-9.61,0-18.71,3.06-26.76,8.48c-8.18,5.51-15.29,13.45-20.8,23.11 c5.5,9.66,12.62,17.6,20.8,23.1C37.76,72.55,41,74.28,44.36,75.63L44.36,75.63z M63.93,41.74l6.73-11.66 c-1.82-0.95-3.77-1.64-5.79-2.03c-1.45,2.18-2.31,4.82-2.31,7.67C62.56,37.88,63.06,39.93,63.93,41.74L63.93,41.74L63.93,41.74z"></path>
                    </svg>
                </span>
                </div>
                <div id="password-requirements" class="text-danger mt-2" style="display: none;"></div>
            </form>
            <div class="d-flex align-items-center justify-content-center ">
                <div style="height: 1px; background-color: #dbdbdb; width: 100%"></div>
                <div class="px-2" style="color: #ccc">HOẶC</div>
                <div style="height: 1px; background-color: #dbdbdb; width: 100%"></div>
            </div>
            <div class="d-flex gap-3 justify-content-between mt-1">
                <a href="#"
                   class="d-flex flex-grow-1 align-items-center justify-content-center text-decoration-none border p-2"
                   style="border-radius: 7px;">
                    <div class="custom-icon" style="width: 24px; height: 24px;">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="24px" height="24px">
                            <path fill="#039be5" d="M24 5A19 19 0 1 0 24 43A19 19 0 1 0 24 5Z"></path>
                            <path fill="#fff"
                                  d="M26.572,29.036h4.917l0.772-4.995h-5.69v-2.73c0-2.075,0.678-3.915,2.619-3.915h3.119v-4.359c-0.548-0.074-1.707-0.236-3.897-0.236c-4.573,0-7.254,2.415-7.254,7.917v3.323h-4.701v4.995h4.701v13.729C22.089,42.905,23.032,43,24,43c0.875,0,1.729-0.08,2.572-0.194V29.036z"></path>
                        </svg>
                    </div>
                    <span class="text-black ps-1">Facebook</span>
                </a>
                <a href="#"
                   class="d-flex flex-grow-1 align-items-center justify-content-center text-decoration-none border p-2"
                   style="border-radius: 7px;">
                    <div class="custom-icon" style="width: 24px; height: 24px;">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="24px" height="24px">
                            <path fill="#fbc02d"
                                  d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12s5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24s8.955,20,20,20s20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"></path>
                            <path fill="#e53935"
                                  d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"></path>
                            <path fill="#4caf50"
                                  d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"></path>
                            <path fill="#1565c0"
                                  d="M43.611,20.083L43.595,20L42,20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"></path>
                        </svg>
                    </div>
                    <span class="text-black ps-1">Google</span>
                </a>
            </div>
            <form id="chinhsach" class="d-flex justify-content-center mb-3 mt-3"
                  style="font-size: 13px; text-align: center;">
                <div class="d-flex text-decoration-none">
                    <p style="margin: 0; font-size: 14px">
                        Bằng việc đăng ký, bạn đã đồng ý với Crocodile về
                        <a href="#" class="custom-text-primary">Điều khoản</a>,
                        <a href="#" class="custom-text-primary">Chính sách bảo
                            mật</a> và
                        <a href="#" class="custom-text-primary">Chính sách
                            Cookie</a>.
                    </p>
                </div>
            </form>
            <div class="d-flex justify-content-center">
                <button type="submit" class="btn custom-btn-primary btn-lock" style="width: 100%">Đăng ký
                </button>
            </div>
            <div class="d-flex mt-2 justify-content-center pt-2">
                <p style="margin: 0">
                    Bạn đã có tài khoản?
                    <a href="login-content.jsp" class="custom-text-primary">Đăng nhập</a>
                    ngay.
                </p>
            </div>
        </div>
    </div>
</div>
<script>
    // Tạo tùy chọn ngày
    const daySelect = document.getElementById('day');
    for (let day = 1; day <= 31; day++) {
        const option = document.createElement('option');
        option.value = day;
        option.textContent = day;
        daySelect.appendChild(option);
    }
    // Tạo tùy chọn tháng
    const monthSelect = document.getElementById('month');
    for (let month = 1; month <= 12; month++) {
        const option = document.createElement('option');
        option.value = month;
        option.textContent = `Tháng ${month}`;
        monthSelect.appendChild(option);
    }
    // Tạo tùy chọn năm
    const yearSelect = document.getElementById('year');
    const currentYear = new Date().getFullYear();
    for (let year = 1950; year <= currentYear; year++) {
        const option = document.createElement('option');
        option.value = year;
        option.textContent = year;
        yearSelect.appendChild(option);
    }
    let isPasswordVisible = false;

    function togglePassword() {
        const passwordInput = document.getElementById("password");
        const eyeIcon = document.getElementById("eye-icon");
        // Toggle password visibility
        isPasswordVisible = !isPasswordVisible;
        passwordInput.type = isPasswordVisible ? "text" : "password";
        // Toggle icon between open and closed eye
        eyeIcon.innerHTML = isPasswordVisible
            ? `<path d="M95.73,10.81c10.53,7.09,19.6,17.37,26.48,29.86l0.67,1.22l-0.67,1.21c-6.88,12.49-15.96,22.77-26.48,29.86 C85.46,79.88,73.8,83.78,61.44,83.78c-12.36,0-24.02-3.9-34.28-10.81C16.62,65.87,7.55,55.59,0.67,43.1L0,41.89l0.67-1.22 c6.88-12.49,15.95-22.77,26.48-29.86C37.42,3.9,49.08,0,61.44,0C73.8,0,85.45,3.9,95.73,10.81L95.73,10.81z M60.79,22.17l4.08,0.39 c-1.45,2.18-2.31,4.82-2.31,7.67c0,7.48,5.86,13.54,13.1,13.54c2.32,0,4.5-0.62,6.39-1.72c0.03,0.47,0.05,0.94,0.05,1.42 c0,11.77-9.54,21.31-21.31,21.31c-11.77,0-21.31-9.54-21.31-21.31C39.48,31.71,49.02,22.17,60.79,22.17L60.79,22.17L60.79,22.17z M109,41.89c-5.5-9.66-12.61-17.6-20.79-23.11c-8.05-5.42-17.15-8.48-26.77-8.48c-9.61,0-18.71,3.06-26.76,8.48 c-8.18,5.51-15.29,13.45-20.8,23.11c5.5,9.66,12.62,17.6,20.8,23.1c8.05,5.42,17.15,8.48,26.76,8.48c9.62,0,18.71-3.06,26.77-8.48 C96.39,59.49,103.5,51.55,109,41.89L109,41.89z"/>`
            : `<path d="M104.54,23.28c6.82,6.28,12.8,14.02,17.67,22.87l0.67,1.22l-0.67,1.21c-6.88,12.49-15.96,22.77-26.48,29.86 c-8.84,5.95-18.69,9.67-29.15,10.59l6.73-11.66c5.25-1.42,10.24-3.76,14.89-6.9c8.18-5.51,15.29-13.45,20.79-23.1 c-2.98-5.22-6.43-9.94-10.26-14.05L104.54,23.28L104.54,23.28z M88.02,0l17.84,10.3L56.2,96.32l-17.83-10.3l0.69-1.2 c-4.13-1.69-8.11-3.83-11.9-6.38C16.62,71.35,7.55,61.07,0.67,48.59L0,47.37l0.67-1.22C7.55,33.67,16.62,23.39,27.15,16.3 C37.42,9.38,49.08,5.48,61.44,5.48c7.35,0,14.44,1.38,21.14,3.94L88.02,0L88.02,0L88.02,0z M44.36,75.63l5-8.67 c-5.94-3.78-9.89-10.42-9.89-17.99c0-11.77,9.54-21.31,21.31-21.31c3.56,0,6.92,0.87,9.87,2.42l6.61-11.44 c-5.04-1.85-10.35-2.85-15.83-2.85c-9.61,0-18.71,3.06-26.76,8.48c-8.18,5.51-15.29,13.45-20.8,23.11 c5.5,9.66,12.62,17.6,20.8,23.1C37.76,72.55,41,74.28,44.36,75.63L44.36,75.63z M63.93,41.74l6.73-11.66 c-1.82-0.95-3.77-1.64-5.79-2.03c-1.45,2.18-2.31,4.82-2.31,7.67C62.56,37.88,63.06,39.93,63.93,41.74L63.93,41.74L63.93,41.74z"/>`;
    }

    document.querySelector('.btn-lock').addEventListener('click', function (event) {
        event.preventDefault(); // Ngăn chặn hành động mặc định của nút submit
        // Lấy giá trị từ các trường
        const name = document.getElementById('name').value.trim();
        const lastname = document.getElementById('lastname').value.trim();
        const email = document.getElementById('email').value.trim();
        const password = document.getElementById('password').value.trim();
        const gender = document.querySelector('input[name="gender"]:checked');
        const day = document.getElementById('day').value;
        const month = document.getElementById('month').value;
        const year = document.getElementById('year').value;
        // Kiểm tra điền đủ trường
        if (!name || !lastname || !email || !password || !gender || !day || !month || !year) {
            alert("Vui lòng điền đầy đủ các trường!");
            return;
        }
        // Kiểm tra định dạng email hoặc số điện thoại
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const phonePattern = /^\d{10}$/;
        if (!emailPattern.test(email) && !phonePattern.test(email)) {
            document.getElementById('accountError').textContent = "Email hoặc số điện thoại không đúng định dạng!";
            document.getElementById('accountError').style.display = "block";
            return;
        } else {
            document.getElementById('accountError').style.display = "none";
        }
        // Kiểm tra độ mạnh của mật khẩu
        const passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        if (!passwordPattern.test(password)) {
            document.getElementById('password-requirements').textContent = "Mật khẩu phải có ít nhất 8 kí tự, bao gồm chữ hoa, số và kí tự đặc biệt.";
            document.getElementById('password-requirements').style.display = "block";
            return;
        } else {
            document.getElementById('password-requirements').style.display = "none";
        }
        // Thông báo thành công nếu mọi thứ hợp lệ
        alert("Đăng ký thành công!");
        window.location.href = 'home.html';
    });

    window.fbAsyncInit = function () {
        FB.init({
            appId: '{your-app-id}',
            cookie: true,
            xfbml: true,
            version: '{api-version}'
        });
        FB.init

    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>