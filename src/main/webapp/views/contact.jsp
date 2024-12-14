<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Crocodile - Liên hệ</title>
    <!--  jquery  -->
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/>"></script>

    <!--  bootstrap  -->
    <link rel="stylesheet" href="<c:url value="/public/bootstrap/css/bootstrap.css"/>">
    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>

    <!--  css  -->
    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/> ">

    <!-- link css box icon -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <!-- link font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<%--HEADER--%>
<jsp:include page="includes/header.jsp">
    <jsp:param name="activePage" value="contact"/>
</jsp:include>

<%--CONTENT--%>
<jsp:include page="contents/contact-content.jsp"/>

<%--FOOTER--%>
<jsp:include page="includes/footer.jsp"/>
</body>
</html>
