<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đặt Lại Mật Khẩu</title>
    <!--  jquery  -->
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/>"></script>
    <!--  bootstrap  -->
    <link rel="stylesheet" href="<c:url value="/public/bootstrap/css/bootstrap.css"/>">
    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>
    <!--  css  -->
    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/>">
    <!--  js  -->

</head>
<body>
<%--<jsp:include page="includes/header.jsp">--%>
<%--    <jsp:param name="activePage" value="about"/>--%>
<%--</jsp:include>--%>
<%--CONTENT--%>
<jsp:include page="contents/resetPassword-content.jsp"/>
<%--FOOTER--%>
<jsp:include page="includes/footer.jsp"/>
</body>
</html>
