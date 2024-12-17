
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="accountUrl" value="${applicationScope.url['admin.account']}"/>
<c:url var="categoryUrl" value="${applicationScope.url['admin.category']}"/>
<c:url var="productUrl" value="${applicationScope.url['admin.product']}"/>
<c:url var="orderListUrl" value="${applicationScope.url['admin.orderlist']}"/>
<c:url var="userManagementUrl" value="${applicationScope.url['admin.usermanagement']}"/>



<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
        <a class="h1 text-decoration-none col-3 order-lg-0"

           href="${accountUrl}">
            <img src="https://www.crocodileinternational.com/img/crocodile-logo-1609222037.jpg" alt="Logo"
                 style="width: 12rem">
        </a>

    </div>

    <ul class="menu-inner py-1">
        <!-- Account setting -->
        <li class="menu-item ${param.activePage == 'account' ? 'active' : ''}">
            <a href="${accountUrl}" class="menu-link">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div>Thông tin tài khoản</div>
            </a>
        </li>

        <!-- Category manager -->
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle" onclick="activateMenuItem(event)">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div>Quản lý danh mục</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item ${param.activePage == 'category' ? 'active' : ''}">
                    <a href="${categoryUrl}" class="menu-link">
                        <div>Loại danh mục</div>
                    </a>
                </li>
                <li class="menu-item ${param.activePage == 'product' ? 'active' : ''}">
                    <a href="${productUrl}" class="menu-link">
                        <div>Sản phẩm</div>
                    </a>
                </li>

            </ul>
        </li>

        <!-- Extended components -->
        <li class="menu-item">
            <a href="javascript:void(0)" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Extended UI">Quản lý giao diện</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item">
                    <a href="#" class="menu-link">
                        <div data-i18n="Text Divider">Hình ảnh</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="#" class="menu-link">
                        <div data-i18n="Text Divider">Hỗ trợ trực tuyến</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="#" class="menu-link">
                        <div data-i18n="Text Divider">Thông tin</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="#" class="menu-link">
                        <div data-i18n="Text Divider">Nội dung khác</div>
                    </a>
                </li>
            </ul>
        </li>


        <!-- Information Manager -->
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle" onclick="activateMenuItem(event)">
                <i class="menu-icon tf-icons bx bx-box"></i>
                <div >Quản lý thông tin</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item ${param.activePage == 'orderlist' ? 'active' : ''}">
                    <a href="${orderListUrl}" class="menu-link">
                        <div data-i18n="Basic Inputs">Danh sách đơn hàng</div>
                    </a>
                </li>

            </ul>
        </li>

        <!-- Account setting -->
        <li class="menu-item">
            <a href="${userManagementUrl}" class="menu-link">
                <i class="menu-icon tf-icons bx bx-crown"></i>
                <div data-i18n="Form Layouts">Quản lý người dùng</div>
            </a>
        </li>

    </ul>
</aside>

<script src="<c:url value="/public/jquery-3.7.1.min.js"/>"></script>

<script>
    function activateMenuItem(event) {
        // Lấy phần tử <li> của mục "Quản lý danh mục"
        var parentMenuItem = $(event.target).closest('li.menu-item');

        // Thêm class active và open vào <li> của "Quản lý danh mục"
        parentMenuItem.addClass('active open');

        // Optional: Tắt các menu khác nếu bạn muốn chỉ mở 1 mục tại một thời điểm
        $('li.menu-item').not(parentMenuItem).removeClass('active open');
    }
</script>
