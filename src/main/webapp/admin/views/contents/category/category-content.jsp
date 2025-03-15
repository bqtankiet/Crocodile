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
                        <jsp:include page="/admin/views/includes/button-print.jsp"/>
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
                            <th scope="col"></th>
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

<script>
    $('table.my-table').DataTable({
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
    $(document).on('click', '.btn-delete', function (event) {
        event.preventDefault();

        const deleteButton = $(this);
        const categoryId = deleteButton.data('id');

        if (confirm("Bạn có chắc chắn muốn xóa danh mục này?")) {
            $.ajax({
                url: "${delCateUrl}",
                type: "POST",
                data: { id: categoryId },
                success: function (response) {
                    alert("Danh mục đã được xóa thành công!");
                    deleteButton.closest("tr").remove();
                },
                error: function (xhr, status, error) {
                    if (xhr.status === 404) {
                        alert("Không tìm thấy endpoint " + "${delCateUrl}");
                    } else {
                        alert("Đã xảy ra lỗi khi xóa danh mục. Vui lòng thử lại.");
                    }
                    console.error("Error:", error);
                }
            });
        }
    });

</script>
<script src="<c:url value="/admin/assets/js/my-table.js"/>"></script>