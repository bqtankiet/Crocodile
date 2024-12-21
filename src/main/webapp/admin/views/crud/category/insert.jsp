<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

  <title>Thêm danh mục</title>

  <meta name="description" content="" />

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

  <link rel="stylesheet" href="<c:url value="/admin/assets/vendor/css/pages/page-auth.css"/>" />
</head>
<body>
  <div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
      <!-- Sidebar -->
      <jsp:include page="/admin/views/includes/sidebar.jsp">
        <jsp:param name="activePage" value="category"/>
      </jsp:include>
      <!-- / Sidebar -->

      <div class="layout-page">
        <!-- Header -->
        <jsp:include page="/admin/views/includes/header.jsp" />
        <!-- / Header -->

        <!-- Content -->
        <jsp:include page="/admin/views/contents/category/insert-content.jsp"/>
        <!-- / Content -->
      </div>
    </div>

  </div>
</body>
</html>
