<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url var="delUserUrl" value="<%= UrlProperties.deleteUser() %>"/>
<c:url var="insUserUrl" value="<%= UrlProperties.insertUser() %>" />
<c:url var="updateUserUrl" value="<%= UrlProperties.updateUser() %>"/>
<c:url var="userDetailUrl" value="<%= UrlProperties.userDetail() %>"/>

<link rel="stylesheet" href="<c:url value="/admin/assets/css/my-table.css"/>">
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
                                <li><a class="dropdown-item" data-action="copy"><i class="bx bx-copy"></i> Sao chép</a></li>
                                <li><a class="dropdown-item" data-action="print"><i class='bx bxs-printer'></i> In</a></li>
                                <li><a class="dropdown-item" data-action="excel"><i class="bx bx-table"></i> Xuất Excel</a></li>
                                <li><a class="dropdown-item" data-action="pdf"><i class="bx bx-file-blank"></i> Xuất PDF</a></li>
                            </ul>
                        </div>

                    </div>

                    <table class="my-table my-3 pt-3" id="users-table">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col"><input type="checkbox" id="selectAll" class="form-check-input" aria-label=""></th>
                            <th scope="col">ID</th>
                            <th scope="col">Tên người dùng</th>
                            <th scope="col">Email</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Giới tính</th>
                            <th scope="col">Ngày sinh</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col" class="action-column"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Hàng 1 -->
                            <c:forEach items="${requestScope.listUser}" var="u">
                                <tr>
                                    <td><input type="checkbox" class="rowCheckbox form-check-input" aria-label=""></td>
                                    <th scope="row">${u.id}</th>
                                    <td>${u.username}</td>
                                    <td>${u.email}</td>
                                    <td>${u.phoneNumber}</td>
                                    <td>${u.gender}</td>
                                    <td>${u.birthdate}</td>
                                    <td>${u.active == 1 ? 'Hoạt động' : 'Đình chỉ'} </td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                    data-bs-toggle="dropdown">
                                                <i class="bx bx-dots-vertical-rounded"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="${userDetailUrl}?id=${u.id}"><i
                                                        class="menu-icon tf-icons bx bx-file"></i> Chi tiết</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
            <!--/ Bordered Table -->
        </div>
    </div>
</div>
<!-- Content wrapper -->

<!-- Kích hoạt Data table  -->
<script src="<c:url value="/admin/assets/js/datatable.js"/> "></script>
<!-- Data table -->

<script src="<c:url value="/admin/assets/js/my-table.js"/>"></script>