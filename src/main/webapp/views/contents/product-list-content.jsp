<%@ page import="vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties" %>
<%@ page import="vn.edu.hcmuaf.fit.crocodile.service.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.crocodile.dao.product.strategy.StrategySortByCreateDate" %>
<%@ page import="vn.edu.hcmuaf.fit.crocodile.dao.product.strategy.StrategySortByID" %>
<%@ page import="vn.edu.hcmuaf.fit.crocodile.dao.product.strategy.StrategySortByPriceASC" %>
<%@ page import="vn.edu.hcmuaf.fit.crocodile.dao.product.strategy.StrategySortByPriceDESC" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="vi_VN"/>
<c:url var="homeUrl" value="<%= UrlProperties.home() %>"/>

<div id="CONTENT">
    <!-- Breadcrumb Navigation-->
    <div class="container">
        <nav style="--bs-breadcrumb-divider: '>'">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${homeUrl}">Trang Chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">${requestScope.category.name}</li>
            </ol>
        </nav>
        <hr>
    </div>

    <!-- Products Section -->
    <div class="container">
        <div class="row">
            <!-- Product Filter -->
            <div class="col-12 d-flex flex-column gap-3">
                <!-- Danh muc -->
                <div class="ms-1 ms-lg-0 bg-secondary-subtle p-3">
                    <div class="gap-2" role="button" id="triggerCategory" data-bs-toggle="collapse"
                         data-bs-target="#collapseCategory">
                        <div class="d-flex align-items-center gap-2">
                            <div class="custom-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-chevron-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"></path>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-chevron-down hide" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708"></path>
                                </svg>
                            </div>
                            <h5 class="m-0 lh-sm">Danh Mục</h5>
                        </div>
                    </div>
                    <div class="collapse" id="collapseCategory">
                        <hr>
                        <ul class="category-list row list-unstyled mb-2 ms-3 gy-2">
                            <c:set var="categories" value="<%= new CategoryService().getAllActiveCategory()%>"/>
                            <c:forEach var="cate" items="${categories}">
                                <li class="category-item col-4 ${cate.id == requestScope.category.id ? 'active':''}">
                                    <c:url var="productListUrl" value="<%=UrlProperties.productList()%>">
                                        <c:param name="idCate" value="${cate.id}"/>
                                    </c:url>
                                    <a href="${productListUrl}" class="text-decoration-none">${cate.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- Muc gia -->
                <div class="ms-1 ms-lg-0 bg-secondary-subtle p-3">
                    <div class="gap-2" role="button" id="triggerPriceRange" data-bs-toggle="collapse"
                         data-bs-target="#collapsePriceRange">
                        <div class="d-flex align-items-center gap-2">
                            <div class="custom-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-chevron-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"></path>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-chevron-down hide" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708"></path>
                                </svg>
                            </div>
                            <h5 class="m-0 lh-sm">Mức Giá</h5>
                        </div>
                    </div>
                    <form class="collapse" id="collapsePriceRange">
                        <hr>
                        <div class="d-flex gap-1">
                            <div class="col">
                                <div class="form-check">
                                    <input id="filter-tat-ca" class="form-check-input" type="checkbox" checked>
                                    <label for="filter-tat-ca" class="form-check-label">Tất cả</label>
                                </div>
                                <div class="form-check">
                                    <input id="filter-duoi-500k" class="form-check-input" type="checkbox">
                                    <label for="filter-duoi-500k" class="form-check-label">Dưới 500.000₫</label>
                                </div>
                                <div class="form-check">
                                    <input id="filter-500k-1tr500" class="form-check-input" type="checkbox">
                                    <label for="filter-500k-1tr500" class="form-check-label">500.000₫ -
                                        1.500.000₫</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-check">
                                    <input id="filter-1tr500-3tr" class="form-check-input" type="checkbox">
                                    <label for="filter-1tr500-3tr" class="form-check-label">1.500.000₫ -
                                        3.000.000₫</label>
                                </div>
                                <div class="form-check">
                                    <input id="filter-3tr-5tr" class="form-check-input" type="checkbox">
                                    <label for="filter-3tr-5tr" class="form-check-label">3.000.000₫ -
                                        5.000.000₫</label>
                                </div>
                                <div class="form-check">
                                    <input id="filter-tren-5tr" class="form-check-input" type="checkbox">
                                    <label for="filter-tren-5tr" class="form-check-label">Trên 5.000.000₫</label>
                                </div>
                            </div>
                        </div>
                        <button class="btn custom-btn-primary rounded-0 w-100 text-uppercase mt-3">Áp dụng</button>
                    </form>
                </div>
            </div>

            <!-- Products Container -->
            <div class="col-12 mt-4">
                <!-- Sort bar -->
                <div class="d-flex align-items-center p-4 mb-2 bg-secondary-subtle" style="height: 50px;">
                    <span class="me-3 fw-semibold">Sắp Xếp Theo</span>
                    <div class="d-flex gap-3">
                        <c:url var="sortByDefault" value="<%=UrlProperties.productList()%>">
                            <c:param name="idCate" value="${requestScope.category.id}"/>
                        </c:url>
                        <a class="btn custom-btn-primary bg-white text-black" href="${sortByDefault}"> Mặc định </a>

                        <c:url var="sortByCreateDate" value="<%=UrlProperties.productList()%>">
                            <c:param name="idCate" value="${requestScope.category.id}"/>
                            <c:param name="sortBy" value="<%=StrategySortByCreateDate.NAME%>"/>
                        </c:url>
                        <a class="btn custom-btn-primary bg-white text-black" href="${sortByCreateDate}">Mới Nhất</a>

<%--                        TODO:--%>
                        <a class="btn custom-btn-primary bg-white text-black" href="#">Bán Chạy</a>
                    </div>
                    <div class="dropdown ms-3">
                        <button class="btn bg-white dropdown-toggle" type="button" id="dropdownMenuButton"
                                data-bs-toggle="dropdown" aria-expanded="false">
                            Giá
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <c:url var="sortByPriceASC" value="<%=UrlProperties.productList()%>">
                                <c:param name="idCate" value="${requestScope.category.id}"/>
                                <c:param name="sortBy" value="<%=StrategySortByPriceASC.NAME%>"/>
                            </c:url>
                            <li><a class="dropdown-item" href="${sortByPriceASC}">Giá: Tăng Dần</a></li>

                            <c:url var="sortByPriceDESC" value="<%=UrlProperties.productList()%>">
                                <c:param name="idCate" value="${requestScope.category.id}"/>
                                <c:param name="sortBy" value="<%=StrategySortByPriceDESC.NAME%>"/>
                            </c:url>
                            <li><a class="dropdown-item" href="${sortByPriceDESC}">Giá: Giảm Dần</a></li>
                        </ul>
                    </div>
                </div>

                <!-- Product list -->
                <c:choose>
                    <c:when test="${empty requestScope.listProductSearch}">
                        <ul id="products-list" class="list-unstyled row">
                            <c:forEach var="p" items="${requestScope.productList}">
                                <li class="p-2">
                                    <c:url var="productUrl" value="<%=UrlProperties.productDetail()%>">
                                        <c:param name="id" value="${p.id}"/>
                                    </c:url>
                                    <fmt:formatNumber var="fmtPrice" value="${p.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                    <a class="product_card_template" href="${productUrl}"
                                       data-json='{
                                "img": "${p.image}",
                                "name": "${p.name}",
                                "price": "${fmtPrice}",
                                "basePrice": "",
                                "discount": "",
                                "badge": "NEW"
                                }'>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul id="products-list" class="list-unstyled row">
                            <c:forEach var="p" items="${requestScope.listProductSearch}">
                                <li class="p-2">
                                    <c:url var="productUrl" value="<%= UrlProperties.productDetail() %>">
                                        <c:param name="id" value="${p.id}"/>
                                    </c:url>
                                    <fmt:formatNumber var="fmtPrice" value="${p.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                    <a class="product_card_template" href="${productUrl}"
                                       data-json='{
                                       "img": "${p.image}",
                                       "name": "${p.name}",
                                       "price": "${fmtPrice}",
                                       "basePrice": "",
                                       "discount": "",
                                       "badge": "NEW"
                                   }'>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>

                    </c:otherwise>
                </c:choose>


            </div>
        </div>
    </div>

    <!-- Pagination-->
    <c:if test="${empty requestScope.productList}">
        <div class="container">
            <ul class="pagination pagination-lg justify-content-center m-5">
                <c:url var="prev" value="<%=UrlProperties.productList()%>">
                    <c:param name="idCate" value="${requestScope.category.id}"/>
                    <c:param name="page" value="${requestScope.page-1}"/>
                </c:url>
                <li class="page-item ${requestScope.page == 1 ? 'disabled':''}"><a class="page-link" href="${prev}"><</a></li>
                <c:forEach begin="1" end="${requestScope.maxPage}" var="i">
                    <c:url var="productListUrl" value="<%=UrlProperties.productList()%>">
                        <c:param name="idCate" value="${requestScope.category.id}"/>
                        <c:param name="page" value="${i}"/>
                        <c:param name="sortBy" value="${requestScope.sortStrategy}"/>
                    </c:url>
                    <li class="page-item ${requestScope.page == i ? 'active' : ''}"><a class="page-link" href="${productListUrl}">${i}</a></li>
                </c:forEach>
                <c:url var="next" value="<%=UrlProperties.productList()%>">
                    <c:param name="idCate" value="${requestScope.category.id}"/>
                    <c:param name="page" value="${requestScope.page+1}"/>
                </c:url>
                <li class="page-item ${requestScope.page == requestScope.maxPage ? 'disabled':''}"><a class="page-link" href="${next}">></a></li>
            </ul>
        </div>
    </c:if>
</div>