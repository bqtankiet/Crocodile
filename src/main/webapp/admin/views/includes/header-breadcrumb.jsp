<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:url var="loginUrl" value="<%= vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties.login()%>" />
<c:url var="accountUrl" value="<%= UrlProperties.account()%>"/>

<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
     id="layout-navbar">
    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
            <i class="bx bx-menu bx-sm"></i>
        </a>
    </div>

    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
        <div class="navbar-nav flex-grow-1">
            <div class="nav-item d-flex align-items-center">
                <ol class="breadcrumb m-0">
                    <c:forEach var="breadcrumb" items="${paramValues.breadcrumbs}" varStatus="status">
                        <c:set var="breadcrumbData" value="${fn:split(breadcrumb, '|')}" />
                        <li class="breadcrumb-item ${status.last ? 'active' : ''}" ${status.last ? 'aria-current="page"' : ''}>
                            <c:choose>
                                <c:when test="${status.last}">
                                    ${breadcrumbData[0]}
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value="${breadcrumbData[1]}"/>">${breadcrumbData[0]}</a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </c:forEach>
                </ol>
            </div>
        </div>
        <div class="px-2">|</div>
        <!-- Right side -->
        <ul class="navbar-nav flex-row align-items-center">
            <!-- User -->
            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                <a class="d-flex nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    <div id="admin-info">
                        <span>Admin: Bùi Quang Tấn Kiệt</span>
                    </div>
                    <i class="bx bx-chevron-down fs-4 lh-0"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <a class="dropdown-item" href="#">
                            <div class="d-flex">
                                <div class="flex-grow-1">
                                    <span class="fw-semibold d-block">Bùi Quang Tấn Kiệt</span>
                                    <small class="text-muted">Admin</small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${accountUrl}">
                            <i class="bx bx-user me-2"></i>
                            <span class="align-middle">Hồ sơ</span>
                        </a>
                    </li>

                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${loginUrl}">
                            <i class="bx bx-power-off me-2"></i>
                            <span class="align-middle">Đăng xuất</span>
                        </a>
                    </li>
                </ul>
            </li>
            <!--/ User -->
        </ul>
    </div>
</nav>
