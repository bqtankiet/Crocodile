<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>

<html>
<head>
    <meta charset="UTF-8">
    <title>Crocodile - Thông tin voucher</title>
    <!--  jquery  -->
    <script src="<c:url value="/public/jquery-3.7.1.min.js"/>"></script>

    <!--  bootstrap  -->
    <link rel="stylesheet" href="<c:url value="/public/bootstrap/css/bootstrap.css"/>">
    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>

    <!--  css  -->
    <link rel="stylesheet" href="<c:url value="/assets/css/home.css"/> ">
    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/> ">

    <!-- link css box icon -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <!-- link font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body  style="background-color: #eeeeee">
<div class="container">
    <c:set var="v" value="${requestScope.voucher}"/>
    <div class="mx-auto my-5 border border-1 bg-white shadow-sm" style="width: 500px;">
        <!--    header    -->
        <div class="mt-5" style="height: 150px">
            <div class="col-12 d-flex justify-content-center">
                <div class="voucher-card d-inline-flex" style="height: 125px; --color:#dc3545">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="-0.5 -0.5 4 16" class="flex-none"
                         style="height: 125px;">
                        <path d="M4 0h-3q-1 0 -1 1a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3v0.333a1.2 1.5 0 0 1 0 3q0 1 1 1h3"
                              stroke-width="1.2" transform="" style="stroke: var(--color); fill: var(--color)"></path>
                    </svg>
                    <div class="bg-danger" style="width: 25px">
                    </div>
                    <div class="bg-white border border-1 d-inline-flex shadow-sm">
                        <div class="d-flex flex-column p-3 justify-content-center ">
                            <h5 class="m-0">Giảm ${v.value}${v.type.name().equals("PERCENTAGE")?"%":"đ"}</h5>
                            <p class="m-0">Có hiệu lực từ: <fmt:formatDate value="${v.startDateFmt}" pattern="dd/MM/yyyy" /></p>
                            <p class="m-0 text-muted">Còn lại: ${v.maxUses} voucher</p>
                        </div>
                        <div class="d-flex position-relative p-3">
                            <button class="btn btn-danger px-4 my-auto">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--    body    -->
        <div>
            <div class="row px-5 lh-sm pb-5">
                <div class="col-12 pt-2">
                    <h6 class="fw-bold">Thời gian sử dụng mã</h6>
                    <p><fmt:formatDate value="${v.startDateFmt}" pattern="dd/MM/yyyy HH:MM" /> - <fmt:formatDate value="${v.endDateFmt}" pattern="dd/MM/yyyy HH:MM" /></p>
                </div>
                <div class="col-12 pt-2">
                    <h6 class="fw-bold">Ưu đãi</h6>
                    <p class="m-0">Lượt sử dụng có hạn. Nhanh tay kẻo lỡ bạn nhé! </p>
                    <c:if test="${v.maxDiscount!=null}">
                        <p class="m-0">Giảm tối đa ${v.maxDiscount}đ.</p>
                    </c:if>
                        <p class="">Đơn tối thiểu ${v.minOrderValue}đ. </p>

<%--                    <p class="m-0">Giảm tối đa: 100000.00d </p>--%>
<%--                    <p class="">Đơn tối thiểu: 500000.00d</p>--%>
                </div>
                <div class="col-12 pt-2">
                    <h6 class="fw-bold">Áp dụng cho sản phẩm</h6>
                    <p>Áp dụng cho tất cả các sản phẩm thuộc tất cả ngành hàng trên website Crocodile</p>
                </div>
                <div class="col-12 pt-2">
                    <h6 class="fw-bold">Thanh toán</h6>
                    <p>Áp dụng đối với tất cả hình thức thanh toán</p>
                </div>
            </div>
            <div class="d-flex justify-content-center">
                <a class="btn btn-danger col-10 mb-5 mx-auto" href="${pageContext.request.contextPath}">Đồng ý</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
