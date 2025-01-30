<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crocodile - Trang chủ</title>
    <!--  jquery  -->
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/>"></script>

    <!--  bootstrap  -->
    <link rel="stylesheet" href="<c:url value="/public/bootstrap/css/bootstrap.css"/>">
    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>

    <!--  css  -->
    <link rel="stylesheet" href="<c:url value="/assets/css/home.css"/> ">
    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/> ">

    <!-- link css box icon -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <!-- link font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- owl carousel -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
            integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
          integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
          integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <!-- product_gallery_template -->
    <link rel="stylesheet" href="<c:url value="/components/product_gallery/product_gallery.css"/> ">
    <script src="<c:url value="/components/product_gallery/product_gallery_template.js"/> "></script>

    <!-- product_card_template -->
    <link rel="stylesheet" href="<c:url value="/components/product_card/product_card.css"/> ">
    <script>
        $(document).ready(function () {
            $.get("<c:url value="/components/product_card/product_card_template.js"/>");
        });
    </script>

</head>
<body>
    <%--HEADER--%>
<%--    <jsp:include page="includes/header.jsp">--%>
<%--        <jsp:param name="activePage" value="home"/>--%>
<%--    </jsp:include>--%>
    <%--CONTENT--%>
    <jsp:include page="contents/home-content.jsp"/>
    <%--FOOTER--%>
    <jsp:include page="includes/footer.jsp"/>
</body>
</html>
