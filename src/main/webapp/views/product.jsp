<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Crocodile - Ví Nam</title>
    <!--  jquery  -->
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/>"></script>
    <!--  bootstrap  -->
    <link rel="stylesheet" href="<c:url value="/public/bootstrap/css/bootstrap.css"/>">
    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>
    <!--  custom css  -->
    <link rel="stylesheet" href="<c:url value="/layouts/layout.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/>">
    <!--  custom js  -->
    <script src="<c:url value="/components/product_card/product_card_template.js"/>"></script>

    <!--  Media queries  -->
    <style>
        @media (min-width: 992px) {
            #page {
                min-width: 1200px;
            }

            /*#triggerCategory,*/
            /*#triggerPriceRange {*/
            /*    pointer-events: none;*/
            /*}*/
            #products-list li {
                width: 25%;
            }
        }

        @media (max-width: 992px) {
            #page {
                min-width: 1000px;
            }

            #products-list li {
                width: 25%;
            }
        }

        @media (max-width: 768px) {
            #page {
                min-width: 768px;
            }

            #page #products-list li {
                width: 33.33%;
            }
        }

        @media (max-width: 576px) {
            #page {
                min-width: 576px;
            }

            #page #products-list li {
                width: 50%;
            }
        }
    </style>

    <!--  INTERNAL CSS  -->
    <style>
        .page-item.active > .page-link {
            --color: var(--custom-bg-primary);
            border-color: var(--custom-bg-primary);
            background-color: var(--custom-bg-primary);
            color: white;
        }

        .page-item > .page-link {
            color: gray;
        }

        .hide {
            display: none;
        }

        .dropdown-menu .dropdown-item {
            background-color: transparent;
        }

        .form-check-input {
            border: 2px solid gray;

            &:hover {
                cursor: pointer;
                background-color: #d9e4d9;
            }

            &:checked {
                background-color: var(--custom-bg-primary);
                border: none;
            }

            &:focus {
                border: 2px solid var(--custom-bg-primary);
            }
        }

        .category-item a {
            position: relative;
            color: black;

            &:hover {
                color: var(--custom-bg-primary-darker);
            }
        }

        .category-item.active a {
            font-weight: bold;
            color: var(--custom-bg-primary-darker);
            border-bottom: 2px solid var(--custom-bg-primary-darker);
        }
    </style>

    <!--  INTERNAL JS  -->
    <script>
        $(document).ready(function () {
            $("#triggerCategory").click(function () {
                $(this).find(".bi-chevron-right").toggle("hide");
                $(this).find(".bi-chevron-down").toggle("hide");
            });
            $("#triggerPriceRange").click(function () {
                $(this).find(".bi-chevron-right").toggle("hide");
                $(this).find(".bi-chevron-down").toggle("hide");
            });

        });
    </script>
</head>
<body>
    <%--HEADER--%>
    <jsp:include page="includes/header.jsp">
        <jsp:param name="activePage" value="products"/>
    </jsp:include>
    <%--CONTENT--%>
    <jsp:include page="contents/product-content.jsp"/>
    <%--FOOTER--%>
    <jsp:include page="includes/footer.jsp"/>
</body>
</html>
