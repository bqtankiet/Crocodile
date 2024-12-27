<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url var="delUserUrl" value="<%= UrlProperties.deleteUser() %>"/>
<c:url var="insUserUrl" value="<%= UrlProperties.insertUser() %>" />
<c:url var="updateUserUrl" value="<%= UrlProperties.updateUser() %>"/>

<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4">Quản lý người dùng</h4>

        <!-- Bordered Table -->
        <div class="card">
            <div class="card-body">
                <div class="container">
                    <h2>Danh sách người dùng</h2>

                    <table class="table table-striped table-hover table-bordered my-3 pt-3" id="users-table">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Tên người dùng</th>
                            <th scope="col">Email</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Giới tính</th>
                            <th scope="col">Ngày sinh</th>
                            <th scope="col">Quyền truy cập</th>
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
                                    <td>${u.active == 1 ? 'Cho phép' : 'Cấm'} </td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                    data-bs-toggle="dropdown">
                                                <i class="bx bx-dots-vertical-rounded"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <button class="dropdown-item btn-ban" data-id="${u.id}" data-action="ban">
                                                    <i class="bx bx-block me-1"></i>
                                                        ${u.active == 1 ? 'Cấm' : 'Bỏ cấm'}
                                                </button>
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
        </div>
    </div>
</div>
<!-- Content wrapper -->

<script>
    $(document).on('click', '.btn-ban', function (event) {
        event.preventDefault();
        const banBtn = $(this);
        const userId = banBtn.data('id');
        const action = banBtn.data('action');
        if(confirm("Bạn có chắc muốn thay đổi quyền truy cập người dùng này?")) {
            $.ajax({
                url: "${updateUserUrl}",
                type: "POST",
                data: {
                    id: userId,
                    action: action
                },
                success: function (response){
                    alert("Thay đổi thành công!")
                },
                error: function(xhr, status, error) {
                    if (xhr.status === 404) {
                        alert("Không tìm thấy endpoint " + "${updateUserUrl}");
                    } else {
                        alert("Đã xảy ra lỗi. Vui lòng thử lại.");
                    }
                    console.error("Error:", error);
                }
            })

        }
    })

</script>
