<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="vi_VN"/>
<c:url var="url_product" value="<%=UrlProperties.product()%>"/>

<style>
  .profile-img {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    background: #f9b3b3;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
  }

  .profile-img img {
    width: 70px;
  }

  .name {
    font-size: 20px;
    font-weight: bold;
    margin: 10px 0;
  }

  .role {
    display: inline-block;
    background: #fce4e4;
    color: #ff6b6b;
    font-size: 14px;
    padding: 4px 10px;
    border-radius: 15px;
    margin-bottom: 15px;
  }

  .stats {
    display: flex;
    justify-content: space-around;
    margin-bottom: 15px;
  }

  .status {
    display: inline-block;
    background: #d4f8d4;
    color: #2a9d2a;
    padding: 4px 10px;
    border-radius: 15px;
    width: fit-content;
  }

  .buttons {
    display: flex;
    justify-content: space-between;
    margin-top: 15px;
  }

  .btn {
    flex: 1;
    padding: 8px 10px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 14px;
  }

  .btn.edit {
    background: #6a5acd;
    color: white;
    margin-right: 5px;
  }

  .btn.suspend {
    background: #ff6b6b;
    color: white;
    margin-left: 5px;
  }
</style>



<!-- Content wrapper -->
<div class="content-wrapper">
  <div class="container-xxl flex-grow-1 container-p-y pb-5">
    <%--        <h4 class="fw-bold py-3 mb-4">Chi tiết đơn hàng</h4>--%>

    <form method="post" id="form-order">
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

                  <div class="stats">
                    <div>
                      <div>69</div>
                      <small>Đã đặt</small>
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
                  <div class="row mb-2">
                    <label class="col-5 col-form-label px-0">Số điện thoại</label>
                    <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                           value="0123456141">
                  </div>

                  <div class="row mb-2">
                    <label class="col-5 col-form-label px-0">Email</label>
                    <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                           value="khoidzvclone@gmail.com">
                  </div>

                  <div class="row mb-2">
                    <label class="col-5 col-form-label px-0">Trạng thái</label>
                    <div class="col-2 status">Hoạt động</div>
                  </div>

                  <div class="row mb-2">
                    <label class="col-5 col-form-label px-0">Giới tính</label>
                    <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                           value="Nam">
                  </div>

                  <div class="row mb-2">
                    <label class="col-5 col-form-label px-0">Ngày sinh</label>
                    <input class="col border-0 text-secondary bg-transparent" disabled type="text"
                           value="10/10/2025">
                  </div>

                  <div class="buttons">
                    <button class="btn edit">Chỉnh sửa</button>
                    <button class="btn suspend">Đình chỉ</button>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>

        <%-- RIGHT --%>
        <div class="col-8 ps-0">

      </div>



    </form>
    <!-- ---------------------end bảng thêm sản phẩm---------------------------- -->
  </div>
  <!-- Content wrapper -->

  <!--  bootstrap  -->
  <%--    <script src="<c:url value="/public/bootstrap/js/bootstrap.bundle.js"/>"></script>--%>

</div>

