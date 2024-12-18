
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="layout-page">
    <!-- Navbar -->
    <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
         id="layout-navbar">
        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
            </a>
        </div>

        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
            <!-- Search -->
            <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                    <i class="bx bx-search fs-4 lh-0"></i>
                    <input type="text" class="form-control border-0 shadow-none" placeholder="Tìm kiếm..."
                           aria-label="Search..." />
                </div>
            </div>
            <!-- /Search -->

            <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                    <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <div class="avatar avatar-online">
                            <img src="/admin/assets/img/avatars/1.png" alt
                                 class="w-px-40 h-auto rounded-circle" />
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                            <a class="dropdown-item" href="#">
                                <div class="d-flex">
                                    <div class="flex-shrink-0 me-3">
                                        <div class="avatar avatar-online">
                                            <img src="/admin/assets/img/avatars/1.png" alt
                                                 class="w-px-40 h-auto rounded-circle" />
                                        </div>
                                    </div>
                                    <div class="flex-grow-1">
                                        <span class="fw-semibold d-block">KhoiDz</span>
                                        <small class="text-muted">Admin</small>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <div class="dropdown-divider"></div>
                        </li>
                        <li>
                            <a class="dropdown-item" href="account-setting.html">
                                <i class="bx bx-user me-2"></i>
                                <span class="align-middle">Hồ sơ</span>
                            </a>
                        </li>
                        <li>
                            <div class="dropdown-divider"></div>
                        </li>
                        <li>
                            <a class="dropdown-item" href="auth-login-basic.html">
                                <i class="bx bx-power-off me-2"></i>
                                <span class="align-middle">Đăng xuất</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!--/ User -->
            </ul>
        </div>
    </nav>


    <!-- Content wrapper -->
    <div class="content-wrapper">
        <div class="container-xxl flex-grow-1 container-p-y">
            <h4 class="fw-bold py-3 mb-4">
                <span class="text-muted fw-light">Quản lý danh mục /</span>
                Loại danh mục
            </h4>

            <!-- Bordered Table -->
            <div class="card">
                <div class="card-body">

                    <div class="container">
                        <h2>Danh sách danh mục</h2>
                        <table class="table table-striped table-hover table-bordered mb-3 pt-3"
                               id="categories-table">
                            <thead class="table-primary">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên danh mục</th>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col">Tác vụ</th>

                            </tr>
                            </thead>
                            <tbody>

                            <!-- Hàng 1 -->
                            <tr>
                                <th scope="row">1</th>
                                <td>Túi xách nữ</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="/assets/images/categories-img/handbag.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Hàng 2 -->
                            <tr>
                                <th scope="row">2</th>
                                <td>Ví nam</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="/assets/images/categories-img/wallet-icon.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Hàng 3 -->
                            <tr>
                                <th scope="row">3</th>
                                <td>Thắt lưng</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="/assets/images/categories-img/man-belt-icon.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Hàng 4 -->
                            <tr>
                                <th scope="row">4</th>
                                <td>Giày tây</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="/assets/images/categories-img/man-shoe-icon.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Hàng 5 -->
                            <tr>
                                <th scope="row">5</th>
                                <td>Dép</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="https://cdn4.iconfinder.com/data/icons/elasto-style/26/ELASTOFONT-READY-GLUE_male-shoes-128.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Hàng 6 -->
                            <tr>
                                <th scope="row">6</th>
                                <td>Phụ kiện</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="/assets/images/categories-img/smartwatch-icon.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Hàng 7 -->
                            <tr>
                                <th scope="row">7</th>
                                <td>Áo khoác</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="/assets/images/categories-img/aokhoacda.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Hàng 8 -->
                            <tr>
                                <th scope="row">8</th>
                                <td>Balo</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="/assets/images/categories-img/backpack-icon.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Hàng 9 -->
                            <tr>
                                <th scope="row">9</th>
                                <td>Vali</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="/assets/images/categories-img/tourist-bag-icon.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <!-- Hàng 10 -->
                            <tr>
                                <th scope="row">10</th>
                                <td>Giày cao gót</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="https://cdn0.iconfinder.com/data/icons/elasto-style/26/high-heels-128.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Hàng 11 -->
                            <tr>
                                <th scope="row">11</th>
                                <td>Ví nữ</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="/assets/images/categories-img/purse.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <!-- Hàng 12 -->
                            <tr>
                                <th scope="row">12</th>
                                <td>Túi xách nam</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="/assets/images/categories-img/briefcase-line-icon.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <!-- Hàng 13 -->
                            <tr>
                                <th scope="row">13</th>
                                <td>Túi đeo chéo</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="/assets/images/categories-img/sling-bag.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-trash me-1"></i> Xóa</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <!-- Hàng 14 -->
                            <tr>
                                <th scope="row">14</th>
                                <td>Danh mục khác</td>
                                <td>
                                    <img style="max-height: 50px;" class="img-fluid"  src="https://static.thenounproject.com/png/637282-200.png" alt="">
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
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
                <!--/ Bordered Table -->


                <!--/ Responsive Table -->
            </div>

        </div>
        <!-- Content wrapper -->
    </div>
    <!-- / Layout page -->
</div>
