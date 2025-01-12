
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">

        <h4 class="fw-bold py-3 mb-4">
            <span class="text-muted fw-light">Quản lý thông tin /</span>
            Đơn hàng
        </h4>
        <!-- Bordered Table -->
        <div class="card">
            <!-- ------------------------------Bảng sản phẩm------------------------------ -->
            <div class="card-body">
                <div class="container">
                    <h2>Danh sách đơn hàng</h2>
                    <table class="table table-striped table-hover my-3 pt-3" id="products-table">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col" class="align-middle">Mã đơn hàng</th>
                            <th scope="col">Tên khách hàng</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Tổng tiền</th>
                            <th scope="col">Phương thức thanh toán</th>
                            <th scope="col" class="align-middle">Ngày đặt</th>
                            <th scope="col">Tác vụ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Hàng 1 -->
                        <tr>
                            <th scope="row">22</th>
                            <td>DavidBecKhôi</td>
                            <td>0123456789</td>
                            <td>1.200.000</td>
                            <td><img style="width: 300px; height: 300px" src="https://bizweb.dktcdn.net/thumb/compact/100/027/341/products/clutch-nam-da-ca-sau-8a.jpg?v=1701337832133" alt=""></td>
                            <td>20/11/2022 15:30:30</td>
                            <td>
                                <div class="dropdown">
                                    <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="order-detail.html"><i
                                                class="menu-icon tf-icons bx bx-file"></i> Chi
                                            tiết</a>
                                        <a class="dropdown-item" href="javascript:void(0);"><i
                                                class="bx bx-trash me-1"></i> Xóa</a>
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
    <!-- Content wrapper -->
</div>
