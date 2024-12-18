<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:url var="accountUrl" value="${applicationScope.urls['admin.account']}"/>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/"
      data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Page Not Found</title>

    <meta name="description" content="" />

    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet" />

    <link rel="stylesheet" href="<c:url value="/admin/assets/vendor/css/core.css"/>" class="template-customizer-core-css" />

    <link rel="stylesheet" href="<c:url value="/admin/assets/vendor/css/pages/page-misc.css"/>">

</head>

<body>

<!-- Error -->
<div class="container-xxl container-p-y">
    <div class="misc-wrapper">
        <h2 class="mb-2 mx-2">Page Not Found :(</h2>
        <p class="mb-4 mx-2">Oops! 😖 The requested URL was not found on this server.</p>
        <div style="width: 136px; height: 38px;"></div>
        <div class="mt-3">
            <img src="<c:url value="/admin/assets/img/illustrations/page-misc-error-light.png"/>" alt="page-misc-error-light" width="500"
                 class="img-fluid" data-app-dark-img="illustrations/page-misc-error-dark.png"
                 data-app-light-img="illustrations/page-misc-error-light.png" />
        </div>
    </div>
</div>
<!-- /Error -->


</body>

</html>
