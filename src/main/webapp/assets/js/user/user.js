
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
document.getElementById('send-otp').addEventListener('click', function() {
    const phoneNumber = document.getElementById('edit-phone').value;
    if (validatePhoneNumber(phoneNumber)) {
        // Gửi yêu cầu OTP đến server
        sendOtpRequest(phoneNumber);
    } else {
        alert('Số điện thoại không hợp lệ!');
    }
});

function validatePPhoneNumber() {
    const phoneNumber = document.getElementById("edit-phone").value;
    const errorMessage = document.getElementById("phone-number-error");
    const phoneRegex = /^(0[3|5|7|8|9])\d{8}$/;
    if (phoneRegex.test(phoneNumber)) {
        errorMessage.style.display = "none";
    } else {
        errorMessage.style.display = "block";
    }
}
function validatePhoneNumber(phoneNumber) {
    const phoneRegex = /^(0[3|5|7|8|9])\d{8}$/;
    return phoneRegex.test(phoneNumber);
}

document.getElementById('form-edit-phone').addEventListener('submit', function(e) {
    e.preventDefault();
    const phoneNumber = document.getElementById('edit-phone').value;
    const otpCode = document.getElementById('OTP-code').value;
    if (validatePhoneNumber(phoneNumber) && otpCode.length === 6) {
        // Gửi yêu cầu cập nhật số điện thoại và OTP
        updatePhoneNumber(phoneNumber, otpCode);
    } else {
        alert('Vui lòng kiểm tra lại số điện thoại và mã OTP!');
    }
});

function sendOtpRequest(phoneNumber) {
    // Giả lập việc gửi mã OTP
    console.log(`Gửi mã OTP đến số điện thoại: ${phoneNumber}`);
    document.getElementById('otp-info').textContent = 'Mã OTP đã được gửi. Vui lòng kiểm tra số điện thoại của bạn.';
}

function updatePhoneNumber(phoneNumber, otpCode) {

}