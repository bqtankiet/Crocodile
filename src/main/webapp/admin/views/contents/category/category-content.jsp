<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="delCateUrl" value="<%= UrlProperties.deleteCate() %>"/>
<c:url var="insCateUrl" value="<%= UrlProperties.insertCate() %>" />
<c:url var="updateCateUrl" value="<%= UrlProperties.updateCate() %>"/>

<link rel="stylesheet" href="<c:url value="/admin/assets/css/my-table.css"/> ">

<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
<%--        <h4 class="fw-bold py-3 mb-4">--%>
<%--            <span class="text-muted fw-light">Quản lý danh mục /</span>--%>
<%--            Loại danh mục--%>
<%--        </h4>--%>

        <!-- Bordered Table -->
        <div class="card">
            <div class="card-body">

                <div class="container">

                    <div class="float-end mb-3">
                        <%--Nút xuất dữ liệu--%>
                            <div class="btn-group">
                                <button
                                        type="button"
                                        class="btn btn-outline-primary dropdown-toggle"
                                        data-bs-toggle="dropdown"
                                        aria-expanded="false"
                                >
                                    <i class="bx bx-export"></i> Xuất dữ liệu
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" data-action="copy"><i class="bx bx-copy"></i> Sao chép</a></li>
                                    <li><a class="dropdown-item" data-action="print"><i class='bx bxs-printer'></i> In</a></li>
                                    <li><a class="dropdown-item" data-action="excel"><i class="bx bx-table"></i> Xuất Excel</a></li>
                                    <li><a class="dropdown-item" data-action="pdf"><i class="bx bx-file-blank"></i> Xuất PDF</a></li>
                                </ul>
                            </div>

                        <a href="${insCateUrl}"
                           class="btn btn-secondary float-end text-white ms-2">Thêm
                        </a>
                    </div>

                    <table class="my-table mb-3 pt-3"
                           id="categories-table">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col"><input type="checkbox" id="selectAll" class="form-check-input" aria-label=""></th>
                            <th scope="col">ID</th>
                            <th scope="col">Tên danh mục</th>
                            <th scope="col">Hình ảnh</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col" class="action-column"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <!-- Category -->
                        <c:forEach items="${requestScope.categories}" var="c">
                            <tr>
                                <td><input type="checkbox" class="rowCheckbox form-check-input" aria-label=""></td>
                                <th scope="row">${c.id}</th>
                                <td>${c.name}</td>
                                <td>
                                    <img style="max-height: 40px;" class="img-fluid"  src="<c:url value ="${c.image}" />" alt="">
                                </td>
                                <td>${c.active == 0 ? 'Ẩn' : 'Hiển thị'}</td>
                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="${updateCateUrl}?id=${c.id}"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <button class="dropdown-item btn-delete" data-id="${c.id}">
                                                <i class="bx bx-trash me-1"></i> Xóa
                                            </button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>

            </div>
            <!-- / Bordered Table -->
        </div>

    </div>
    <!-- Content wrapper -->
</div>

<!-- Kích hoạt Data table  -->
<script src="<c:url value="/admin/assets/js/datatable.js"/> "></script>
<!-- Data table -->

<script src="<c:url value="/admin/assets/js/my-table.js"/>"></script>