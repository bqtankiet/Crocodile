<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác Thực OTP</title>
    <!-- Thêm CSS nếu cần -->
</head>
<body>
<div class="container">
    <h3>Xác Thực OTP</h3>
    <p>Vui lòng nhập mã OTP được gửi về số điện thoại của bạn:</p>
    <form action="${pageContext.request.contextPath}/verifyOtp" method="post">
        <input type="text" name="otp" placeholder="Nhập OTP" required>
        <button type="submit">Xác nhận</button>
    </form>
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
</div>
</body>
</html>
