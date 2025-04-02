<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="vi_VN"/>
<c:url var="url_product" value="<%=UrlProperties.product()%>"/>

<style>

</style>



<!-- Content wrapper -->
<div class="content-wrapper">
  <div class="container-xxl flex-grow-1 container-p-y pb-5">

    <form action="update" method="post" id="form-update-user">
      <div class="row">
        <%-- LEFT --%>
        <div class="col">
          <%--  Thông tin người dùng --%>
          <div class="ps-3 card h-100">
            <div class="px-0 card-body needs-validation mx-4">

              <div class="row px-0 text-center">
                <div class="col">
                  <div class="profile-img">
                    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="User">
                  </div>
                  <div class="name">Minh Khôi</div>
                  <div class="role">Super Admin</div>
                  <input type="text" class="id d-none" value="1">
                  <div class="stats">
                    <div>
                      <div>69</div>
                      <small>Đã nhận</small>
                    </div>
                    <div>
                      <div>4</div>
                      <small>Đã hủy</small>
                    </div>
                  </div>

                </div>
              </div>
              <%-- Thông tin người dùng chi tiết --%>
              <div class="row px-0">
                <h5 class="pb-4 border-bottom mb-4">Chi tiết</h5>
                <div class="col">
                  <div class="row mb-2 d-flex align-items-center full-name d-none">
                    <label class="col-5 col-form-label px-0">Họ và Tên</label>
                    <input class="col border-0 border text-secondary bg-transparent fullname" disabled type="text"
                           value="Minh Khôi">
                  </div>
                  <div class="row mb-2 d-flex align-items-center">
                    <label class="col-5 col-form-label px-0">Số điện thoại</label>
                    <input class="col border-0 border text-secondary bg-transparent phone-number" disabled type="text"
                           value="0323456141" name="phone">
                  </div>

                  <div class="row mb-2 d-flex align-items-center">
                    <label class="col-5 col-form-label px-0">Email</label>
                    <input class="col border-0 border text-secondary bg-transparent email" disabled type="email"
                           value="khoidzvclone@gmail.com">
                  </div>

                  <div class="row mb-2 d-flex align-items-center">
                    <label class="col-5 col-form-label px-0">Trạng thái</label>
                    <div class="col-2 status">Hoạt động</div>

                    <div class="form-check-radio status-radio col d-flex justify-content-between d-none">
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="status" id="active" value="1">
                        <label class="form-check-label" for="active">
                          Hoạt động
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="status" id="suspend" value="0">
                        <label class="form-check-label" for="suspend">
                          Đình chỉ
                        </label>
                      </div>

                    </div>
                  </div>

                  <div class="row mb-2 d-flex align-items-center">
                    <label class="col-5 col-form-label px-0">Giới tính</label>
                    <label class="col gender">Nam</label>

                    <div class="form-check-radio gender-radio col d-flex justify-content-between d-none">
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="NAM">
                        <label class="form-check-label" for="male">
                          Nam
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="NỮ">
                        <label class="form-check-label" for="female">
                          Nữ
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="other" value="KHÁC">
                        <label class="form-check-label" for="other">
                          Khác
                        </label>
                      </div>
                    </div>
                  </div>

                  <div class="row mb-2 d-flex align-items-center">
                    <label class="col-5 col-form-label px-0">Ngày sinh</label>
                    <input class="col border-0 border text-secondary bg-transparent birthdate" disabled type="date"
                           value="2025-10-10">
                  </div>

                  <div class="row mb-2 d-flex align-items-center role-radio d-none">
                    <label class="col-5 col-form-label px-0">Vai trò</label>

                    <div class="form-check-radio  col d-flex justify-content-between ">
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="role" id="admin" value="1">
                        <label class="form-check-label" for="admin">
                          Admin
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="role" id="user" value="0">
                        <label class="form-check-label" for="user">
                          Người dùng
                        </label>
                      </div>
                    </div>
                  </div>

                  <div class="buttons edit">
                    <button type="button" class="btn edit">Chỉnh sửa</button>
                    <button type="button" class="btn btn-outline-danger suspend">Đình chỉ</button>
                  </div>

                  <div class="buttons action d-none">
                    <button type="button" class="btn save">Lưu</button>
                    <button type="reset" class="btn cancel btn-outline-danger">Hủy</button>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>

        <%-- RIGHT --%>
        <div class="col-8 ps-0">
          <div class="card h-100">
            <div class="card-body">
              <div class="container">

                <h5 class="px-0 mt-3">
                  <strong>Lịch sử mua hàng</strong>
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
                </h5>



                <table class="my-table my-3 pt-3" id="users-table">
                  <thead class="table-primary">
                  <tr>
                    <th scope="col"><input type="checkbox" id="selectAll" class="form-check-input" aria-label=""></th>
                    <th scope="col">Mã đơn</th>
                    <th scope="col">Ngày đặt</th>
                    <th scope="col">Tổng tiền</th>
                    <th scope="col">Thanh toán</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col" class="action-column"></th>
                  </tr>
                  </thead>
                  <tbody>
                  <!-- Hàng 1 -->
                  <c:forEach items="${requestScope.userOrder}" var="o">
                    <tr>
                      <td><input type="checkbox" class="rowCheckbox form-check-input" aria-label=""></td>
                      <th scope="row">${o.id}</th>
                      <td><fmt:formatDate value="${o.invoiceUtilDate}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                      <td><fmt:formatNumber value="${o.total}" type="currency" currencyCode="VND" maxFractionDigits="0"/></td>
                      <td>${o.paymentMethod}</td>
                      <td ><span class="badge bg-gray">${o.status.description}</span></td>
                      <td>
                        <div class="dropdown">
                          <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                  data-bs-toggle="dropdown">
                            <i class="bx bx-dots-vertical-rounded"></i>
                          </button>
                          <div class="dropdown-menu">
                            <a class="dropdown-item" href="#"><i
                                    class="menu-icon tf-icons bx bx-file"></i> Chi tiết</a>
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
      </div>
    </form>
    <!-- ---------------------end bảng thêm sản phẩm---------------------------- -->
  </div>
  <!-- Content wrapper -->

  <!--  bootstrap  -->
<%--      <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>--%>
</div>

<!-- Kích hoạt Data table  -->
<script src="<c:url value="/admin/assets/js/datatable.js"/> "></script>
<!-- Data table -->

<script src="<c:url value="/admin/assets/js/my-table.js"/>"></script>

<script src="<c:url value="/admin/assets/js/user-detail.js"/>"></script>

