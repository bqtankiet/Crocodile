<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="updateOrder" value="<%=UrlProperties.updateOrder() %>"/>

<link rel="stylesheet" href="<c:url value="/admin/assets/css/my-table.css"/> ">

<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">

<%--        <h4 class="fw-bold py-3 mb-4">--%>
<%--            <span class="text-muted fw-light">Quản lý thông tin /</span>--%>
<%--            Đơn hàng--%>
<%--        </h4>--%>
        <!-- Bordered Table -->
        <div class="card">
            <!-- ------------------------------Bảng sản phẩm------------------------------ -->
            <div class="card-body">
                <div class="container">
                    <div class="float-end mb-3">
                        <jsp:include page="/admin/views/includes/button-print.jsp"/>
                    </div>
                    <table class="my-3 pt-3 my-table" id="products-table">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col"><input type="checkbox" id="selectAll" class="form-check-input" aria-label=""></th>
                            <th scope="col">Mã đơn</th>
                            <th scope="col">Khách hàng</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Tổng tiền</th>
<%--                            <th scope="col">Phương thức thanh toán</th>--%>
                            <th scope="col">Ngày đặt</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Hàng 1 -->
                        <c:forEach items="${requestScope.orders}" var="o">

                            <tr>
                                <td><input type="checkbox" class="rowCheckbox form-check-input" aria-label=""></td>
                                <th scope="row">${o.id}</th>
                                <td>${o.fullname}</td>
                                <td>${o.phone}</td>
                                <td><fmt:formatNumber value="${o.total}" type="currency" currencyCode="VND" maxFractionDigits="0"/></td>
<%--                                <td>${o.paymentMethod}</td>--%>
                                <td><fmt:formatDate value="${o.invoiceUtilDate}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                <td><span class="badge bg-gray">${o.status.description}</span></td>
                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="<c:url value="/admin/order/update"/> "><i
                                                    class="menu-icon tf-icons bx bx-file"></i> Chi tiết</a>
                                            <c:if test="${o.status.description == 'Chờ phê duyệt'}">
                                                <button class="dropdown-item btn-processing"
                                                        data-id="${o.id}" data-action="processing">
                                                    <i class="bx bx-check btn-save fs-3 cursor-pointer"></i>
                                                    Phê duyệt
                                                </button>
                                            </c:if>
                                            <c:if test="${
                                                o.status.description != 'Hủy bỏ' &&
                                                o.status.description != 'Hoàn thành'
                                                }">
                                                <button class="dropdown-item btn-cancelled"
                                                        data-id="${o.id}" data-action="cancelled" >
                                                    <i class="bx bx-x btn-cancel fs-3 cursor-pointer"></i>
                                                    Hủy bỏ
                                                </button>
                                            </c:if>
                                            <a class="dropdown-item text-danger" href="javascript:void(0);"><i
                                                    class="menu-icon tf-icons bx bx-trash"></i> Xóa</a>
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

<%-- Xử lý sự kiện của các action --%>
<script>
    // Action Processing
    $(document).on('click', '.btn-processing', function (event) {
        event.preventDefault();
        const orderId = $(this).data('id');
        const action =  $(this).data('action');
        $.ajax({
            url: "${updateOrder}",
            type: "POST",
            data: {
                id: orderId,
                action: action
            },
            success: function (response) {
                window.location.reload();
            },
            error: function (xhr, status, error) {
                if (xhr.status === 404) {
                    alert("Không tìm thấy endpoint " + "${updateOrder}");
                } else {
                }
                console.error("Error:", error);
            }
        });
    });
    // Action Cancel
    $(document).on('click', '.btn-cancelled', function (event) {
        event.preventDefault();
        const orderId = $(this).data('id');
        const action =  $(this).data('action');
        $.ajax({
            url: "${updateOrder}",
            type: "POST",
            data: {
                id: orderId,
                action: action
            },
            success: function (response) {
                window.location.reload();
            },
            error: function (xhr, status, error) {
                if (xhr.status === 404) {
                    alert("Không tìm thấy endpoint " + "${updateOrder}");
                } else {
                }
                console.error("Error:", error);
            }
        });
    });
</script>

<%-- Xử lý sự kiện checkbox --%>
<script src="<c:url value="/admin/assets/js/my-table.js"/> "></script>
