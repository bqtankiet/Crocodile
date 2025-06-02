<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>

<div id="ordersList" class="row">
    <c:choose>
        <c:when test="${empty ordersList}">
            <div class="col-12">
                <div class="alert alert-info">Không có đơn hàng nào.</div>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="order" items="${ordersList}">
                <div class="col-12 mb-4">
                    <div class="card card-custom border shadow-sm">
                        <div class="card-body">
                            <!-- Shop Info -->
                            <div class="d-flex align-items-center mb-3">
                                <span class="badge bg-danger text-white me-2">Mall</span>
                                <h6 class="fw-bold mb-0">Crocodile</h6>

                                <span class="ms-auto text-success">
                                    <c:choose>
                                        <c:when test="${order.status == 'PENDING'}">Chờ xử lý</c:when>
                                        <c:when test="${order.status == 'PENDINGPICKUP'}">Chờ lấy hàng</c:when>
                                        <c:when test="${order.status == 'PROCESSING'}">Đang xử lý</c:when>
                                        <c:when test="${order.status == 'COMPLETED'}">Hoàn thành</c:when>
                                        <c:when test="${order.status == 'CANCELLED'}">Đã hủy</c:when>
                                        <c:when test="${order.status == 'AWAITING'}">Đang chờ</c:when>
                                        <c:otherwise>Không xác định</c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <!-- Product Info -->
                            <div class="d-flex align-items-center mb-3">
                                <img src="${order.productImage}" alt="Product Image" style="width: 60px; height: 60px; object-fit: cover; margin-right: 15px;">
                                <div class="flex-grow-1">
                                    <p class="mb-1">${order.productName}</p>
                                    <c:choose>
                                        <c:when test="${not empty order.option1Value}">
                                            <small class="text-muted">Phân loại: ${order.option1Value}
                                                <c:choose>
                                                    <c:when test="${not empty order.option2Value}">
                                                        , ${order.option2Value}
                                                    </c:when>
                                                </c:choose>
                                            </small><br>

                                        </c:when>
                                    </c:choose>
                                    <small class="text-muted">x${order.quantity}</small>

                                </div>
                                <div class="text-end">
                                    <fmt:formatNumber var="fmtProductPrice" value="${order.productPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                    <span class="fw-bold">${fmtProductPrice}</span>
                                </div>
                            </div>
                            <!-- Order Details -->
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <small class="text-muted">Ngày đặt hàng: ${order.invoiceDate}</small>
                                <small class="text-muted">Mã đơn hàng: ${order.id}</small>
                            </div>
                            <!-- Total and Actions -->
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <strong>Thành tiền:</strong>
                                    <fmt:formatNumber var="fmtTotal" value="${order.total}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                    <span class="text-danger fw-bold fs-5">${fmtTotal}</span>
                                </div>
                                <div>
                                    <c:if test="${order.status == 'COMPLETED'}">
                                        <button
                                                class="btn btn-review"
                                                style="background-color: #007b5f !important; color: white"
                                                data-bs-toggle="modal"
                                                data-bs-target="#feedback-form"
                                                data-id-product="${order.idProduct}"
                                                data-id-variant="${order.idVariant}"
                                                data-product-name="${order.productName}"
                                                data-product-image="${order.productImage}"
                                                data-product-option="${order.option1Value} ${order.option2Value}">
                                            Đánh Giá
                                        </button>

                                    </c:if>
                                    <c:if test="${order.status == 'CANCELLED' || order.status == 'COMPLETED'}">
                                        <button class="btn btn-danger" onclick="window.location.href='product-detail?id=${order.idProduct}'">Mua Lại</button>
                                    </c:if>
                                    <c:if test="${order.status == 'AWAITING'}">
                                        <button class="btn btn-outline-secondary ms-2">Xem Chi Tiết Đơn</button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>
