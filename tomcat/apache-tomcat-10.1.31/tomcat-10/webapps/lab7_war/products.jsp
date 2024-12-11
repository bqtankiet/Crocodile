<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Crocodile - Ví Nam</title>
    <!--  jquery  -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>    <!--  bootstrap  -->
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>    <!--  custom css  -->
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
        :root {
            --custom-bg-primary: #007b5f;
            --custom-bg-primary-darker: #004c45;
        }

        .line-clamp-2 {
            --line: 2;
            display: -webkit-box;
            -webkit-line-clamp: var(--line);
            -webkit-box-orient: vertical;
            overflow: hidden;
            line-height: 1.5;
            height: 3em;
            padding-bottom: 0.15rem
        }

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
<div id="page">
    <div id="CONTENT">
        <!-- Products Section -->
        <div class="container">
            <div class="row">
                <!-- Products Container -->
                <div class="col-12 mt-4">
                    <!-- Product list -->
                    <ul id="products-list" class="list-unstyled row">
                        <c:forEach var="p" items="${products}">
                            <li class="p-2">
                                <a class="product_card_template" href="404"
                                   data-json='{
                                "img": "${p.image}",
                                "name": "${p.name}",
                                "price": "<fmt:formatNumber value="${p.price}" pattern="#,###" />",
                                "basePrice": "<fmt:formatNumber value="${p.basePrice}" pattern="#,###" />",
                                "discount": "Giảm ${p.discount}%"
                                }'>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Pagination-->
        <div class="container">
            <ul class="pagination pagination-lg justify-content-center m-5">
                <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">></a></li>
            </ul>
        </div>
    </div>
</div>
<script src="product_card_template.js"></script>
</body>
</html>
