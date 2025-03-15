<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url var="url_productCreate" value="<%=UrlProperties.productCreate()%>"/>

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
                    <h2>
                        Danh sách sản phẩm
                        <%--  --------------------- Nút in -------------------------- --%>
                        <jsp:include page="/admin/views/includes/button-print.jsp"/>
                        <%--  --------------------- end Nút in -------------------------- --%>

                        <a href="${url_productCreate}"
                           class="btn btn-secondary float-end text-white">Thêm</a>
                    </h2>

                    <table class="table table-striped table-hover my-3 pt-3" id="products-table">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col" class="align-middle">#</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Loại danh mục</th>
                            <th scope="col">Hình ảnh</th>
                            <th scope="col">Giá tiền</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Tác vụ</th>
                        </tr>
                        </thead>
                        <tbody>

                        <!-- Product -->
                        <c:forEach items="${products}" var="p">
                            <tr>
                                <th scope="row">
                                    <strong>${p.id}</strong>
                                </th>
                                <td>
                                    <strong class="product-name">${p.name}</strong>
                                </td>
                                <td>
                                    <strong class="category-name">${p.category.name}</strong>

                                </td>
                                <td>
                                    <img style="max-height: 80px;" class="img-fluid"
                                         src="<c:url value="${p.image}" />" alt="">
                                </td>
                                <td>
                                    <strong class="product-price">
                                        <fmt:formatNumber value="${p.price}" type="number" pattern="#,##0" /> <sup>₫</sup>
                                    </strong>
                                </td>
                                <td>
                                    <strong >${p.active == true ? 'Hiển thị' : 'Ẩn'}</strong>
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
