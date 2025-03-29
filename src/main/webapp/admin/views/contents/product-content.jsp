<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url var="url_productCreate" value="<%=UrlProperties.productCreate()%>"/>

<link rel="stylesheet" href="<c:url value="/admin/assets/css/my-table.css"/> ">


<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
<%--        <h4 class="fw-bold py-3 mb-4">--%>
<%--            <span class="text-muted fw-light">Quản lý danh mục /</span>--%>
<%--            Sản phẩm--%>
<%--        </h4>--%>

        <!-- Bordered Table -->
        <div class="card">
            <!-- ------------------------------Bảng sản phẩm------------------------------ -->
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
                        <a href="${url_productCreate}"
                           class="btn btn-secondary float-end text-white ms-2">Thêm</a>
                    </div>

                    <table class="my-table my-3 pt-3" id="products-table">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col"><input type="checkbox" id="selectAll" class="form-check-input" aria-label=""></th>
                            <th scope="col">ID</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col" style="min-width: 10ch">Danh mục</th>
<%--                            <th scope="col">Hình ảnh</th>--%>
                            <th scope="col">Đơn giá</th>
                            <th scope="col" style="min-width: 10ch">Trạng thái</th>
                            <th scope="col" class="action-column"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <!-- Product -->
                        <c:forEach items="${requestScope.products}" var="p">
                            <tr>
                                <td><input type="checkbox" class="rowCheckbox form-check-input" aria-label=""></td>
                                <td>
                                    ${p.id}
                                </td>
                                <td>
                                    <div class="d-flex align-items-center gap-3">
                                        <img style="max-height: 50px;" class="img-fluid" src="<c:url value="${p.image}" />" alt="">
                                        ${p.name}
                                    </div>
                                </td>
                                <td>
                                    ${p.category.name}
                                </td>
<%--                                <td>--%>
<%--                                    <img style="max-height: 50px;" class="img-fluid" src="<c:url value="${p.image}" />" alt="">--%>
<%--                                </td>--%>
                                <td>
                                    <fmt:formatNumber value="${p.price}" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                                </td>
                                <td>
                                    <span class="badge bg-gray">${p.active == true ? 'Hiển thị' : 'Ẩn'}</span>
                                </td>
                                <td>
                                    <div class="dropdown option-box">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
<%--                                            <a class="dropdown-item" href="javascript:void(0);"><i--%>
<%--                                                    class="bx bx-trash me-1"></i> Xóa</a>--%>
                                            <button class="dropdown-item btn-delete" data-id="${p.id}">
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
        </div>

    </div>
    <!-- Content wrapper -->
</div>

<c:url var="delProductUrl" value="<%= UrlProperties.deleteProduct()%>"/>
<%--<c:url var="delProductUrl" value="/hello-word"/>--%>

<!-- Kích hoạt Data table  -->
<script src="<c:url value="/admin/assets/js/datatable.js"/> "></script>
<!-- Data table -->

<script>
    $(document).on('click', '.btn-delete', function (event) {
        event.preventDefault();

        const deleteButton = $(this);
        const productId = deleteButton.data('id');

        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
            $.ajax({
                url: "${delProductUrl}",
                type: "POST",
                data: { id: productId },
                success: function (response) {
                    alert("Sản phẩm đã được xóa thành công!");
                    deleteButton.closest("tr").remove();
                },
                error: function (xhr, status, error) {
                    if (xhr.status === 404) {
                        alert("Không tìm thấy endpoint " + "${delProductUrl}");
                    } else {
                        alert("Đã xảy ra lỗi khi xóa. Vui lòng thử lại.");
                    }
                    console.error("Error:", error);
                }
            });
        }
    });

</script>

<script src="<c:url value="/admin/assets/js/my-table.js"/> "></script>

