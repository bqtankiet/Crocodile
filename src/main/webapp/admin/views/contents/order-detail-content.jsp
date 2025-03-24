<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="vi_VN"/>
<c:url var="url_product" value="<%=UrlProperties.product()%>"/>

<style>
    table {
        border-collapse: collapse;
        td, th {
            border-bottom: 1px solid #DDD;
        }
    }
    .timeline {
        border-left: 1px solid hsl(0, 0%, 90%);
        position: relative;
        list-style: none;
    }

    .timeline .timeline-item {
        position: relative;
    }

    .timeline .timeline-item:after {
        position: absolute;
        display: block;
        top: 0;
    }

    .timeline .timeline-item:after {
        background-color: hsl(0, 0%, 90%);
        left: -38px;
        top: 2px;
        border-radius: 50%;
        height: 11px;
        width: 11px;
        content: "";
    }
</style>

<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y pb-5">
<%--        <h4 class="fw-bold py-3 mb-4">Chi tiết đơn hàng</h4>--%>

        <!-- --------------------------------Bảng thêm sản phẩm------------------------------- -->
        <form method="post" id="form-order">
            <div class="row">
                <%-- LEFT --%>
                <div class="col">
                    <%--  Thông tin đơn hàng --%>
                    <div class="ps-3 card h-100">
                        <div class="px-0 card-body needs-validation mx-4">
                            <%-- Thông tin chung --%>
                            <div class="row px-0">
                                <h5 class="px-0"><strong>Thông tin chung</strong></h5>
                                <div class="col">
                                    <div class="row mb-2">
                                        <label class="col-5 col-form-label px-0">Mã đơn hàng</label>
                                        <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                                               value="123adf141">
                                    </div>
                                    <div class="row mb-2">
                                        <label class="col-5 col-form-label px-0">Ngày đặt hàng</label>
                                        <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                                               value="10/10/2025 12:20:30">
                                    </div>
                                    <div class="row mb-2">
                                        <label class="col-5 col-form-label px-0">HT Thanh toán</label>
                                        <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                                               value="COD">
                                    </div>
                                    <div class="row mb-2">
                                        <label class="col-5 col-form-label px-0">Giá trị đơn hàng</label>
                                        <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                                               value="1700000">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="row mb-2">
                                        <label class="col-5 col-form-label px-0">Mã khách hàng</label>
                                        <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                                               value="11223344">
                                    </div>
                                    <div class="row mb-2">
                                        <label class="col-5 col-form-label px-0">Tên khách hàng</label>
                                        <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                                               value="Bùi Quang Tấn Kiệt">
                                    </div>
                                    <div class="row mb-2">
                                        <label class="col-5 col-form-label px-0">Số điện thoại</label>
                                        <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                                               value="0113 113 113">
                                    </div>
                                    <div class="row mb-2">
                                        <label class="col-5 col-form-label px-0">Email</label>
                                        <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                                               value="example@gmail.com">
                                    </div>
                                </div>
                            </div>
                            <%-- Thông tin giao hàng --%>
                            <div class="row px-0">
                                <h5 class="px-0 mt-3"><strong>Thông tin giao hàng</strong></h5>
                                <div class="col">
                                    <div class="row mb-2 me-3 align-items-center">
                                        <label class="col-5 col-form-label px-0">Tên người nhận</label>
                                        <input class="col border-0 border border-bottom text-secondary bg-transparent"
                                               type="text" disabled
                                               value="Tấn Kiệt">
                                        <i class='col-1 bx bxs-edit-alt'></i>
                                    </div>
                                    <div class="row mb-2 me-3 align-items-center">
                                        <label class="col-5 col-form-label px-0">Số điện thoại</label>
                                        <input class="col border-0 border border-bottom text-secondary bg-transparent"
                                               type="text" disabled
                                               value="0113 113 113">
                                        <i class='col-1 bx bxs-edit-alt'></i>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="row mb-2 me-3 align-items-center">
                                        <label class="col-5 col-form-label px-0">Đơn vị vận chuyển</label>
                                        <input class="col border-0 border border-bottom text-secondary bg-transparent"
                                               type="text" disabled
                                               value="Viettel Post">
                                        <i class='col-1 bx bxs-edit-alt'></i>
                                    </div>
                                    <div class="row mb-2 me-3 align-items-center">
                                        <label class="col-5 col-form-label px-0">Mã vận đơn</label>
                                        <input class="col border-0 border border-bottom text-secondary bg-transparent"
                                               type="text" disabled
                                               value="123456">
                                        <i class='col-1 bx bxs-edit-alt'></i>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label class="col-form-label px-0">Địa chỉ giao hàng</label>
                                    <textarea class="form-control text-secondary bg-transparent" rows="2">Khoa CNTT, Trường ĐH.Nông Lâm, Phường Linh Trung, TP.Thủ Đức, Hồ Chí Minh</textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <%-- RIGHT --%>
                <div class="col-3 ps-0">
                    <div class="card h-100">
                        <h5 class="card-header"><strong>Trạng thái đơn hàng</strong></h5>
                        <div class="card-body">
                        <h3 class="badge bg-success">Giao hàng thành công</h3>
                            <!-- Section: Timeline -->
                            <section class="py-2">
                                <ul class="timeline">
                                    <c:forEach var="trackingUnit" items="${requestScope.tracking}">
                                        <li class="timeline-item">
                                            <h6 class="fw-bold mb-1">${trackingUnit.statusDescript}</h6>
                                            <p class="text-muted mb-1"><fmt:formatDate value="${trackingUnit.updateAtDate}" pattern="dd/MM/yyyy HH:mm:ss"/></p>
                                            <p class="text-muted">${trackingUnit.note}</p>
                                        </li>
                                    </c:forEach>
<%--                                    <li class="timeline-item">--%>
<%--                                        <h6 class="fw-bold mb-1">Đã giao hàng</h6>--%>
<%--                                        <p class="text-muted mb-1">11/10/2024 10:20:30</p>--%>
<%--                                        <p class="text-muted">--%>
<%--                                            Đơn hàng đã được giao thành công--%>
<%--                                        </p>--%>
<%--                                    </li>--%>
<%--                                    <li class="timeline-item">--%>
<%--                                        <h6 class="fw-bold mb-1">Đang giao hàng</h6>--%>
<%--                                        <p class="text-muted mb-1">9/10/2024 10:20:30</p>--%>
<%--                                        <p class="text-muted">--%>
<%--                                            Đơn hàng đang trên đường giao cho khách hàng.--%>
<%--                                        </p>--%>
<%--                                    </li>--%>
<%--                                    <li class="timeline-item">--%>
<%--                                        <h6 class="fw-bold mb-1">Đã lấy hàng</h6>--%>
<%--                                        <p class="text-muted mb-1">9/10/2024 9:20:30</p>--%>
<%--                                        <p class="text-muted">--%>
<%--                                            Đã lấy hàng tại Cửa hàng Crocodile chi nhánh NLU--%>
<%--                                        </p>--%>
<%--                                    </li>--%>
<%--                                    <li class="timeline-item">--%>
<%--                                        <h6 class="fw-bold mb-1">Đơn hàng đang chuẩn bị</h6>--%>
<%--                                        <p class="text-muted mb-1">9/10/2024 9:20:30</p>--%>
<%--                                        <p class="text-muted">--%>
<%--                                            Đơn hàng đang được đóng gói--%>
<%--                                        </p>--%>
<%--                                    </li>--%>
<%--                                    <li class="timeline-item">--%>
<%--                                        <h6 class="fw-bold mb-1">Đang chờ xử lý</h6>--%>
<%--                                        <p class="text-muted mb-1">9/10/2024 9:20:30</p>--%>
<%--                                        <p class="text-muted">--%>
<%--                                            Đơn hàng đang chờ xử lý--%>
<%--                                        </p>--%>
<%--                                    </li>--%>
                                </ul>
                            </section>
                            <!-- Section: Timeline -->
                        </div>
                    </div>
                </div>
            </div>
            <%--  Danh sách sản phẩm --%>
            <div class="card mt-3">
                <h5 class="card-header"><strong>Danh sách sản phẩm</strong></h5>
                <div class="card-body" id="???">
                    <div class="table-responsive">
                        <table class="text-start table-hover w-100">
                            <thead>
                            <tr>
                                <th scope="col" class="col-2 py-2">Mã sản phẩm</th>
                                <th scope="col" class="col">Tên sản phẩm</th>
                                <th scope="col" class="col-2">Đơn giá</th>
                                <th scope="col" class="col-2">Số lượng</th>
                                <th scope="col" class="col-2">Thành tiền</th>
                                <th scope="col" class="col-1">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="">
                                <%--Mã sản phẩm--%>
                                <td class="align-middle text-start">12345</td>
                                <%--Tên Sản phẩm--%>
                                <td class="align-middle text-start py-3">
                                    <div class="">
                                        <p class="mb-2 line-clamp-2" style="height: fit-content">Sản phẩm ABC</p>
                                        <c:if test="${'productVariant.pOption1' != null}">
                                            <p class="fw-normal m-0 text-muted">Màu sắc: Đỏ
                                                <c:if test="${'productVariant.pOption2' != null}">
                                                    , Kích thước: 43
                                                </c:if>
                                            </p>
                                        </c:if>
                                    </div>
                                </td>
                                <%--Đơn giá--%>
                                <td class="align-middle">
                                    <p class="mb-0 product-price">
                                        <fmt:formatNumber value="123456" type="currency" currencySymbol="₫"
                                                          groupingUsed="true"/>
                                    </p>
                                </td>
                                <%--Số lượng--%>
                                <td class="align-middle">1</td>
                                <%--Thành tiền--%>
                                <td class="align-middle">
                                    <p class="mb-0 product-total-price">
                                        <fmt:formatNumber value="123456" type="currency" currencySymbol="₫"
                                                          groupingUsed="true"/>
                                    </p>
                                </td>
                                <%--Thao tác--%>
                                <td class="align-middle">
                                    <button class="removeBtn btn btn-outline-danger px-2 custom-icon mx-auto"
                                            data-id="?" data-action="remove">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                            <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"></path>
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="btn-box d-flex justify-content-center gap-3 my-5">
                <!-- nút lưu-->
                <button class="btn btn-success" type="submit">Lưu</button>
                <!-- nút thoát -->
                <a href="${url_product}" class="btn btn-danger">Thoát</a>
            </div>
        </form>
        <!-- ---------------------end bảng thêm sản phẩm---------------------------- -->
    </div>
    <!-- Content wrapper -->

    <!--  bootstrap  -->
<%--    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>--%>

</div>

