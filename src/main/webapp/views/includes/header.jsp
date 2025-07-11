<%@ page import="vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties" %>
<%@ page import="vn.edu.hcmuaf.fit.crocodile.service.CategoryService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<fmt:setLocale value="vi_VN"/>
<c:set var="categories" value="<%= new CategoryService().getAllActiveCategory()%>"/>

<c:url var="homeUrl" value="<%= UrlProperties.home() %>"/>
<c:url var="contactUrl" value="<%= UrlProperties.contact() %>"/>
<c:url var="aboutUrl" value="<%= UrlProperties.about() %>"/>
<c:url var="loginUrl" value="<%= UrlProperties.login() %>"/>
<c:url var="cartUrl" value="<%= UrlProperties.cart() %>"/>
<c:url var="productListUrl" value="<%= UrlProperties.productList() %>"/>


<c:set var="activeHome" value="home"/>
<c:set var="activeAbout" value="about"/>
<c:set var="activeContact" value="contact"/>
<c:set var="activeProducts" value="products"/>
<!--HTML-->
<header class="header position-relative">
    <!--Style-->
    <style>

        header .navbar-wrapper {
            background-color: var(--custom-bg-primary);
        }

        header .fixed-navbar.fixed-top {
            opacity: 0;
            display: none;
            transition: all ease .25s;
            background-color: var(--custom-bg-primary);
        }

        header .custom-navbar .nav-item .nav-link {
            color: white;
            display: flex;
            align-items: center;
            font-weight: 600;
            gap: 0.3rem;

            svg {
                display: none;
                width: 1.2rem;
                height: 1.2rem;
            }
        }

        header .custom-navbar .nav-item .nav-link:hover {
            opacity: 0.8;
        }

        header .custom-navbar .nav-item .nav-link.active {
            font-weight: bold;
            position: relative;
            color: white;
        }

        header .custom-navbar .nav-item .nav-link.active::after {
            content: "";
            width: 100%;
            height: 2px;
            background-color: white;
            position: absolute;
            bottom: 4px;
            left: 0;
        }

        header .dropdown:hover .dropdown-menu {
            display: block;
            margin-top: 0;
        }

        header .dropdown-menu .dropdown-item {
            background-color: transparent;
            color: white;
        }

        header .dropdown-menu .dropdown-item:hover {
            /*color: var(--custom-bg-primary);*/
            color: lightgray;
        }
    </style>

    <!--  Text uu dai  -->
    <div class="d-flex justify-content-center py-1 bg-secondary-subtle">
        <p class="small custom-text-primary fw-medium mb-0">Ưu đãi đặc biệt dành cho tài khoản mới.
            <span style="color: orangered">Giảm ngay 50%</span> cho đơn hàng đầu tiên.
        </p>
    </div>

    <!--  Search bar and other -->
    <div class="container-xl my-4">
        <div class="row align-items-center justify-content-center mx-auto col-11 col-lg-12">
            <a class="h1 text-decoration-none col-3 order-lg-0" href="${homeUrl}">
                <img src="https://www.crocodileinternational.com/img/crocodile-logo-1609222037.jpg" alt="Logo"
                     style="width: 15rem">
            </a>
            <form class="d-flex p-2 mt-2 mt-lg-0 rounded-5 col-lg col-12 order-lg-1 order-3 mx-3 bg-secondary-subtle"
                  role="search" action="${productListUrl}" method="get">
                <input id="search-bar" class="form-control shadow-none mx-2 border-0" style="background-color: inherit"
                       type="text"
                       placeholder="Tìm kiếm sản phẩm" name="key"
                       aria-label="Search">
                <button class="bg-transparent border-0 me-2" type="submit">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1.3rem" height="1.3rem"
                         fill="gray">
                        <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"></path>
                    </svg>
                </button>
            </form>
            <!-- Account, Cart -->
            <div class="d-flex justify-content-around lh-1 text-nowrap col-3 col-lg-3 ms-auto me-5 gap-5 gap-lg-4 order-lg-2">
                <c:choose>
                    <c:when test="${not empty sessionScope.fullName}">
                        <a href="${pageContext.request.contextPath}/user"
                           class="text-decoration-none position-relative custom-text-primary col-6">
                            <div class="d-flex align-items-center justify-content-end">
                                <div class="custom-icon" style="--size: 2rem">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"></path>
                                        <path fill-rule="evenodd"
                                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"></path>
                                    </svg>
                                </div>
                                <div class="ps-2">
                                    <div class="small pb-1">Xin chào</div>
                                    <!-- Giữ nguyên avatar, chỉ cập nhật username -->
                                    <div class="pb-1 fw-semibold text-truncate"
                                         style="width: 10ch">${sessionScope.fullName}</div>
                                </div>
                            </div>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${loginUrl}" class="text-decoration-none position-relative custom-text-primary col-6">
                            <div class="d-flex align-items-center justify-content-end">
                                <div class="custom-icon" style="--size: 2rem">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"></path>
                                        <path fill-rule="evenodd"
                                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"></path>
                                    </svg>
                                </div>
                                <div class="ps-2">
                                    <div class="small pb-1">Tài khoản</div>
                                    <div class="pb-1 fw-semibold text-truncate" style="width: 10ch">Đăng nhập</div>
                                </div>
                            </div>
                        </a>
                    </c:otherwise>
                </c:choose>


                <%-- TODO: giỏ hàng trên header--%>
                <a id="cart-toggle" class="text-decoration-none position-relative custom-text-primary col-6"
                   href="${param.activePage != "cart" ? '#offcanvasRight' : ''}" role="button" data-bs-toggle="offcanvas">
                    <div class="d-flex align-items-center justify-content-end">
                        <div class="custom-icon" style="--size: 2rem">
                            <c:if test="${sessionScope.cart != null && sessionScope.cart.size != 0}">
                                <span class="badge text-bg-danger position-absolute translate-middle rounded-pill">
                                        ${sessionScope.cart.size}
                                </span>
                            </c:if>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-bag" viewBox="0 0 16 16">
                                <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"></path>
                            </svg>
                        </div>
                        <div class="ps-2">
                            <div class="small pb-1">Giỏ hàng</div>

                            <div class="pb-1 fw-semibold text-truncate totalAmountCart" style="width: 10ch">
                                <c:if test="${empty sessionScope.cart}">0₫</c:if>
                                <fmt:formatNumber value="${sessionScope.cart.totalPrice}"
                                                  type="currency" currencySymbol="₫" groupingUsed="true"/>
                            </div>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </div>

    <!--  Navigation bar  -->
    <div class="navbar-wrapper">
        <div class="container-xl">
            <!-- normal navbar -->
            <nav class="navbar custom-navbar">
                <div class="d-flex flex-grow-1 justify-content-between">
                    <ul class="navbar-nav flex-grow-1 d-flex flex-row justify-content-center align-items-center gap-5 text-capitalize">
                        <li class="nav-item">
                            <a href="${homeUrl}"
                               class="nav-link home-page ${param.activePage == activeHome ? 'active' : ''}">
                                Trang chủ
                            </a>
                        </li>
                        <li class="nav-item position-relative dropdown">
                            <a href="#"
                               class="nav-link products-page ${param.activePage == activeProducts ? 'active' : ''}">
                                <div class="dropdown-toggle" data-bs-toggle="dropdown">Sản phẩm</div>
                            </a>
                            <ul class="dropdown-menu position-absolute rounded-0 custom-bg-primary-darker shadow-lg">
                                <c:forEach var="category" items="${categories}">
                                    <c:url var="url_categoryId" value="<%=UrlProperties.productList()%>">
                                        <c:param name="idCate" value="${category.id}"/>
                                    </c:url>
                                    <li><a class="dropdown-item" href="${url_categoryId}">${category.name}</a></li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="${contactUrl}"
                               class="nav-link contact-page ${param.activePage == activeContact ? 'active' : ''}">
                                Liên hệ
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${aboutUrl}"
                               class="nav-link about-page ${param.activePage == activeAbout ? 'active' : ''}">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-info-circle" viewBox="0 0 16 16">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"></path>
                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0"></path>
                                </svg>
                                Giới Thiệu
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- fixed top navbar -->
            <nav class="fixed-navbar fixed-top navbar custom-navbar shadow-lg px-0">
                <div class="container">
                    <div class="col-3">
                        <a href="${homeUrl}">
                            <img src="https://www.crocodileinternational.com/themes/crocs_child/assets/img/logo.svg"
                                 style="height: 2.5rem" alt="Logo">
                        </a>
                    </div>
                    <div class="col">
                        <ul class="navbar-nav flex-grow-1 d-flex flex-row justify-content-center align-items-center gap-5 text-capitalize">
                            <li class="nav-item">
                                <a href="${homeUrl}"
                                   class="nav-link home-page ${param.activePage == activeHome ? 'active' : ''}">
                                    Trang chủ
                                </a>
                            </li>
                            <li class="nav-item position-relative dropdown ">
                                <a href="#"
                                   class="nav-link products-page ${param.activePage == activeProducts ? 'active' : ''}">
                                    <div class="dropdown-toggle" data-bs-toggle="dropdown">Sản phẩm</div>
                                </a>
                                <ul class="dropdown-menu position-absolute rounded-0 custom-bg-primary-darker shadow-lg">
                                    <c:forEach var="category" items="${categories}">
                                        <c:url var="url_categoryId" value="<%=UrlProperties.productList()%>">
                                            <c:param name="idCate" value="${category.id}"/>
                                        </c:url>
                                        <li><a class="dropdown-item" href="${url_categoryId}">${category.name}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="${contactUrl}"
                                   class="nav-link contact-page ${param.activePage == activeContact ? 'active' : ''}">
                                    Liên hệ
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${aboutUrl}"
                                   class="nav-link about-page ${param.activePage == activeAbout ? 'active' : ''}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-info-circle" viewBox="0 0 16 16">
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"></path>
                                        <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0"></path>
                                    </svg>
                                    Giới Thiệu
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-3 d-flex justify-content-end gap-4">
                        <a role="button" class="my-auto" href="#">
                            <div class="custom-icon text-white" style="--size: 1.7rem">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="16" height="16"
                                     fill="currentColor">
                                    <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"></path>
                                </svg>
                            </div>
                        </a>

                        <c:set var="userUrl" value="${pageContext.request.contextPath}/user"/>
                        <a href="${sessionScope.userName == null ? loginUrl : userUrl}">
                            <div class="custom-icon text-white" style="--size: 2rem">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-person-circle" viewBox="0 0 16 16">
                                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"></path>
                                    <path fill-rule="evenodd"
                                          d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"></path>
                                </svg>
                            </div>
                        </a>
                        <a href="${param.activePage != "cart" ? '#offcanvasRight' : ''}" role="button" data-bs-toggle="offcanvas">
                            <div class="custom-icon text-white" style="--size: 2rem">
                                <c:if test="${sessionScope.cart != null}">
                                    <span class="badge text-bg-danger position-absolute translate-middle rounded-pill">
                                            ${sessionScope.cart.size}
                                    </span>
                                </c:if>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-bag" viewBox="0 0 16 16">
                                    <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"></path>
                                </svg>
                            </div>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <!--  Offcanvas Gio Hang  -->
    <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasRight" style="width: 420px">
        <div class="offcanvas-header">
            <div class="custom-icon me-1 position-relative" style="--size: 2rem">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-bag" viewBox="0 0 16 16">
                    <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"></path>
                </svg>
            </div>
            <h5 class="offcanvas-title fw-bold text-uppercase" id="offcanvasRightLabel">Giỏ hàng</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body d-flex flex-column gap-3">
            <c:forEach items="${sessionScope.cart.items}" var="item">
                <c:set var="productVariant" value="${item.productVariant}"/>
                <div class="border-bottom pb-3">
                    <div class="row g-0">
                        <div class="col-2 me-3 position-relative">
                                <%-- số lượng sản phẩm--%>
                            <span class="position-absolute top-0 start-100 z-1 translate-middle badge rounded-pill bg-danger">
                                    ${item.quantity}
                            </span>

                                <%-- hình ảnh sản phẩm --%>
                            <div class="ratio ratio-1x1">
                                <img src="${productVariant.product.image}" class="img-fluid border rounded-2" alt="">
                            </div>
                        </div>

                        <div class="col lh-1 my-auto">
                            <div class="w-100">
                                <div class="d-flex align-items-center">
                                    <div class="me-2">
                                            <%-- tên sản phẩm --%>
                                        <p class="fw-semibold mb-0 line-clamp-2"
                                           style="height: fit-content ;max-height: 2.5rem; line-height: 1.2">
                                                ${productVariant.product.name}
                                        </p>

                                            <%-- loại sản phẩm --%>
                                        <c:if test="${productVariant.idOption1 != null}">
                                            <p class="fw-normal">${productVariant.pOption1.key}: ${productVariant.pOption1.value}
                                                <c:if test="${productVariant.pOption2 != null}">
                                                    , ${productVariant.pOption2.key}: ${productVariant.pOption2.value}
                                                </c:if>
                                            </p>
                                        </c:if>
                                    </div>
                                        <%-- tổng tiền sản phẩm --%>
                                    <div class="ms-auto fw-medium fs-6">
                                        <c:if test="${empty sessionScope.cart}">0₫</c:if>
                                        <fmt:formatNumber value="${item.caculatePrice()}" type="currency"
                                                          currencySymbol="₫" groupingUsed="true"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div class="p-3">
            <%-- Tổng tiền giỏ hàng --%>
            <div class="d-flex gap-2 fw-bold">
                <p>Tổng:</p>
                <p>
                    <c:if test="${empty sessionScope.cart}">0₫</c:if>
                    <fmt:formatNumber value="${sessionScope.cart.totalPrice}" type="currency" currencySymbol="₫"
                                      groupingUsed="true"/>
                </p>
            </div>
            <a href="${cartUrl}"
               class="btn custom-btn-primary mt-auto w-100 py-2 fw-medium">Xem chi tiết</a>
        </div>
    </div>
    <!--JavaScript-->
    <script>
        // "SCROLL EVENT" - Toggle fixed navbar
        window.addEventListener('scroll', function () {
            const fixedNavbar = $(".fixed-navbar");
            fixedNavbar.css('display', 'block');
            if (window.scrollY > 200) {
                fixedNavbar.css('opacity', '1');
            } else {
                fixedNavbar.css('display', 'none');
                fixedNavbar.css('opacity', '0');
            }
        });
    </script>

    <!-- Search -->
    <script>
        $(document).ready(function () {
            let debounceTimeout;

            $('#search-bar').on('keyup', function () {
                const keyWord = $(this).val();
                console.log(keyWord);

                // Hủy bỏ yêu cầu trước đó nếu người dùng tiếp tục gõ
                clearTimeout(debounceTimeout);

                if (keyWord.length >= 1) {
                    // Thực hiện tìm kiếm sau 300ms khi người dùng ngừng gõ
                    debounceTimeout = setTimeout(function () {
                        $.ajax({
                            url: '${productListUrl}',
                            method: 'GET',
                            data: {key: keyWord},
                            success: function (response) {

                            },
                            error: function (error) {
                                console.log('Error: ', error);
                            }
                        });
                    }, 300);
                }
            });
        });
    </script>
    <script>
        // Kiểm tra và hiển thị thông báo đăng nhập thành công
        $(document).ready(function() {
            const urlParams = new URLSearchParams(window.location.search);
            const loginSuccess = urlParams.get('login');

            if (loginSuccess === 'success') {
                // Hiển thị thông báo thành công
                showLoginSuccessMessage();

                // Xóa parameter khỏi URL để tránh hiển thị lại khi refresh
                const newUrl = window.location.pathname + window.location.search.replace(/[?&]login=success/, '');
                window.history.replaceState({}, document.title, newUrl);
            }

            // Kiểm tra lỗi đăng nhập
            const loginError = urlParams.get('error');
            if (loginError) {
                showLoginErrorMessage(loginError);

                // Xóa error parameter khỏi URL
                const newUrl = window.location.pathname + window.location.search.replace(/[?&]error=[^&]*/, '');
                window.history.replaceState({}, document.title, newUrl);
            }
        });

        function showLoginSuccessMessage() {
            // Tạo toast notification
            const toast = $(`
            <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 9999;">
                <div id="loginSuccessToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header bg-success text-white">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle-fill me-2" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.061L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                        </svg>
                        <strong class="me-auto">Thành công</strong>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast"></button>
                    </div>
                    <div class="toast-body">
                        Đăng nhập thành công! Chào mừng bạn đến với Crocodile.
                    </div>
                </div>
            </div>
        `);

            $('body').append(toast);

            // Hiển thị toast
            const toastElement = new bootstrap.Toast(document.getElementById('loginSuccessToast'), {
                delay: 4000 // Hiển thị trong 4 giây
            });
            toastElement.show();

            // Xóa toast sau khi ẩn
            $('#loginSuccessToast').on('hidden.bs.toast', function() {
                $(this).parent().remove();
            });
        }

        function showLoginErrorMessage(errorCode) {
            let errorMessage = 'Đăng nhập thất bại. Vui lòng thử lại.';

            switch(errorCode) {
                case 'missing_token':
                    errorMessage = 'Thiếu thông tin xác thực. Vui lòng thử lại.';
                    break;
                case 'invalid_token':
                    errorMessage = 'Thông tin xác thực không hợp lệ.';
                    break;
                case 'user_creation_failed':
                    errorMessage = 'Không thể tạo tài khoản. Vui lòng liên hệ hỗ trợ.';
                    break;
                case 'firebase_auth':
                    errorMessage = 'Lỗi xác thực Firebase. Vui lòng thử lại.';
                    break;
                case 'unexpected':
                    errorMessage = 'Có lỗi không mong muốn xảy ra. Vui lòng thử lại sau.';
                    break;
            }

            // Tạo toast notification lỗi
            const toast = $(`
            <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 9999;">
                <div id="loginErrorToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header bg-danger text-white">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle-fill me-2" viewBox="0 0 16 16">
                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                        </svg>
                        <strong class="me-auto">Lỗi</strong>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast"></button>
                    </div>
                    <div class="toast-body">
                        ${errorMessage}
                    </div>
                </div>
            </div>
        `);

            $('body').append(toast);

            // Hiển thị toast
            const toastElement = new bootstrap.Toast(document.getElementById('loginErrorToast'), {
                delay: 5000 // Hiển thị trong 5 giây
            });
            toastElement.show();

            // Xóa toast sau khi ẩn
            $('#loginErrorToast').on('hidden.bs.toast', function() {
                $(this).parent().remove();
            });
        }

        // Cập nhật thông tin giỏ hàng khi có thay đổi session
        function updateCartInfo() {
            // Chỉ cập nhật nếu có cart trong session
            if (typeof window.updateCartDisplay === 'function') {
                window.updateCartDisplay();
            }
        }

        // Gọi cập nhật giỏ hàng sau khi đăng nhập thành công
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('login') === 'success') {
            setTimeout(updateCartInfo, 1000); // Delay để đảm bảo session đã được cập nhật
        }
    </script>
</header>