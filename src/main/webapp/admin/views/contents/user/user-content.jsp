
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url var="delUserUrl" value="${applicationScope.urls['admin.user.delete']}"/>
<c:url var="insUserUrl" value="${applicationScope.urls['admin.user.insert']}" />
<c:url var="updateUserUrl" value="${applicationScope.urls['admin.user.update']}"/>

<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4">Quản lý người dùng</h4>

        <!-- Bordered Table -->
        <div class="card">
            <div class="card-body">
                <div class="container">
                    <h2>Danh sách người dùng</h2>

                    <table class="table table-striped table-hover my-3 pt-3" id="users-table">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Tên người dùng</th>
                            <th scope="col">Email</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Giới tính</th>
                            <th scope="col">Ngày sinh</th>
                            <th scope="col">trạng thái</th>
                            <th scope="col">Tác vụ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Hàng 1 -->
                            <c:forEach items="${users}" var="u">
                                <tr>
                                    <th scope="row">${u.id}</th>
                                    <td>${u.username}</td>
                                    <td>${u.email}</td>
                                    <td>${u.phone_number}</td>
                                    <td>${u.gender}</td>
                                    <td>${u.birthdate}</td>
                                    <td>${u.active == 1 ? 'hoạt động' : 'cấm'} </td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                    data-bs-toggle="dropdown">
                                                <i class="bx bx-dots-vertical-rounded"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#"><i
                                                        class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                                <button class="dropdown-item btn-delete" data-id="${u.id}">
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
            <!--/ Bordered Table -->

            <!--/ Responsive Table -->
        </div>

    </div>


</div>
<!-- Content wrapper -->