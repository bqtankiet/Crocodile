<%@ page import="vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url var="activateURL" value="<%= UrlProperties.home()%>"/>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả kích hoạt tài khoản - Crocodile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }
        .success {
            color: #28a745;
        }
        .error {
            color: #dc3545;
        }
        .icon {
            font-size: 60px;
            margin-bottom: 20px;
        }
        .success .icon:before {
            content: "✓";
        }
        .error .icon:before {
            content: "✗";
        }
        h1 {
            margin: 20px 0;
            font-size: 24px;
        }
        p {
            font-size: 16px;
            line-height: 1.5;
            margin-bottom: 30px;
        }
        .btn {
            display: inline-block;
            padding: 12px 30px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-home {
            background-color: #28a745;
        }
        .btn-home:hover {
            background-color: #1e7e34;
        }
        .countdown {
            margin-top: 20px;
            font-size: 14px;
            color: #666;
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
        <p><%= message != null ? message : "" %></p>
    </div>

    <% if (isSuccess) { %>
    <a href="${pageContext.request.contextPath}/home" class="btn btn-home">Về trang chủ</a>
    <div class="countdown">
        <p>Tự động chuyển hướng sau <span id="countdown">5</span> giây...</p>
    </div>

    <script>
        let countdown = 5;
        const countdownElement = document.getElementById('countdown');

        const timer = setInterval(function() {
            countdown--;
            countdownElement.textContent = countdown;

            if (countdown <= 0) {
                clearInterval(timer);
                window.location.href = '${pageContext.request.contextPath}/home';
            }
        }, 1000);
    </script>
    <% } else { %>
    <a href="${pageContext.request.contextPath}/signup" class="btn">Đăng ký lại</a>
    <a href="${pageContext.request.contextPath}/home" class="btn btn-home">Về trang chủ</a>
    <% } %>
</div>
</body>
</html>