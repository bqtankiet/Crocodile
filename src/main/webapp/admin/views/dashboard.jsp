
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Crocodile - Dashboard</title>

    <meta name="description" content="" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/apexcharts@3.45.2/dist/apexcharts.css">
</head>

<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <!-- Sidebar -->
        <jsp:include page="/admin/views/includes/sidebar.jsp">
            <jsp:param name="activePage" value="dashboard"/>
        </jsp:include>
        <!-- / Sidebar -->
        <div class="layout-page">

            <!-- Header -->
            <jsp:include page="/admin/views/includes/header.jsp" />
            <!-- / Header -->

            <!-- Content -->
            <jsp:include page="/admin/views/contents/dashboard-content.jsp"/>
            <!-- / Content -->
        </div>

    </div>

</div>


<script src="<c:url value="/admin/assets/vendor/js/bootstrap.js"/>"></script>
<script src="<c:url value="/admin/assets/vendor/js/menu.js"/>"></script>
<script src="<c:url value="/admin/assets/js/main.js"/>"></script>
</body>
</html>
