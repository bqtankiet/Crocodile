<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả kích hoạt tài khoản - Crocodile</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: white;
            padding: 50px 40px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, #007b5f, #28a745);
        }

        .success {
            color: #28a745;
        }

        .error {
            color: #dc3545;
        }

        .icon {
            font-size: 80px;
            margin-bottom: 25px;
            display: block;
        }

        .success .icon::before {
            content: "✓";
            color: #28a745;
        }

        .error .icon::before {
            content: "✗";
            color: #dc3545;
        }

        h1 {
            margin: 20px 0;
            font-size: 28px;
            font-weight: 600;
        }

        p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 35px;
            color: #555;
        }

        .btn {
            display: inline-block;
            padding: 14px 35px;
            margin: 5px 10px;
            text-decoration: none;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn-home {
            background: linear-gradient(45deg, #007b5f, #28a745);
            color: white;
        }

        .btn-home:hover {
            background: linear-gradient(45deg, #005a45, #1e7e34);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 123, 95, 0.3);
        }

        .btn-signup {
            background: linear-gradient(45deg, #007bff, #0056b3);
            color: white;
        }

        .btn-signup:hover {
            background: linear-gradient(45deg, #0056b3, #004085);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.3);
        }

        .countdown {
            margin-top: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
            border-left: 4px solid #28a745;
        }

        .countdown p {
            margin: 0;
            font-size: 14px;
            color: #666;
        }

        .countdown-number {
            font-weight: bold;
            color: #28a745;
            font-size: 18px;
        }

        .logo {
            margin-bottom: 30px;
        }

        .logo img {
            max-height: 60px;
            width: auto;
        }
    </style>
</head>
<body>
<div class="container">

    <%
        String messageType = (String) request.getAttribute("messageType");
        String message = (String) request.getAttribute("message");
        boolean isSuccess = "success".equals(messageType);
    %>

    <div class="<%= isSuccess ? "success" : "error" %>">
        <div class="icon"></div>
        <h1><%= isSuccess ? "Kích hoạt thành công!" : "Kích hoạt thất bại!" %></h1>
        <p><%= message != null ? message : "Không có thông báo." %></p>
    </div>

    <div class="action-buttons">
        <% if (isSuccess) { %>
        <a href="http://localhost:8080/" class="btn btn-home">Về trang chủ</a>
        <div class="countdown">
            <p>Tự động chuyển hướng về trang chủ sau <span id="countdown" class="countdown-number">5</span> giây...</p>
        </div>

        <script>
            let countdown = 5;
            const countdownElement = document.getElementById('countdown');

            const timer = setInterval(function() {
                countdown--;
                countdownElement.textContent = countdown;

                if (countdown <= 0) {
                    clearInterval(timer);
                    window.location.href = 'http://localhost:8080/';
                }
            }, 1000);
        </script>
        <% } else { %>
        <a href="http://localhost:8080/signup" class="btn btn-signup">Đăng ký lại</a>
        <a href="http://localhost:8080/" class="btn btn-home">Về trang chủ</a>
        <% } %>

    </div>

</div>
</body>
</html>