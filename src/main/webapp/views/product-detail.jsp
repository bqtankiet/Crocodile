<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ví gấp nam da cá sấu V7068</title>
    <!--  jquery  -->
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/>"></script>

    <!--  bootstrap  -->
    <link rel="stylesheet" href="<c:url value="/public/bootstrap/css/bootstrap.css"/>">
    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>

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

    <!--  css  -->
    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/> ">

    <!--  js  -->
    <script src="<c:url value="/assets/js/quantity-control.js"/> "></script>

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


    <!--  INTERNAL CSS  -->
    <style>

        #product_descriptions {
            line-height: 1.5;
            letter-spacing: 0.05rem;
            height: 100%;
            overflow: hidden;
        }

        /*#product_descriptions img {*/
        /*    width: 100% !important;*/
        /*    height: auto !important;*/
        /*    aspect-ratio: 1;*/
        /*    object-fit: cover;*/
        /*}*/

        .show-more {
            position: relative;
        }

        .show-more::before {
            content: "";
            width: 100%;
            height: 10rem;
            background-image: linear-gradient(to bottom, transparent, #ededed);
            position: absolute;
            top: 0;
            transform: translateY(-100%);
        }

        .rating_box {
            border: 1px solid gray;
            border-radius: 5px;
        }

        .rating_box > * {
            padding: 1rem;
        }

        .rating_box .rating_average {
            border-right: 1px solid gray;
        }

        .rating.active {
            background-color: #198754
            color: white;
            border-color: #28a745;
        }
    </style>

    <!--  Xử lý sự kiện các button trong phần mô tả sản phẩm  -->
    <script>
        $(document).ready(function () {
            $('#show-more-btn').on("click", function () {
                $('#product_descriptions').css("height", "max-content");
                $('.show-more').toggleClass("d-none");
                $('.show-less').toggleClass("d-none");
            });

            $('.show-less').on("click", function () {
                $('#product_descriptions').css("height", "10ch");
                $('.show-more').toggleClass("d-none");
                $('.show-less').toggleClass("d-none");
            });
        });
    </script>

    <!--  Khai báo Bootstrap tooltip  -->
    <script>
        $(document).ready(function () {
            const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
            const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
        });
    </script>
</head>
<body>
<%--HEADER--%>
<jsp:include page="includes/header.jsp">
    <jsp:param name="activePage" value="products"/>
</jsp:include>

<%--CONTENT--%>
<jsp:include page="contents/product-detail-content.jsp"/>

<%--FOOTER--%>
<jsp:include page="includes/footer.jsp"/>
</body>
</html>
