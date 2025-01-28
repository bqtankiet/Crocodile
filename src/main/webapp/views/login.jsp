<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crocodile - Đăng Nhập</title>
    <!--  jquery  -->
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/>"></script>
    <!--  bootstrap  -->
    <link rel="stylesheet" href="<c:url value="/public/bootstrap/css/bootstrap.css"/>">
    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>
    <!--  css  -->
    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/>">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script>
        function showErrorMessage() {
            alert("${errorMessage}");

            document.getElementById("username").value = "";
            document.getElementById("password").value = "";
        }
    </script>
    <meta name="google-signin-client_id"
          content="841108618342-pc5358jl3u8dnsaru2hitfjers87naaj.apps.googleusercontent.com.apps.googleusercontent.com">
</head>
<body>
<c:if test="${not empty errorMessage}">
    <script>
        showErrorMessage();
    </script>
</c:if>
<jsp:include page="includes/header.jsp">
    <jsp:param name="activePage" value="home"/>
</jsp:include>
<%--CONTENT--%>
<jsp:include page="contents/login-content.jsp"/>
<%--FOOTER--%>
<jsp:include page="includes/footer.jsp"/>
</body>

</html>