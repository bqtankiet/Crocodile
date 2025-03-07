<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
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

    #feedback-tooltips, .password-criteria-holder {
        position: absolute;
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 5px 10px;
        background-color: white;
        transform: translate(0%, 5%);
    }

    .password-criteria-holder ul {
        margin-bottom: 0 !important;
    }
</style>
<div id="page">
    <div class="img-background py-5 d-flex justify-content-center" style="overflow-x: hidden; height: 60em">
        <div class="row">
            <div class="p-5 col translucent-background shadow-lg" style="width: 60ch; height: fit-content">
                <form novalidate method="post" id="signupForm" action="<c:url value="/signup"/>" class="needs-validation w-100">
                    <h3 class="text-center mb-4" style="color: var(--color-primary);">Đăng ký</h3>
                    <!-- Thông tin cá nhân -->
                    <div class="d-grid gap-3 mb-3">
                        <!-- Họ tên -->
                        <div class="d-flex gap-4">
                            <div class="col">
                                <input class="form-control" type="text" name="fullName" id="fullName"
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
                                       value="male"
                                       required>
                                <label class="btn btn-outline-secondary col" for="male" style="border-color: #dbdbdb">Nam</label>
                                <!-- Nữ -->
                                <input type="radio" class="btn-check" name="gender" id="female" autocomplete="off"
                                       value="female"
                                       required>
                                <label class="btn btn-outline-secondary col" for="female" style="border-color: #dbdbdb">Nữ</label>
                            </div>
                            <div class="invalid-feedback">
                                Vui lòng chọn giới tính.
                            </div>
                        </div>

                        <!-- Contact: Email / Phone -->
                        <div>
                            <input class="form-control p-2" type="text" id="contact" name="contact"
                                   placeholder="Email hoặc số điện thoại" required="" aria-label="">
                            <div class="invalid-feedback">Hãy nhập email hoặc số điện thoại của bạn.</div>
                        </div>

                        <!-- password -->
                        <div>
                            <input class="form-control" type="password" id="password" name="password"
                                   placeholder="Mật khẩu"
                                   required="" aria-label="">
                            <div class="password-criteria-holder d-none shadow-sm"></div>
                            <div class="invalid-feedback">Mật khẩu không hợp lệ</div>
                        </div>
                        <!-- Confirm password -->
                        <div>
                            <input class="form-control" type="password" id="confirmPassword" name="confirmPassword"
                                   placeholder="Nhập lại mật khẩu" required="" aria-label="">
                            <div class="invalid-feedback">Mật khẩu không khớp.</div>
                        </div>
                    </div>

                    <!-- captcha -->
                    <div class="g-recaptcha"
                         data-sitekey="6Le5eOsqAAAAAP1g0oVT2AQyKqXMnbibrG4SgAzL"
                         data-callback="enableSubmit"></div>
                    <!-- Nút đăng ký -->
                    <div class="text-center my-2">
                        <button type="submit" id="submitBtn" class="btn btn-primary w-100" disabled>Đăng ký</button>
                    </div>

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
                            <a href="<c:url value="/login"/>">Đăng nhập</a> ngay.
                        </p>
                        <div class=""><a href=#>Quay lại trang chủ</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    class RegisterFormValidator {
        constructor(formSelector) {
            this.$form = $(formSelector);

            this.errors = {};

            this.$nameInput = this.$form.find('#fullName');
            this.$genderInput = this.$form.find('#gender');
            this.$contactInput = this.$form.find('#contact');
            this.$passwordInput = this.$form.find('#password');
            this.$confirmPasswordInput = this.$form.find('#confirmPassword');

            this.passwordCriteria = new PasswordCriteria([
                'Ít nhất 8 ký tự',
                'Ít nhất 1 chữ số (0..9)',
                'Ít nhất 1 chữ hoa (A..Z)',
                'Ít nhất 1 ký tự đặc biệt'
            ]).bind('#password');

            // Chặn copy, cut, paste, space
            this.$passwordInput.on('keydown paste', function (e) {
                if (e.key === ' ' || (e.ctrlKey && ['c', 'v', 'x'].includes(e.key))) {
                    e.preventDefault();
                }
            });

            this.$confirmPasswordInput.on('keydown paste', function (e) {
                if (e.key === ' ' || (e.ctrlKey && ['c', 'v', 'x'].includes(e.key))) {
                    e.preventDefault();
                }
            });

            this.registerCallbacks();
        }

        /**
         * Đăng ký các callbacks để xử lý validate cho từng input
         */
        registerCallbacks() {
            this.$nameInput.on('input', () => this.validateName());
            this.$genderInput.on('input', () => this.validateGender());
            this.$contactInput.on('input', () => this.validateEmailAndPhone());
            this.$passwordInput.on('input', () => this.validatePassword());
            this.$confirmPasswordInput.on('input', () => this.validateConfirmPassword());
        }

        validateEmailAndPhone() {
            let input = this.$contactInput.val().trim(); // Lấy giá trị từ input

            // Regex kiểm tra email
            let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            // Regex kiểm tra số điện thoại (Việt Nam, 10-11 số, bắt đầu bằng 0)
            let phoneRegex = /^(0[1-9][0-9]{8,9})$/;

            let isValid = emailRegex.test(input) || phoneRegex.test(input);

            // Cập nhật trạng thái validation
            this.setValidationState(this.$contactInput, isValid, 'Email hoặc số điện thoại không hợp lệ');

            return isValid;
        }

        /**
         * Validate password sử dụng passwordCriteria, cập nhật feedback thời gian thực
         * @returns {boolean}
         */
        validatePassword() {
            let pass = this.$passwordInput.val();
            // check validations
            let isLongEnough = pass.length >= 8;
            let hasNumber = /\d/.test(pass);
            let hasUppercase = /[A-Z]/.test(pass);
            let hasSymbol = /[^a-zA-Z0-9]/.test(pass);

            // update feedback
            isLongEnough ? this.passwordCriteria.success(0) : this.passwordCriteria.danger(0)
            hasNumber ? this.passwordCriteria.success(1) : this.passwordCriteria.danger(1);
            hasUppercase ? this.passwordCriteria.success(2) : this.passwordCriteria.danger(2);
            hasSymbol ? this.passwordCriteria.success(3) : this.passwordCriteria.danger(3);

            this.validateConfirmPassword();

            let isValid = isLongEnough && hasSymbol && hasUppercase && hasSymbol;
            this.setValidationState(this.$passwordInput, isValid, 'Mật khẩu không hợp lệ');
            return isValid;
        }

        /**
         * Validate mật khẩu nhập lại không rỗng và khớp với mật khẩu đã nhập
         * @returns {boolean}
         */
        validateConfirmPassword() {
            let isNotEmpty = !(this.$confirmPasswordInput.val().trim().length === 0);
            let isMatch = this.$passwordInput.val() === this.$confirmPasswordInput.val();
            let isValid = isMatch && isNotEmpty;
            this.setValidationState(this.$confirmPasswordInput, isValid, 'Mật khẩu không khớp');
            return isValid;
        }

        /**
         * Validate name ít nhất 5 ký tự, và xử lý các khoảng trắng
         * @returns {boolean}
         */
        validateName() {
            let name = this.$nameInput.val().replace(/^\s+/, "").replace(/\s+/g, " "); // Xóa khoảng trắng đầu + thừa
            this.$nameInput.val(name); // Cập nhật lại giá trị đã chuẩn hóa
            let isValid = name.length >= 5;
            this.setValidationState(this.$nameInput, isValid, 'Họ và tên không hợp lệ');
            return isValid;
        }

        validateGender() {
            let genderInputs = $('input[name=gender], #gender');
            let isChecked = [...genderInputs].some(input => input.checked);
            this.setValidationState(this.$genderInput, isChecked, 'Vui lòng chọn giới tính');
            return isChecked;
        }

        /**
         * Hiển thị feedback
         * @param $input
         * @param isValid
         * @param message
         */
        setValidationState($input, isValid, message) {
            let $feedback = $input.siblings('.invalid-feedback');
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

        /**
         * Kiểm tra xem form có hợp lệ hay không?
         * @returns {boolean}
         */
        checkValidity() {
            let isValidName = this.validateName();
            let isValidGender = this.validateGender();
            let isValidContact = this.validateEmailAndPhone();
            let isValidPassword = this.validatePassword();
            let isValidConfirmPassword = this.validateConfirmPassword();
            return isValidName && isValidGender && isValidContact && isValidPassword && isValidConfirmPassword;
        }
    }

    class PasswordCriteria {
        constructor(criteriaMessages) {
            this.criteriaMessages = criteriaMessages;
            this.$criteriaHolder = null;
            this.$passwordInput = null;
        }

        success(i) {
            this.$criteriaHolder.find('li').eq(i).removeClass('text-danger').addClass('text-success');
        }

        danger(i) {
            this.$criteriaHolder.find('li').eq(i).removeClass('text-success').addClass('text-danger');
        }

        bind(inputSelector) {
            this.$passwordInput = $(inputSelector);
            this.$criteriaHolder = this.$passwordInput.siblings('.password-criteria-holder');
            let $ul = $('<ul></ul>')
            this.criteriaMessages.forEach(function (m) {
                $ul.append($('<li class="text-danger">' + m + '</li>'));
            });
            this.$criteriaHolder.html($ul);

            this.$passwordInput.on('focus', () => {
                this.$criteriaHolder.removeClass('d-none')
            });
            this.$passwordInput.on('blur', () => {
                this.$criteriaHolder.addClass('d-none')
            });

            return this;
        }
    }

</script>

<script>

    const formValidator = new RegisterFormValidator('#signupForm');

    // Copy from bootstrap 5.3 document
    (() => {
        'use strict'

        const form = document.querySelector('#signupForm');

        form.addEventListener('submit', event => {
            if (!formValidator.checkValidity()) {
                // Nếu ko hợp lệ -> chặn gửi form và hiện feedback
                event.preventDefault()
                event.stopPropagation()
            } else {
                // Nếu hợp lệ -> gửi form bằng ajax
                event.preventDefault();
                $.ajax({
                    type: 'POST',
                    url: '<c:url value="/signup"/>',
                    data: $(this).serialize(),
                    success: function (response) {
                        alert("Success");
                    },
                    error: function () {
                        alert("Failed");
                    },
                });
            }
        }, false);
    })()
</script>
<script>
    // Hàm được gọi khi captcha hoàn thành
    function enableSubmit() {
        document.getElementById("submitBtn").disabled = false;
    }
</script>