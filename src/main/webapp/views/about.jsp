<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crocodile - Giới thiệu</title>
    <!--  jquery  -->
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/> "></script>
    <!--  bootstrap  -->
    <link rel="stylesheet" href="<c:url value="/public/bootstrap/css/bootstrap.css"/> ">
    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/> "></script>
    <!--  custom css  -->
    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/> ">
    <!--  custom js  -->

    <style>
        .nav-pills .nav-link {
            color: var(--custom-bg-primary-darker);
            font-size: large;
        }

        .nav-pills .nav-link.active {
            background-color: var(--custom-bg-primary);
        }
    </style>
</head>
<body>
<%--HEADER--%>
<jsp:include page="includes/header.jsp">
    <jsp:param name="activePage" value="about"/>
</jsp:include>

<%--CONTENT--%>
<jsp:include page="contents/about-content.jsp"/>

<%--FOOTER--%>
<jsp:include page="includes/footer.jsp"/>
</body>
</html>
