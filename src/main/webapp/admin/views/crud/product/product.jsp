<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Quản lý sản phẩm</title>

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

    <!-- Kích hoạt Data table  -->
    <script>
        $(document).ready(function () {
            $('#products-table').DataTable({
                "language": {
                    "search": "Tìm kiếm:",
                    "lengthMenu": "Hiển thị _MENU_ mục",
                    "info": "Hiển thị _START_ đến _END_ trong tổng số _TOTAL_ mục",
                    "paginate": {
                        "first": "Đầu",
                        "last": "Cuối",
                        "next": "Sau",
                        "previous": "Trước"
                    }
                }
            });
        });
    </script>
    <!-- Data table -->
</head>
<body>
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">

            <!-- Sidebar -->
            <jsp:include page="/admin/views/includes/sidebar.jsp">
                <jsp:param name="activePage" value="product"/>
            </jsp:include>
            <!-- / Sidebar -->
            <div class="layout-page">

                <!-- Header -->
                <jsp:include page="/admin/views/includes/header-breadcrumb.jsp">
                    <jsp:param name="breadcrumbs" value="Quản lý sản phẩm"/>
                </jsp:include>
                <!-- / Header -->

                <!-- Content -->
                <jsp:include page="/admin/views/contents/product-content.jsp"/>
                <!-- / Content -->
            </div>

        </div>

    </div>

<script src="<c:url value="/admin/assets/vendor/js/bootstrap.js"/>"></script>
<script src="<c:url value="/admin/assets/vendor/js/menu.js"/>"></script>
<script src="<c:url value="/admin/assets/js/main.js"/>"></script>
</body>
</html>
