
// ---------------format che SĐT và Email---------------
document.addEventListener("DOMContentLoaded", function () {
    // Lấy phần tử số điện thoại
    var phoneElement = document.getElementById("phone-number");
    if (phoneElement) {
        var phoneNumber = phoneElement.innerText;

        if (phoneNumber) {
            // Format số điện thoại chỉ khi có giá trị
            var hiddenNumber = "*******";
            var visibleNumber = phoneNumber.slice(-3);
            phoneElement.innerText = hiddenNumber + visibleNumber;
        }
    }

    // format email
    var emailElement = document.getElementById("email");
    var email = emailElement.innerText;
    var atIndex = email.indexOf("@");

    // Chia email thành phần username và domain
    var username = email.slice(0, atIndex);
    var domain = email.slice(atIndex);

    // Giữ lại một số ký tự đầu của username và ẩn phần còn lại
    var hiddenPart = "*".repeat(username.length - 2);
    var visiblePart = username.slice(-2);

    emailElement.innerText = hiddenPart + visiblePart + domain;

    // filter order status
    const btnStatusFilter = document.querySelectorAll(".status-filter");

    btnStatusFilter.forEach(button => {
        button.addEventListener("click", function () {
            btnStatusFilter.forEach(btn => btn.classList.remove('active'));
            const status = this.dataset.filter;
            button.classList.add('active');

            fetch(`/crocodile/status-order-filter?status=${status}`)
                .then(response => response.text())
                .then(html => {
                    document.getElementById("ordersList").innerHTML = html.trim();
                });
        });
    });
});


// ---------------validate fullname không được chứa ký tự đặc biệt---------------
function validateFullname() {
    const fullname = document.getElementById("fullname").value;
    const errorMessage = document.getElementById("fullname-error");
    const regex = /[<>@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?`~!]/;

    if (fullname.length > 20 || regex.test(fullname)) {
        errorMessage.style.display = "block";
    } else {
        errorMessage.style.display = "none";
    }
}

function validateForm() {
    const fullname = document.getElementById("fullname").value;
    const regex = /[<>@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?`~!]/;

    if (fullname.length > 20 || regex.test(fullname)) {
        alert("Họ và tên không được chứa ký tự đặc biệt và không quá 20 ký tự.");
        return false;
    }
    return true;
}



// ---------------thêm, sửa SĐT---------------
// TODO: check OTP ở backend
const phoneRegex = /^(0[3|5|7|8|9])\d{8}$/;
const phoneNumber = document.getElementById('edit-phone').value;

document.getElementById('send-otp').addEventListener('click', function() {
    if (validatePhoneNumber(phoneNumber)) {
        // Gửi yêu cầu OTP đến server
        sendOtpRequest(phoneNumber);
    } else {
        alert('Số điện thoại không hợp lệ!');
    }
});

function validateInputPhoneNumber() {
    const errorMessage = document.getElementById("phone-number-error");
    if (phoneRegex.test(phoneNumber)) {
        errorMessage.style.display = "none";
    } else {
        errorMessage.style.display = "block";
    }
}

function validatePhoneNumber(phoneNumber) {
    return phoneRegex.test(phoneNumber);
}

document.getElementById('form-edit-phone').addEventListener('submit', function(e) {
    e.preventDefault();
    const otpCode = document.getElementById('OTP-code').value;
    if (validatePhoneNumber(phoneNumber) && otpCode.length === 6) {
        // Gửi yêu cầu cập nhật số điện thoại và OTP
        updatePhoneNumber(phoneNumber, otpCode);
    } else {
        alert('Vui lòng kiểm tra lại số điện thoại và mã OTP!');
    }
});

function sendOtpRequest(phoneNumber) {

}

function updatePhoneNumber(phoneNumber, otpCode) {

}


// Thêm, sửa email
const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
const email = document.getElementById('edit-email').value;

document.getElementById('send-otp').addEventListener('click', function() {
    if (validateEmail(email)) {
        // Gửi yêu cầu OTP đến server cho email
        sendOtp(email);
    } else {
        alert('Email không hợp lệ!');
    }
});

function validateInputEmail() {
    const errorMessage = document.getElementById("email-error");

    if (emailRegex.test(email)) {
        errorMessage.style.display = "none";
    } else {
        errorMessage.style.display = "block";
    }
}

function validateEmail(email) {
    return emailRegex.test(email);
}

document.getElementById('form-edit-email').addEventListener('submit', function(e) {
    e.preventDefault();
    const otpCode = document.getElementById('OTP-code').value;
    if (validateEmail(email) && otpCode.length === 6) {
        // Gửi yêu cầu cập nhật email và OTP
        updateEmail(email, otpCode);
    } else {
        alert('Vui lòng kiểm tra lại email và mã OTP!');
    }
});

function sendOtp(email) {
    // Gửi yêu cầu OTP đến server cho email

}

function updateEmail(email, otpCode) {
    // Gửi yêu cầu cập nhật email và OTP

}


