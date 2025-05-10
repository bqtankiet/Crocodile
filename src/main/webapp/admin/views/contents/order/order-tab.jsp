<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
            <th scope="col" class="action-column"></th>
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
                            <a class="dropdown-item" href="<c:url value="/admin/order/update?id=${o.id}"/> "><i
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

<!-- Kích hoạt Data table  -->
<script src="<c:url value="/admin/assets/js/datatable.js"/> "></script>
<!-- Data table -->