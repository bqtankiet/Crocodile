<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="vi_VN"/>

<link rel="stylesheet" href="<c:url value="/admin/assets/css/my-table.css"/> ">

<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">

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
                                <li><a class="dropdown-item" data-action="copy"><i class="bx bx-copy"></i> Sao chép</a>
                                </li>
                                <li><a class="dropdown-item" data-action="print"><i class='bx bxs-printer'></i> In</a>
                                </li>
                                <li><a class="dropdown-item" data-action="excel"><i class="bx bx-table"></i> Xuất Excel</a>
                                </li>
                                <li><a class="dropdown-item" data-action="pdf"><i class="bx bx-file-blank"></i> Xuất PDF</a>
                                </li>
                            </ul>
                        </div>

                    </div>

                    <table class="my-table mb-3 pt-3"
                           id="categories-table">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col"><input type="checkbox" id="selectAll" class="form-check-input"
                                                   aria-label=""></th>
                            <th scope="col">ID</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Phân loại</th>
                            <th scope="col">Danh mục</th>
                            <th scope="col">Số lượng tồn kho</th>
                            <th scope="col">Đơn giá</th>
                            <th scope="col">Tổng giá trị tồn kho</th>
                            <th scope="col">Nhà cung cấp</th>
                            <th scope="col">Lần cuối nhập</th>
                            <th scope="col" class="action-column"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <!-- Inventory -->
                        <c:forEach items="${requestScope.inventories}" var="iv">
                            <tr>
                                <td><input type="checkbox" class="rowCheckbox form-check-input" aria-label=""></td>
                                <th scope="row">${iv.id}</th>
                                <td>${iv.productName}</td>
                                <td>${iv.sku}</td>
                                <td>${iv.categoryName}</td>
                                <td>${iv.stock}</td>
                                <td>
                                    <fmt:formatNumber value="${iv.price}" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                                </td>
                                <td>
                                    <fmt:formatNumber value="${iv.totalAmount}" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                                </td>
                                <td>${iv.supplierName}</td>
                                <td>${iv.lastImportDate} </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="#"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <button class="dropdown-item btn-delete" data-id="1">
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

<!-- Kích hoạt Data table -->
<script src="<c:url value="/admin/assets/js/datatable.js"/> "></script>
<!-- Data table -->

<script src="<c:url value="/admin/assets/js/my-table.js"/>"></script>