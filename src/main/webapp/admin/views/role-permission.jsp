<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Quản lý Role và Permission</title>

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

    <!-- Javascript  -->
    <script src="<c:url value="/admin/assets/vendor/js/helpers.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/config.js"/>"></script>


    <!-- Data table -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/>"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <!-- DataTables Buttons CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css">

    <!-- DataTables Buttons JS -->
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>


</head>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <!-- Sidebar -->
        <jsp:include page="/admin/views/includes/sidebar.jsp">
            <jsp:param name="activePage" value="role"/>
        </jsp:include>
        <!-- / Sidebar -->
        <div class="layout-page">

            <!-- Header -->
            <jsp:include page="/admin/views/includes/header-breadcrumb.jsp">
                <jsp:param name="breadcrumbs" value="Quản lý Role và Permission"/>
            </jsp:include>
            <!-- / Header -->

            <!-- Content -->
            <jsp:include page="/admin/views/contents/role-permission-content.jsp"/>
            <!-- / Content -->
        </div>

    </div>

</div>

<!-- Toast Container (Top Center) -->
<div class="position-fixed top-0 start-50 translate-middle-x p-3" style="z-index: 9999">
    <div id="roleToast" class="toast align-items-center text-white bg-success border-0 shadow"
         role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body" id="toastMessage">
                <!-- Message from JS -->
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto"
                    data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>

<script src="<c:url value="/admin/assets/vendor/js/bootstrap.js"/>"></script>
<script src="<c:url value="/admin/assets/vendor/js/menu.js"/>"></script>
<script src="<c:url value="/admin/assets/js/main.js"/>"></script>
</body>
</html>
