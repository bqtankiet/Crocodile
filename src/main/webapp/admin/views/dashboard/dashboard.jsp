<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="description" content=""/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
    <title>Crocodile - Dashboard</title>
    <!-- JavaScript  -->
    <script src="<c:url value="/admin/assets/vendor/js/helpers.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/config.js"/>"></script>
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/> "></script>
    <!-- Style  -->
    <link rel="stylesheet" href="<c:url value="/admin/views/dashboard/css/main.css"/>"/>
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
            <jsp:include page="/admin/views/includes/header.jsp"/>
            <!-- / Header -->

            <!-- Content -->
            <jsp:include page="/admin/views/dashboard/dashboard-content.jsp"/>
            <!-- / Content -->
        </div>

    </div>

</div>


<script src="<c:url value="/admin/assets/vendor/js/bootstrap.js"/>"></script>
<script src="<c:url value="/admin/assets/vendor/js/menu.js"/>"></script>
<script src="<c:url value="/admin/assets/js/main.js"/>"></script>
</body>
</html>
