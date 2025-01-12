<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 1/8/2025
  Time: 7:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crocodile - Giỏ hàng</title>
    <!--  jquery  -->
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/>"></script>
    <!--  bootstrap  -->
    <link rel="stylesheet" href="<c:url value="/public/bootstrap/css/bootstrap.css"/>">
    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>
    <!--  css  -->
    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/>">
    <!--  js  -->
    <script src="<c:url value="/assets/js/quantity-control.js"/>"></script>

    <!--  Khai báo Bootstrap tooltip  -->
    <script>
        $(document).ready(function () {
            const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
            const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
        });
    </script>

    <style>
        .form-check-input {
            font-size: 1.3rem;
            border: 2px solid gray;

            &:hover {
                cursor: pointer;
                background-color: #d9e4d9;
            }

            &:checked {
                background-color: var(--custom-bg-primary);
                border: none;
            }

            &:focus {
                border: 2px solid var(--custom-bg-primary);
            }
        }
    </style>

</head>
<body>
    <%--HEADER--%>
    <jsp:include page="includes/header.jsp" />
    <%--CONTENT--%>
    <jsp:include page="contents/cart-content.jsp"/>
</body>
</html>
