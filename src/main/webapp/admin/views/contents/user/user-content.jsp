<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url var="delUserUrl" value="<%= UrlProperties.deleteUser() %>"/>
<c:url var="insUserUrl" value="<%= UrlProperties.insertUser() %>" />
<c:url var="updateUserUrl" value="<%= UrlProperties.updateUser() %>"/>

<link rel="stylesheet" href="<c:url value="/admin/assets/css/my-table.css"/>">
<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
<%--        <h4 class="fw-bold py-3 mb-4">Quản lý người dùng</h4>--%>

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
                            <th scope="col">Quyền truy cập</th>
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
                                                <c:url var="updateUserUrl" value="<%=UrlProperties.updateUser()%>">
                                                    <c:param name="id" value="${u.id}"/>
                                                </c:url>
                                                <a class="dropdown-item" href="${updateUserUrl}"><i
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
    var tb = $('table.my-table').DataTable({
        dom: '<"row"<"col-md-6 d-flex align-items-center"l><"col-md-6"f>>' +
            '<"row"<"col-md-12"tr>>' +
            '<"row"<"col-md-5"i><"col-md-7"p>>',
        buttons: [
            {
                extend: 'copy',
                exportOptions: {
                    columns: ':not(.action-column)'  // Loại bỏ cột có class action-column
                }
            },
            {
                extend: 'excel',
                exportOptions: {
                    columns: ':not(.action-column)'
                }
            },
            {
                extend: 'pdf',
                exportOptions: {
                    columns: ':not(.action-column)'
                }
            },
            {
                extend: 'print',
                exportOptions: {
                    columns: ':not(.action-column)'
                }
            }
        ],

        "ordering": true,
        "columnDefs": [
            { "orderable": false, "targets": [0, -1] } // cột checkbox và action
        ],
        "order": [],
        "language": {
            "search": "Tìm kiếm:",
            "lengthMenu": "Hiển thị _MENU_ mục",
            "info": "Hiển thị _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "paginate": {
                "first": "Đầu",
                "last": "Cuối",
                "next": "Sau",
                "previous": "Trước"
            }
        }
    });
</script>

<script>
    $(document).ready(function () {
        $('.dropdown-menu').on('click', '.dropdown-item', function (e) {
            e.preventDefault();

            var action = $(this).data('action');
            if (action) {

                if (action === 'copy') {
                    tb.button(0).trigger();
                } else if (action === 'print') {
                    tb.button(3).trigger();
                } else if (action === 'excel') {
                    tb.button(1).trigger();
                } else if (action === 'pdf') {
                    tb.button(2).trigger();
                }
            }
        });
    });
</script>

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
                    alert("Thay đổi thành công!");
                    location.reload();
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

<script src="<c:url value="/admin/assets/js/my-table.js"/>"></script>