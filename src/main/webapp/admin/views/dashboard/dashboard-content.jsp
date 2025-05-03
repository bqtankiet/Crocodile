<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="vi_VN"/>

<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">
            <div class="col-sm-4">
                <div class="card widget-flat">
                    <div class="card-body">
                        <div class="float-end">
                            <i class="mdi mdi-currency-usd widget-icon"></i>
                        </div>
                        <h5 class="text-muted fw-normal mt-0">Doanh thu
                            <span data-bs-toggle="tooltip" data-bs-title="Tổng doanh thu trong tháng">
                                <i class='bx bx-info-circle'></i>
                            </span>
                        </h5>
                        <div id="revenue-container">
                            Đang tải doanh thu...
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="card widget-flat mb-4">
                    <div class="card-body">
                        <div class="float-end">
                            <i class="mdi mdi-account-multiple widget-icon"></i>
                        </div>
                        <h5 class="text-muted fw-normal mt-0">Khách hàng
                            <span>
                                <i class='bx bx-info-circle' data-bs-toggle="tooltip"
                                   data-bs-title="Số lượng khách hàng hoạt động trong tháng"></i>
                            </span>
                        </h5>
                        <div id="customers-container">
                            Đang tải khách hàng...
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="card widget-flat">
                    <div class="card-body">
                        <div class="float-end">
                            <i class="mdi mdi-cart-plus widget-icon"></i>
                        </div>
                        <h5 class="text-muted fw-normal mt-0">Đơn hàng
                            <span>
                                <i class='bx bx-info-circle' data-bs-toggle="tooltip"
                                   data-bs-title="Số lượng đơn hàng trong tháng"></i>
                            </span>
                        </h5>
                        <div id="orders-container">
                            Đang tải đơn hàng...
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col mb-4">
                <div class="card card-h-100">
                    <div class="d-flex card-header justify-content-between align-items-center">
                        <h4 class="header-title">Doanh thu các tháng trong năm</h4>
                        <div class="dropdown">
                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <i class="mdi mdi-dots-vertical"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a href="javascript:void(0);" class="dropdown-item" id="line-chart-btn">Line chart</a>
                                <a href="javascript:void(0);" class="dropdown-item" id="bar-chart-btn">Bar chart</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body pt-0">
                        <div dir="ltr">
                            <div id="high-performing-product" style="min-height: 256px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-7 col-xl-8 pe-3 mb-3">
                <div class="card h-100 overflow-hidden">
                    <div class="card-body p-0" id="topSaleProductsContainer">
                    </div>
                    <div class="card-footer bg-body-tertiary py-2">
                        <div class="row flex-between-center">
                            <div class="col-auto">
                                <select id="timeFilter" class="form-select form-select-sm">
                                    <option value="1week">Last Week</option>
                                    <option value="1month">Last Month</option>
                                    <option value="1year">Last Year</option>
                                </select>
                            </div>
                            <div class="col-auto"><a class="btn btn-sm btn-falcon-default" href="#!">View All</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-xl-4 mb-3">
                <div class="card h-100">
                    <div class="card-body p-0" id="newProductsContainer">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--Khai báo các url--%>
<script>
    const statValuesUrl = '<c:url value="/admin/dashboard/statValues"/>';
    const chartValuesUrl = '<c:url value="/admin/dashboard/chartValues"/>';
    const topSaleProductsUrl = '<c:url value="/admin/dashboard/top-sale"/>';
    const newProductsUrl = '<c:url value="/admin/dashboard/new-products"/>';
</script>
<!-- Bao gồm các thư viện và script -->
<script src="https://cdn.jsdelivr.net/npm/apexcharts@3.45.2/dist/apexcharts.min.js"></script>
<script type="module" src="<c:url value='/admin/views/dashboard/js/main.js'/>"></script>