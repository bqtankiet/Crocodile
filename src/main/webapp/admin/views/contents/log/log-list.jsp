<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%--<link rel="stylesheet" href="<c:url value="/admin/assets/css/my-table.css"/>">--%>

<style>
    /* Giới hạn kích thước bảng */
    #log-table {
        width: 100%;
        table-layout: auto; /* Cho phép bảng tự điều chỉnh theo nội dung */
    }

    /* Đảm bảo bảng không bị co lại */
    .dataTables_wrapper {
        overflow-x: auto;
        white-space: nowrap;
    }

    /* Đảm bảo tiêu đề cột không bị vỡ dòng */
    #log-table th, #log-table td {
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }
</style>

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
                    <%----------------------------------------------------%>
                    <table class="my-table stripe" id="log-table" style="width: 100%">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col"><input type="checkbox" id="selectAll" class="form-check-input"
                                                   aria-label=""></th>
                            <th scope="col">Level</th>
                            <th scope="col">Timestamp</th>
                            <th scope="col">Category</th>
                            <th scope="col">Message</th>
                            <th scope="col">User ID</th>
                            <th scope="col">Username</th>
                            <th scope="col">IP</th>
                            <th scope="col" class="action-column"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.listLog}" var="log">
                            <tr>
                                <c:set var="rowClass" value=""/>
                                <c:choose>
                                    <c:when test="${log.level == 'ERROR'}">
                                        <c:set var="rowClass" value="bg-danger"/>
                                    </c:when>
                                    <c:when test="${log.level == 'WARN'}">
                                        <c:set var="rowClass" value="bg-warning"/>
                                    </c:when>
                                    <c:when test="${log.level == 'INFO'}">
                                        <c:set var="rowClass" value="bg-info"/>
                                    </c:when>
                                    <c:when test="${log.level == 'TRACE'}">
                                        <c:set var="rowClass" value="bg-danger"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="rowClass" value="bg-secondary"/>
                                    </c:otherwise>
                                </c:choose>
                                <td><input type="checkbox" class="rowCheckbox form-check-input" aria-label=""></td>
                                <th scope="row"><span class="badge ${rowClass} text-white small">${log.level}</span></th>
                                <td><fmt:formatDate value="${log.timestampDate}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                <td>${log.category}</td>
                                <td>${log.message}</td>
                                <td>${log.userId}</td>
                                <td>${log.username}</td>
                                <td>${log.ip}</td>
                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="${""}">
                                                <i class="bx bx-edit-alt me-1"></i>Chi tiet
                                            </a>
                                            <button class="dropdown-item btn-delete" data-id="${log.eventId}">
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
    // Chọn tất cả checkbox khi click vào checkbox ở header
    document.getElementById('selectAll').addEventListener('change', function () {
        let checkboxes = document.getElementsByClassName('rowCheckbox');
        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });
</script>

<!-- Kích hoạt Data table -->
<script>
    const tb = $('#log-table').DataTable({
        pageLength: 50,
        scrollX: true,
        autoWidth: false,
        columnDefs: [
            {width: "50px", targets: 0},
            {width: "150px", targets: -1},
            {orderable: false, targets: [0, -1]} // Không sắp xếp cột checkbox và action
        ],
        order: [],
        language: {
            search: "Tìm kiếm:",
            lengthMenu: "Hiển thị _MENU_ mục",
            info: "Hiển thị _START_ đến _END_ trong tổng số _TOTAL_ mục",
            paginate: {
                first: "Đầu",
                last: "Cuối",
                next: "Sau",
                previous: "Trước"
            }
        },
        buttons: [
            {
                extend: 'copy',
                exportOptions: {columns: ':not(.action-column)'}
            },
            {
                extend: 'excel',
                exportOptions: {columns: ':not(.action-column)'}
            },
            {
                extend: 'pdf',
                exportOptions: {columns: ':not(.action-column)'}
            },
            {
                extend: 'print',
                exportOptions: {columns: ':not(.action-column)'}
            }
        ]
    });
</script>
