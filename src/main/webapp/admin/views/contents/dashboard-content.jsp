<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .fs-small {
        font-size: 0.8333333333rem !important;
    }
</style>
<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">
            <div class="col-sm-4">
                <div class="card widget-flat">
                    <div class="card-body">
                        <div class="float-end">
                            <i class="mdi mdi-currency-usd widget-icon"></i>
                        </div>
                        <h5 class="text-muted fw-normal mt-0" title="Average Revenue">Doanh thu
                            <span>
                                <i class='bx bx-info-circle' data-bs-toggle="tooltip" data-bs-title="Tổng doanh thu trong tháng"></i>
                            </span>
                        </h5>
                        <!-- TODO: Lấy dữ liệu doanh số tháng -->
                        <h3 class="mt-3 mb-3">120.123.422 vnd</h3>
                        <p class="mb-0 text-muted">
                            <!-- TODO: Lấy dữ liệu tỉ lệ tăng giảm -->
                            <span class="text-danger me-2"><i class="bx bxs-down-arrow"></i> 7.00%</span>
                            <span class="text-nowrap">So với tháng trước</span>
                        </p>
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div>
            <div class="col-sm-4">
                <div class="card widget-flat mb-4">
                    <div class="card-body">
                        <div class="float-end">
                            <i class="mdi mdi-account-multiple widget-icon"></i>
                        </div>
                        <h5 class="text-muted fw-normal mt-0" title="Number of Customers">Khách hàng
                            <span>
                                <i class='bx bx-info-circle' data-bs-toggle="tooltip" data-bs-title="Số lượng khách hàng hoạt động trong tháng"></i>
                            </span>
                        </h5>
                        <!-- TODO: Lấy số liệu khách hàng hoạt động -->
                        <h3 class="mt-3 mb-3">36,254</h3>
                        <p class="mb-0 text-muted">
                            <!-- TODO: Lấy tỉ lệ tăng giảm -->
                            <span class="text-success me-2"><i class="bx bxs-up-arrow"></i> 5.27%</span>
                            <span class="text-nowrap">So với tháng trước</span>
                        </p>
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div>
            <div class="col-sm-4">
                <div class="card widget-flat">
                    <div class="card-body">
                        <div class="float-end">
                            <i class="mdi mdi-cart-plus widget-icon"></i>
                        </div>
                        <h5 class="text-muted fw-normal mt-0" title="Number of Orders">Đơn hàng
                            <span>
                                <i class='bx bx-info-circle' data-bs-toggle="tooltip" data-bs-title="Số lượng đơn hàng trong tháng"></i>
                            </span>
                        </h5>
                        <!-- TODO: Lấy số liệu đơn hàng -->
                        <h3 class="mt-3 mb-3">5,543</h3>
                        <p class="mb-0 text-muted">
                            <!-- TODO: Lấy tỉ lệ tăng giảm -->
                            <span class="text-danger me-2"><i class="bx bxs-down-arrow"></i> 1.08%</span>
                            <span class="text-nowrap">So với tháng trước</span>
                        </p>
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div>
        </div>
        <div class="row">
            <!-- end col -->
            <div class="col mb-4">
                <div class="card card-h-100">
                    <div class="d-flex card-header justify-content-between align-items-center">
                        <h4 class="header-title">Doanh thu các tháng trong năm</h4>
                        <div class="dropdown">
                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
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

                    </div> <!-- end card-body-->
                </div> <!-- end card-->

            </div> <!-- end col -->
        </div>
        <div class="row">
            <div class="col-lg-7 col-xl-8 pe-3 mb-3">
                <div class="card h-100 overflow-hidden">
                    <div class="card-body p-0">
                        <div class="table-responsive scrollbar">
                            <table class="table table-dashboard mb-0 table-borderless fs-small border-200">
                                <thead class="bg-light">
                                <tr>
                                    <th class="text-900">Sản phẩm mua nhiều</th>
                                    <th class="text-900 text-end">Số đơn hàng</th>
                                    <th class="text-900 pe-x1 text-end" style="width: 8rem">% Đơn hàng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="border-bottom border-200">
                                    <td>
                                        <div class="d-flex align-items-center position-relative"><img class="rounded-1 border border-200" src="assets/img/products/12.png" width="60" alt="">
                                            <div class="flex-1 ms-3">
                                                <h6 class="mb-1 fw-semi-bold"><a class="text-1100 stretched-link" href="#!">Raven Pro</a></h6>
                                                <p class="fw-semi-bold mb-0 text-500">Landing</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle text-end fw-semi-bold">$1311</td>
                                    <td class="align-middle pe-x1">
                                        <div class="d-flex align-items-center">
                                            <div class="progress me-3 rounded-3 bg-200" style="height: 5px; width:80px;" role="progressbar" aria-valuenow="39" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar rounded-pill" style="width: 39%;"></div>
                                            </div>
                                            <div class="fw-semi-bold ms-2">39%</div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="border-bottom border-200">
                                    <td>
                                        <div class="d-flex align-items-center position-relative"><img class="rounded-1 border border-200" src="assets/img/products/10.png" width="60" alt="">
                                            <div class="flex-1 ms-3">
                                                <h6 class="mb-1 fw-semi-bold"><a class="text-1100 stretched-link" href="#!">Boots4</a></h6>
                                                <p class="fw-semi-bold mb-0 text-500">Portfolio</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle text-end fw-semi-bold">$860</td>
                                    <td class="align-middle pe-x1">
                                        <div class="d-flex align-items-center">
                                            <div class="progress me-3 rounded-3 bg-200" style="height: 5px; width:80px;" role="progressbar" aria-valuenow="26" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar rounded-pill" style="width: 26%;"></div>
                                            </div>
                                            <div class="fw-semi-bold ms-2">26%</div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="border-bottom border-200">
                                    <td>
                                        <div class="d-flex align-items-center position-relative"><img class="rounded-1 border border-200" src="assets/img/products/11.png" width="60" alt="">
                                            <div class="flex-1 ms-3">
                                                <h6 class="mb-1 fw-semi-bold"><a class="text-1100 stretched-link" href="#!">Falcon</a></h6>
                                                <p class="fw-semi-bold mb-0 text-500">Admin</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle text-end fw-semi-bold">$539</td>
                                    <td class="align-middle pe-x1">
                                        <div class="d-flex align-items-center">
                                            <div class="progress me-3 rounded-3 bg-200" style="height: 5px; width:80px;" role="progressbar" aria-valuenow="16" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar rounded-pill" style="width: 16%;"></div>
                                            </div>
                                            <div class="fw-semi-bold ms-2">16%</div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="border-bottom border-200">
                                    <td>
                                        <div class="d-flex align-items-center position-relative"><img class="rounded-1 border border-200" src="assets/img/products/14.png" width="60" alt="">
                                            <div class="flex-1 ms-3">
                                                <h6 class="mb-1 fw-semi-bold"><a class="text-1100 stretched-link" href="#!">Slick</a></h6>
                                                <p class="fw-semi-bold mb-0 text-500">Builder</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle text-end fw-semi-bold">$343</td>
                                    <td class="align-middle pe-x1">
                                        <div class="d-flex align-items-center">
                                            <div class="progress me-3 rounded-3 bg-200" style="height: 5px; width:80px;" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar rounded-pill" style="width: 10%;"></div>
                                            </div>
                                            <div class="fw-semi-bold ms-2">10%</div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center position-relative"><img class="rounded-1 border border-200" src="assets/img/products/13.png" width="60" alt="">
                                            <div class="flex-1 ms-3">
                                                <h6 class="mb-1 fw-semi-bold"><a class="text-1100 stretched-link" href="#!">Reign Pro</a></h6>
                                                <p class="fw-semi-bold mb-0 text-500">Agency</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle text-end fw-semi-bold">$280</td>
                                    <td class="align-middle pe-x1">
                                        <div class="d-flex align-items-center">
                                            <div class="progress me-3 rounded-3 bg-200" style="height: 5px; width:80px;" role="progressbar" aria-valuenow="8" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar rounded-pill" style="width: 8%;"></div>
                                            </div>
                                            <div class="fw-semi-bold ms-2">8%</div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer bg-body-tertiary py-2">
                        <div class="row flex-between-center">
                            <div class="col-auto"><select class="form-select form-select-sm">
                                <option>Last 7 days</option>
                                <option>Last Month</option>
                                <option>Last Year</option>
                            </select></div>
                            <div class="col-auto"><a class="btn btn-sm btn-falcon-default" href="#!">View All</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-xl-4 mb-3">
                <div class="card h-100">
                    <div class="table-responsive scrollbar">
                        <table class="table table-dashboard mb-0 table-borderless fs-small border-200">
                            <thead class="bg-light">
                            <tr>
                                <th class="text-900">Sản phẩm mới</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="border-bottom border-200">
                                <td>
                                    <div class="d-flex align-items-center position-relative"><img class="rounded-1 border border-200" src="assets/img/products/12.png" width="60" alt="">
                                        <div class="flex-1 ms-3">
                                            <h6 class="mb-1 fw-semi-bold"><a class="text-1100 stretched-link" href="#!">Raven Pro</a></h6>
                                            <p class="fw-semi-bold mb-0 text-500">Landing</p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/apexcharts@3.45.2/dist/apexcharts.min.js"></script>
<script>
    // TODO: Viết API lấy dữ liệu cho chart
    // Cấu hình biểu đồ ApexCharts
    var options = {
        series: [
            {
                name: 'Actual',
                data: [65000, 59000, 80000, 81000, 56000, 89000, 40000, 32000, 65000, null, null, null] // Dừng tại tháng 9
            }
        ],
        // chart: {
        //     type: 'line',
        //     height: 250,
        //     zoom: { enabled: false }
        // },
        // stroke: {
        //     curve: 'smooth',
        //     width: 3
        // },
        // markers: {
        //     size: 5,
        //     hover: { sizeOffset: 3 }
        // },
        colors: ['#727cf5'],
        dataLabels: {
            enabled: false
        },
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'], // Hiển thị đầy đủ 12 tháng
            labels: {
                style: {
                    fontSize: '12px',
                    fontFamily: 'Helvetica, Arial, sans-serif'
                }
            }
        },
        yaxis: {
            max: 100000,
            labels: {
                formatter: function (val) {
                    return (val / 1000) + 'k';
                },
                style: {
                    fontSize: '11px',
                    fontFamily: 'Helvetica, Arial, sans-serif'
                }
            }
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return val ? (val / 1000) + "k" : "No data"; // Hiển thị "No data" cho tháng 10, 11, 12
                }
            }
        },
        grid: {
            borderColor: '#e0e0e0',
            strokeDashArray: 0
        },
        legend: {
            show: true,
            position: 'top',
            horizontalAlign: 'center'
        }
    };

    // Cấu hình cho biểu đồ đường
    var lineOptions = {
        chart: {
            type: 'line',
            height: 250,
            zoom: { enabled: false }
        },
        stroke: {
            curve: 'smooth',
            width: 3
        },
        markers: {
            size: 5,
            hover: { sizeOffset: 3 }
        },
        plotOptions: {} // Xóa plotOptions của bar
    };

    // Cấu hình cho biểu đồ cột
    var barOptions = {
        chart: {
            type: 'bar',
            height: 250,
            zoom: { enabled: false }
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '30%',
                endingShape: 'rounded'
            }
        }
    };

    // Khởi tạo biểu đồ sau khi DOM sẵn sàng
    document.addEventListener('DOMContentLoaded', function () {
        var chart = new ApexCharts(document.querySelector("#high-performing-product"), {...options, ...lineOptions});
        chart.render();

        // Xử lý sự kiện click cho nút Line chart
        document.getElementById('line-chart-btn').addEventListener('click', function () {
            chart.updateOptions(lineOptions, true); // true để chạy lại animation
        });

        // Xử lý sự kiện click cho nút Bar chart
        document.getElementById('bar-chart-btn').addEventListener('click', function () {
            chart.updateOptions(barOptions, true); // true để chạy lại animation
        });
    });
</script>
