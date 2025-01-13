<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên Mật Khẩu</title>
    <!--  jquery  -->
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/>"></script>
    <!--  bootstrap  -->
    <link rel="stylesheet" href="<c:url value="/public/bootstrap/css/bootstrap.css"/>">
    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>
    <!--  css  -->
    <link rel="stylesheet" href="<c:url value="/layouts/layout.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/>">
    <!--  js  -->
    <style>
        .card-custom {
            max-width: 32rem;
        }

        .tooltip-custom .tooltip-inner {
            background-color: white;
            color: black;
            border: 1px solid #339933;
            padding: 8px;
            font-weight: bold;
            border-radius: 5px;
        }

        /*.card-custom {*/
        /*    max-width: 100%;*/
        /*    padding: 1.5rem;*/
        /*}*/

        /*@media (max-width: 768px) {*/
        /*    .card-custom {*/
        /*        max-width: 90%; !* Giảm kích thước card cho màn hình nhỏ *!*/
        /*        margin: 0 auto;*/
        /*    }*/

        /*    .container-fluid {*/
        /*        flex-direction: column; !* Sắp xếp theo chiều dọc *!*/
        /*        align-items: stretch;*/
        /*    }*/

        /*    img {*/
        /*        max-width: 80%; !* Thu nhỏ logo trên màn hình nhỏ *!*/
        /*        margin-bottom: 1rem;*/
        /*    }*/
        /*}*/

    </style>

</head>
<body>
<jsp:include page="includes/header.jsp">
    <jsp:param name="activePage" value="about"/>
</jsp:include>
<%--CONTENT--%>
<jsp:include page="contents/forgetPassword-content.jsp"/>
<%--FOOTER--%>
<jsp:include page="includes/footer.jsp"/>
</body>
</html>
