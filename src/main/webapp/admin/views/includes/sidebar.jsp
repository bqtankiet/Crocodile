<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="dashboardUrl" value="<%= UrlProperties.dashboard() %>"/>
<c:url var="accountUrl" value="<%= UrlProperties.account() %>"/>
<c:url var="categoryUrl" value="<%= UrlProperties.category() %>"/>
<c:url var="productUrl" value="<%= UrlProperties.product() %>"/>
<c:url var="orderUrl" value="<%= UrlProperties.order() %>"/>
<c:url var="userUrl" value="<%= UrlProperties.user() %>"/>
<c:url var="contactUrl" value="<%= UrlProperties.contact()%>" />

<style>
    #layout-menu.bg-menu-theme {
        background-color: #007B5FFF !important;
        color: white !important;

        .menu-link, .menu-horizontal-prev, .menu-horizontal-next {
            color: white;
        }
        .menu-inner > .menu-item.active > .menu-link {
            color: white;
            background-color: #1a8468 !important;
        }
        .menu-inner > .menu-item.active:before {
            background: white;
        }
        .menu-inner > .menu-item.open .menu-item.open > .menu-toggle::before, .menu-inner > .menu-item.open .menu-item.active > .menu-link::before{
            box-shadow: none;
        }
        .menu-item.active > .menu-link:not(.menu-toggle) {
            background-color: #1a8468;
        }
        .menu-sub > .menu-item.active > .menu-link:not(.menu-toggle):before {
            background-color: #1a8468 !important;
        }
        a.menu-link.menu-toggle:hover {
            background-color: #1a8468;
        }
        /*.menu-link.override:hover {*/
        /*    opacity: 0.8;*/
        /*    cursor: pointer;*/
        /*}*/
    }
</style>

<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <%--  Logo Crocodile  --%>
    <div class="app-brand demo override">
        <a class="h1 text-decoration-none col-3 order-lg-0" href="${accountUrl} ">
            <img src="https://www.crocodileinternational.com/themes/crocs_child/assets/img/crocodile-logo-mobile.svg" alt="Logo" style="width: 12rem">
        </a>
    </div>


    <ul class="menu-inner py-1">
        <!-- Account setting -->
        <li class="menu-item ${param.activePage == 'dashboard' ? 'active' : ''}">
            <a href="${dashboardUrl}" class="menu-link override">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div>Dashboard</div>
            </a>
        </li>

        <!-- Account setting -->
        <li class="menu-item ${param.activePage == 'account' ? 'active' : ''}">
            <a href="${accountUrl}" class="menu-link override">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div>Thông tin tài khoản</div>
            </a>
        </li>

        <!-- Category manager -->
        <li class="menu-item
            ${param.activePage == 'category' || param.activePage == 'product' ? 'active open' : ''}">
            <a href="javascript:void(0);" class="menu-link override menu-toggle menu-drop">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div>Quản lý danh mục</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item ${param.activePage == 'category' ? 'active' : ''}">
                    <a href="${categoryUrl}" class="menu-link override">
                        <div>Loại danh mục</div>
                    </a>
                </li>
                <li class="menu-item ${param.activePage == 'product' ? 'active' : ''}">
                    <a href="${productUrl}" class="menu-link override">
                        <div>Sản phẩm</div>
                    </a>
                </li>

            </ul>
        </li>

        <!-- Extended components -->
        <li class="menu-item
            ${param.activePage == 'contact' || param.activePage == 'about' ? 'active open' : ''}">
            <a href="javascript:void(0)" class="menu-link override menu-toggle menu-drop">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div>Quản lý giao diện</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item ${param.activePage == 'contact' ? 'active' : ''}">
                    <a href="${contactUrl}" class="menu-link override">
                        <div>Liên hệ</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="#" class="menu-link override">
                        <div>Giới thiệu</div>
                    </a>
                </li>


            </ul>
        </li>


        <!-- Information Manager -->
        <li class="menu-item
        ${param.activePage == 'order' ? 'active open' : ''}">
            <a href="javascript:void(0);" class="menu-link override menu-toggle">
                <i class="menu-icon tf-icons bx bx-box"></i>
                <div >Quản lý thông tin</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item ${param.activePage == 'order' ? 'active' : ''}">
                    <a href="${orderUrl}" class="menu-link override">
                        <div >Danh sách đơn hàng</div>
                    </a>
                </li>

            </ul>
        </li>

        <!-- Account setting -->
        <li class="menu-item ${param.activePage == 'user' ? 'active' : ''}">
            <a href="${userUrl}" class="menu-link override">
                <i class="menu-icon tf-icons bx bx-crown"></i>
                <div >Quản lý người dùng</div>
            </a>
        </li>

        <!-- Logs -->
        <c:url var="logUrl" value="<%= UrlProperties.log() %>"/>
        <li class="menu-item ${param.activePage == 'log' ? 'active' : ''}">
            <a href="${logUrl}" class="menu-link override">
                <i class="menu-icon tf-icons bx bx-crown"></i>
                <div>Lịch sử ghi log</div>
            </a>
        </li>

    </ul>
</aside>

