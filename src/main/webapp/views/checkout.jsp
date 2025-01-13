<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 1/13/2025
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crocodile - Thanh toán</title>
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
        .payment-method-wrapper {
            position: relative;
            overflow: hidden;

            .payment-radio {
                position: absolute;
                top: 50%;
                transform: translateY(-70%);
                left: 1rem;
            }

            .payment-radio:checked + .payment-label {
                background-color: var(--bs-primary-bg-subtle);
                color: var(--bs-primary-text-emphasis);
            }

            .payment-label {
                width: 100%;
                font-weight: 600;
                padding: 1rem 1rem 1rem 3rem;
            }
        }
    </style>

</head>
<body>
    <%--HEADER--%>
    <jsp:include page="includes/header.jsp"/>

    <%--CONTENT--%>
    <jsp:include page="contents/checkout-content.jsp"/>

    <%--FOOTER--%>
    <jsp:include page="includes/footer.jsp"/>
</body>
</html>
