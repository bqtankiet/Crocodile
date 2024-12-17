<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var = "accoutUrl" value="${applicationScope.url['admin.account']}"/>

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
                    <span class="fw-semibold d-block">Minh Khoi</span>
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
              <a class="dropdown-item" href="login.html">
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
      <h4 class="fw-bold py-3 mb-4">Thông tin tài khoản</h4>

      <div class="row">
        <div class="col-md-12">

          <div class="card mb-4">
            <h5 class="card-header">Chi tiết hồ sơ</h5>
            <!-- Account -->
            <div class="card-body">
              <div class="d-flex align-items-start align-items-sm-center gap-4">
                <img src="../assets/img/avatars/1.png" alt="user-avatar"
                     class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
                <div class="button-wrapper">
                  <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                    <span class="d-none d-sm-block">Thêm ảnh mới</span>
                    <i class="bx bx-upload d-block d-sm-none"></i>
                    <input type="file" id="upload" class="account-file-input" hidden
                           accept="image/png, image/jpeg" />
                  </label>
                  <button type="button"
                          class="btn btn-outline-secondary account-image-reset mb-4">
                    <i class="bx bx-reset d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">Đặt lại</span>
                  </button>

                  <p class="text-muted mb-0">Cho phép JPG, GIF hoặc PNG. Tối đa 800K</p>
                </div>
              </div>
            </div>
            <hr class="my-0" />
            <div class="card-body">
              <form id="formAccountSettings" method="POST" onsubmit="return false">
                <div class="row">
                  <div class="mb-3 col-md-6">
                    <label for="firstName" class="form-label">Tên</label>
                    <input class="form-control" type="text" id="firstName"
                           name="firstName" value="Khoi" placeholder="Tên"/>
                  </div>

                  <div class="mb-3 col-md-6">
                    <label for="lastName" class="form-label">Họ</label>
                    <input class="form-control" type="text" name="lastName"
                           id="lastName" value="Minh" placeholder="Họ"/>
                  </div>

                  <div class="mb-3 col-md-6">
                    <label for="nick-name" class="form-label">Biệt danh</label>
                    <input class="form-control" type="text" id="nick-name"
                           name="nick-name" placeholder="Biệt danh"/>
                  </div>

                  <div class="mb-3 col-md-6">
                    <label for="gender" class="form-label">Giới tính</label>
                    <input class="form-control" type="text" id="gender"
                           name="gender" value="Nam"/>
                  </div>

                  <div class="mb-3 col-md-6">
                    <label class="form-label" for="phoneNumber">Số điện thoại</label>
                    <div class="input-group input-group-merge">
                      <span class="input-group-text">VN (+84)</span>
                      <input type="text" id="phoneNumber" name="phoneNumber"
                             class="form-control" placeholder="Nhập số điện thoại" />
                    </div>
                  </div>

                  <div class="mb-3 col-md-6">
                    <label class="form-label" for="date-of-birth">Ngày sinh</label>
                    <div class="">
                      <input class="form-control" type="date" id="date-of-birth" />
                    </div>
                  </div>

                  <div class="mb-3 col-md-6">
                    <label for="email" class="form-label">E-mail</label>
                    <input class="form-control" type="text" id="email" name="email"
                           value="mkhoi@gmail.com" placeholder="abc@example.com" />
                  </div>

                  <div class="mb-3 col-md-6">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" id="address" name="address"
                           placeholder="Địa chỉ" />
                  </div>


                </div>
                <div class="mt-2">
                  <button type="submit" class="btn btn-primary me-2">Lưu thay đổi</button>
                  <button type="reset" class="btn btn-outline-secondary">Hủy bỏ</button>
                </div>
              </form>
            </div>
            <!-- /Account -->
          </div>

        </div>
      </div>
    </div>
  </div>
  <!-- Content wrapper -->
</div>