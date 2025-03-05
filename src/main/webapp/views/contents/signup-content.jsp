<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    #page {
        --color-primary: #004c45;
    }

    .btn-primary {
        background-color: var(--color-primary) !important; /* Override mạnh mẽ */
        border-color: var(--color-primary) !important;
        color: white !important;
    }

    .img-background {
        background-image: url(<c:url value="/uploads/images/background/crocodile-background.jpg"/>);
        background-repeat: no-repeat;
        background-size: cover;
    }

    .translucent-background {
        /*background: rgba(0, 0, 0, 0.8);*/
        /*color: white;*/

        background-color: white;
    }

    #feedback-tooltips {
        position: absolute;
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 5px 10px;
        background-color: white;
        transform: translate(0%, 5%);
    }
</style>
<div id="page">
    <div class="img-background py-5 d-flex justify-content-center" style="overflow-x: hidden; height: 60em">
        <div class="row">
            <div class="p-5 col translucent-background shadow-lg" style="width: 60ch; height: fit-content">
                <form novalidate action="???" method="post" id="signupForm" class="needs-validation w-100">
                    <h3 class="text-center mb-4" style="color: var(--color-primary);">Đăng ký</h3>
                    <!-- Thông tin cá nhân -->
                    <div class="d-grid gap-3 mb-3">
                        <!-- Họ tên -->
                        <div class="d-flex gap-4">
                            <div class="col">
                                <input class="form-control" type="text" name="firstname" id="firstname"
                                       placeholder="Họ và tên"
                                       aria-label="" required="">
                                <div class="invalid-feedback">Họ và tên không được để trống.</div>
                            </div>
                        </div>

                        <!-- Giới tính -->
                        <div>
                            <div id="gender" class="d-flex gap-4 align-items-center justify-content-around">
                                <!-- Nam -->
                                <input type="radio" class="btn-check" name="gender" id="male" autocomplete="off"
                                       required>
                                <label class="btn btn-outline-secondary col" for="male" style="border-color: #dbdbdb">Nam</label>
                                <!-- Nữ -->
                                <input type="radio" class="btn-check" name="gender" id="female" autocomplete="off"
                                       required>
                                <label class="btn btn-outline-secondary col" for="female" style="border-color: #dbdbdb">Nữ</label>
                            </div>
                            <div class="invalid-feedback">
                                Vui lòng chọn giới tính.
                            </div>
                        </div>

                        <!-- Email -->
                        <div>
                            <input class="form-control p-2" type="text" id="email" name="email"
                                   placeholder="Email hoặc số điện thoại" required="" aria-label="">
                            <div class="invalid-feedback">Hãy nhập email hoặc số điện thoại của bạn.</div>
                        </div>

                        <!-- password -->
                        <div>
                            <input class="form-control" type="password" id="password" name="password"
                                   placeholder="Mật khẩu"
                                   required="" aria-label="">
                            <div class="invalid-feedback"></div>
                            <div id="feedback-tooltips" class="d-none">
                                <ul class="m-0">
                                    <li class="text-danger" id="longRequired">Ít nhất 8 ký tự</li>
                                    <li class="text-danger" id="numberRequired">Phải có số (1..9)</li>
                                    <li class="text-danger" id="uppercaseRequired">Phải có chữ viết hoa (A..Z)</li>
                                    <li class="text-danger" id="symbolRequired">Phải có ký tự đặc biệt (!..*)</li>
                                </ul>
                            </div>
                        </div>

                        <!-- Confirm password -->
                        <div>
                            <input class="form-control" type="password" id="confirmPassword" name="confirmPassword"
                                   placeholder="Nhập lại mật khẩu" required="" aria-label="">
                            <div class="invalid-feedback">Mật khẩu không khớp.</div>
                        </div>
                    </div>

                    <!-- Nút đăng ký -->
                    <div class="text-center my-2">
                        <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
                    </div>

                    <!-- captcha -->
                    <div>Captcha ???</div>
                </form>
                <div class="w-100">
                    <!-- Dòng phân cách -->
                    <div class="d-flex align-items-center mt-3">
                        <div class="flex-grow-1" style="height: 1px; background-color: #dbdbdb;"></div>
                        <span class="px-2 mb-2" style="color: #7e7e7e;">Hoặc đăng ký với</span>
                        <div class="flex-grow-1" style="height: 1px; background-color: #dbdbdb;"></div>
                    </div>

                    <!-- Nút mạng xã hội -->
                    <div class="d-flex gap-3 justify-content-between mt-1">
                        <a href="#"
                           class="col d-flex align-items-center justify-content-center text-decoration-none border p-2"
                           style="border-radius: 7px;">
                            <div class="d-flex align-items-center justify-content-center"
                                 style="width: 24px; height: 24px;">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="24px" height="24px">
                                    <path fill="#039be5" d="M24 5A19 19 0 1 0 24 43A19 19 0 1 0 24 5Z"></path>
                                    <path fill="#fff"
                                          d="M26.572,29.036h4.917l0.772-4.995h-5.69v-2.73c0-2.075,0.678-3.915,2.619-3.915h3.119v-4.359c-0.548-0.074-1.707-0.236-3.897-0.236c-4.573,0-7.254,2.415-7.254,7.917v3.323h-4.701v4.995h4.701v13.729C22.089,42.905,23.032,43,24,43c0.875,0,1.729-0.08,2.572-0.194V29.036z"></path>
                                </svg>
                            </div>
                            <span class="ps-1">Facebook</span>
                        </a>
                        <a href="#"
                           class="col d-flex align-items-center justify-content-center text-decoration-none border p-2"
                           style="border-radius: 7px;">
                            <div class="d-flex align-items-center justify-content-center"
                                 style="width: 24px; height: 24px;">
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
                            <span class=" ps-1">Google</span>
                        </a>
                    </div>

                    <!-- Điều hướng -->
                    <div class="text-center mt-3">
                        <hr>
                        <p>Bạn đã có tài khoản?
                            <a href="login-content.jsp">Đăng nhập</a> ngay.
                        </p>
                        <div class=""><a href=#>Quay lại trang chủ</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (() => {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        const forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>

<script>
    let $feedbackTooltips = $('#feedback-tooltips');
    let $passwordInput = $('#password');

    // Hiển thị tooltip khi focus vào input
    $passwordInput.on('focus', function () {
        $feedbackTooltips.removeClass('d-none');
    });

    // Ẩn tooltip khi blur khỏi input
    $passwordInput.on('blur', function () {
        $feedbackTooltips.addClass('d-none');
    });

    $passwordInput.on('input', function () {
        let pass = $(this).val();

        // Kiểm tra các điều kiện
        let isLongEnough = pass.length >= 8;
        let hasNumber = /\d/.test(pass);
        let hasUppercase = /[A-Z]/.test(pass);
        let hasSymbol = /[^a-zA-Z0-9]/.test(pass);

        // Cập nhật màu sắc điều kiện
        $('#longRequired').toggleClass('text-success', isLongEnough).toggleClass('text-danger', !isLongEnough);
        $('#numberRequired').toggleClass('text-success', hasNumber).toggleClass('text-danger', !hasNumber);
        $('#uppercaseRequired').toggleClass('text-success', hasUppercase).toggleClass('text-danger', !hasUppercase);
        $('#symbolRequired').toggleClass('text-success', hasSymbol).toggleClass('text-danger', !hasSymbol);

        // Nếu tất cả điều kiện đúng, đánh dấu input là hợp lệ
        if (isLongEnough && hasNumber && hasUppercase && hasSymbol) {
            $(this).removeClass('is-invalid').addClass('is-valid');
        } else {
            $(this).removeClass('is-valid').addClass('is-invalid');
        }
    });

    // Chặn copy, cut, paste, space
    $passwordInput.on('keydown paste', function (e) {
        if (e.key === ' ' || (e.ctrlKey && ['c', 'v', 'x'].includes(e.key))) {
            e.preventDefault();
        }
    });
</script>

<script>
    class RegisterFormValidator {
        constructor(formSelector) {
            this.$form = $(formSelector);

            this.errors = {};

            this.error_messages = {
              name: 'Name',
              gender: 'Gender',
              email: 'Email',
              password: 'Password',
              confirmPassword: 'ConfirmPassword'
            };

            this.$nameInput = this.$form.find('#name');
            this.$genderInput = this.$form.find('#gender');
            this.$emailInput = this.$form.find('#email');
            this.$passwordInput = this.$form.find('#password');
            this.$confirmPasswordInput = this.$form.find('#confirmPassword');

            this.registerCallbacks();
        }

        registerCallbacks() {
            this.$nameInput.on('input', () => this.validateName());
            this.$genderInput.on('input', () => this.validateGender());
            this.$emailInput.on('input', () => this.validateEmail());
            this.$passwordInput.on('input', () => this.validatePassword());
            this.$confirmPasswordInput.on('input', () => this.validateConfirmPassword());
        }

        validateName() {
            let name = this.$nameInput.val();
            let isValid = name.length > 5;
            let feedback = isValid ? '' : 'Họ tên không được để trống.';
            setValidationState(this.$nameInput, isValid, feedback)
        }

        setValidationState($input, isValid, message){
            let $feedback = $input.siblings('.invalid-feedback'); // Chọn phần hiển thị lỗi gần input
            if (!$feedback.length) {
                $feedback = $('<div class="invalid-feedback"></div>').insertAfter($input);
            }
            if (isValid) {
                $input.removeClass('is-invalid').addClass('is-valid');
                $feedback.text('');
            } else {
                $input.removeClass('is-valid').addClass('is-invalid');
                $feedback.text(message);
            }

        }
    }
</script>