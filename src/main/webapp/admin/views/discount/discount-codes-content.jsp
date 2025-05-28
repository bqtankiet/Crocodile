<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="util" uri="http://example.com/jstl/utils" %>

<style>
    /* Giới hạn kích thước bảng */
    #my-table {
        width: 100%;
        table-layout: auto; /* Cho phép bảng tự điều chỉnh theo nội dung */
    }

    /* Đảm bảo bảng không bị co lại */
    .dataTables_wrapper {
        overflow-x: auto;
        white-space: nowrap;
    }

    /* Đảm bảo tiêu đề cột không bị vỡ dòng */
    #my-table th, #my-table td {
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }
</style>

<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">

        <div class="card">
            <div class="card-body">
                <div class="container">

                    <div class="float-end mb-3">

                        <button class="btn btn-primary me-2" id="btnNewDiscount" data-bs-toggle="modal"
                                data-bs-target="#discountModal">
                            Thêm mã mới
                        </button>

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
                    <table class="my-table stripe" id="my-table" style="width: 100%">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col"><input type="checkbox" id="selectAll" class="form-check-input"
                                                   aria-label=""></th>
                            <th>Mã</th>
                            <th>Loại</th>
                            <th>Giá trị</th>
                            <th>Giảm tối đa</th>
                            <th>Ngày bắt đầu</th>
                            <th>Ngày hết hạn</th>
                            <th>Số lượng</th>
                            <th>Đơn tối thiểu</th>
                            <th>Trạng thái</th>
                            <th scope="col" class="action-column">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="discountCode" items="${requestScope.discountList}">
                            <tr>
                                <td><input type="checkbox" class="rowCheckbox form-check-input" data-id="${log.eventId}"
                                           aria-label=""></td>
                                <td>${discountCode.code}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${discountCode.type == 'PERCENTAGE'}">Phần trăm</c:when>
                                        <c:otherwise>Số tiền</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${discountCode.type == 'PERCENTAGE'}">${discountCode.value}%</c:when>
                                        <c:otherwise><fmt:formatNumber value="${discountCode.value}" type="currency"
                                                                       currencyCode="VND"/></c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${discountCode.maxDiscount != null}">
                                            <fmt:formatNumber value="${discountCode.maxDiscount}" type="currency"
                                                              currencyCode="VND"/>
                                        </c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${util:formatLocalDateTime(discountCode.startDate, "dd/MM/yyyy HH:mm")}</td>
                                <td>${util:formatLocalDateTime(discountCode.endDate, "dd/MM/yyyy HH:mm")}</td>
                                <td>${discountCode.maxUses}</td>
                                <td><fmt:formatNumber value="${discountCode.minOrderValue}" type="currency"
                                                      currencyCode="VND"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${discountCode.status == 'ACTIVE'}">
                                            <span class="badge bg-success">Active</span>
                                        </c:when>
                                        <c:when test="${discountCode.status == 'EXPIRED'}">
                                            <span class="badge bg-warning">Hết hạn</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger">Đã dùng hết</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td style="overflow: unset">
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-secondary p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <!-- Button trigger modal -->
                                            <a data-url="${pageContext.request.contextPath}/admin/discount-codes?action=edit&code=${discountCode.code}"
                                               class="btnEditDiscount dropdown-item btn btn-sm btn-warning">Sửa</a>
                                            <a href="${pageContext.request.contextPath}/admin/discount-codes?action=delete&code=${discountCode.code}"
                                               class="dropdown-item btn btn-sm btn-danger"
                                               onclick="return confirm('Bạn có chắc muốn xóa mã này?')">Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty requestScope.discountList}">
                            <tr>
                                <td colspan="10" class="text-center">Không có mã giảm giá nào.</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>

            </div>
            <!--/ Bordered Table -->
        </div>
    </div>

    <div class="modal fade " id="discountModal" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="min-width: 50em" id="discountDialog"></div>
<%--        <script>--%>
<%--            document.getElementById('discountDialog').addEventListener('click', function (e) {--%>
<%--                if (e.target && e.target.id === 'submitForm') {--%>
<%--                    console.log("Submit button clicked via delegation");--%>

<%--                    const formData = new FormData(form);--%>
<%--                    fetch('${pageContext.request.contextPath}/admin/discount-codes', {--%>
<%--                        method: 'POST',--%>
<%--                        body: formData--%>
<%--                    })--%>
<%--                        .then(response => response.json())--%>
<%--                        .then(data => {--%>
<%--                            if (data.success) {--%>
<%--                                messagesDiv.innerHTML = `--%>
<%--                <div class="alert alert-success alert-dismissible fade show" role="alert">--%>
<%--                    Tạo mã giảm giá thành công!--%>
<%--                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>--%>
<%--                </div>`;--%>
<%--                                form.reset();--%>
<%--                                updateForm();--%>
<%--                                document.getElementById('startDate').value = new Date().toISOString().slice(0, 16);--%>
<%--                            } else {--%>
<%--                                messagesDiv.innerHTML = `--%>
<%--                <div class="alert alert-danger alert-dismissible fade show" role="alert">--%>
<%--                    ${data.error || 'Lỗi khi tạo mã giảm giá.'}--%>
<%--                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>--%>
<%--                </div>`;--%>
<%--                            }--%>
<%--                        })--%>
<%--                        .catch(error => {--%>
<%--                            messagesDiv.innerHTML = `--%>
<%--            <div class="alert alert-danger alert-dismissible fade show" role="alert">--%>
<%--                Lỗi hệ thống: ${error.message}--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>--%>
<%--            </div>`;--%>
<%--                        });--%>
<%--                }--%>
<%--            });--%>
<%--        </script>--%>
    </div>

<%--    <script>--%>
<%--        <c:url var="discountCodeUrl" value="<%= UrlProperties.discountCode() %>"/>--%>
<%--        document.querySelector("#btnNewDiscount").addEventListener("click", function () {--%>
<%--            if (document.querySelector("#discountDialog").innerHTML !== "") return;--%>
<%--            fetch("${discountCodeUrl}?action=add")--%>
<%--                .then(function (response) {--%>
<%--                    if (!response.ok) throw new Error("Lỗi khi tải nội dung modal");--%>
<%--                    return response.text();--%>
<%--                })--%>
<%--                .then(function (html) {--%>
<%--                    document.querySelector("#discountDialog").innerHTML = html;--%>
<%--                })--%>
<%--                .catch(function (err) {--%>
<%--                    console.error("Lỗi:", err);--%>
<%--                });--%>
<%--        });--%>
<%--    </script>--%>

    <c:url var="discountCodeUrl" value="<%= UrlProperties.discountCode() %>" />
    <script>
        $(document).ready(function () {
            $('#btnNewDiscount').on('click', function () {
                if ($('#discountDialog').html().trim() !== '') return;

                $.ajax({
                    url: '${discountCodeUrl}?action=add',
                    method: 'GET',
                    success: function (html) {
                        $('#discountDialog').html(html);
                    },
                    error: function (xhr, status, error) {
                        console.error('Lỗi:', error);
                    }
                });
            });
        });
    </script>


<%--    Chọn tất cả checkbox khi click vào checkbox ở header--%>
    <script>
        document.getElementById('selectAll').addEventListener('change', function () {
            let checkboxes = document.getElementsByClassName('rowCheckbox');
            for (let i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = this.checked;
            }
        });
    </script>

    <!-- Kích hoạt Data table -->
    <script>
        const tb = $('#my-table').DataTable({
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

    <script>
        $('.btnEditDiscount').on('click', function() {
           alert("Tính năng đang phát triển");
        });
    </script>

</div>