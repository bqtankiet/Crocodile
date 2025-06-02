<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crocodile - Kích Hoạt Tài Khoản</title>
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/> "></script>
    <link rel="stylesheet" href="<c:url value="/public/bootstrap/css/bootstrap.css"/> ">
    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/> "></script>
    <!--  custom css  -->
    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/> ">
</head>
<body>
<jsp:include page="contents/activation-result-content.jsp"/>

<%--FOOTER--%>
<jsp:include page="includes/footer.jsp"/>
</body>
</html>