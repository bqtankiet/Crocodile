
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Crocodile - Tài khoản</title>

    <meta name="description" content="" />

    <!-- Fonts -->
    <link
        href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet" />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="<c:url value="/admin/assets/vendor/fonts/boxicons.css"/>" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>


    <!-- Core CSS -->
    <link rel="stylesheet" href="<c:url value="/admin/assets/vendor/css/core.css"/>" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<c:url value="/admin/assets/vendor/css/theme-default.css"/>" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<c:url value="/admin/assets/css/demo.css"/>" />

    <!-- JavaScript  -->
    <script src="<c:url value="/admin/assets/vendor/js/helpers.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/config.js"/>"></script>
</head>

<body>
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">

            <!-- Menu -->
            <jsp:include page="/admin/views/includes/sidebar.jsp">
                <jsp:param name="activePage" value="account"/>
            </jsp:include>
            <!-- / Menu -->

            <!-- Layout container -->
            <jsp:include page="/admin/views/contents/account-content.jsp"/>
            <!-- / Layout page -->
        </div>

    </div>
<script src="<c:url value="/admin/assets/vendor/js/bootstrap.js"/>"></script>

<script src="<c:url value="/admin/assets/vendor/js/menu.js"/>"></script>
<script src="<c:url value="/admin/assets/js/main.js"/>"></script>
</body>
</html>
