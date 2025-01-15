<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="updateUserUrl" value="<%=UrlProperties.updateUser()%>"/>

<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="container">
            <div class="container-xxl">
                <div class="authentication-wrapper authentication-basic ">
                    <div class="authentication-inner">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-body">
                                    <div class="app-brand justify-content-center">
                                        <span class="fs-3 demo text-body fw-bolder">Chỉnh sửa thông tin người dùng</span>
                                    </div>

                                    <form action="${updateUserUrl}" method="post" id="formAuthentication" class="mb-3">
                                        <%--user id--%>
                                        <div class="mb-3">
                                            <label for="id" class="form-label">ID User</label>
                                            <input type="text" class="form-control" id="id" name="id"
                                                   value="${requestScope.user.id}" readonly/>
                                        </div>

                                        <%--user name--%>
                                        <div class="mb-3">
                                            <label for="username" class="form-label">Tên đăng nhập</label>
                                            <input type="text" class="form-control" id="username" name="username"
                                                   value="${requestScope.user.username}" autofocus required/>
                                        </div>

                                        <%--fullname--%>
                                        <div class="mb-3">
                                            <label for="fullname" class="form-label">Họ tên</label>
                                            <input type="text" class="form-control" id="fullname" name="fullname"
                                                   value="${requestScope.user.fullname}" autofocus required/>
                                        </div>

                                        <%--email--%>
                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email</label>
                                            <input type="text" class="form-control" id="email" name="email"
                                                   value="${requestScope.user.email}" autofocus required/>
                                        </div>

                                        <%--phonenumber--%>
                                        <div class="mb-3">
                                            <label for="phoneNumber" class="form-label">Số điện thoại</label>
                                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber"
                                                   value="${requestScope.user.phoneNumber}" autofocus required/>
                                        </div>

                                        <%--gender--%>
                                        <div class="mb-3">
                                            <label for="gender" class="form-label">Giới tính</label>
                                            <input type="text" class="form-control" id="gender" name="gender"
                                                   value="${requestScope.user.gender}" autofocus required readonly/>
                                        </div>

                                        <%--birthdate--%>
                                        <div class="mb-3">
                                            <label for="birthdate" class="form-label">Ngày sinh</label>
                                            <input type="text" class="form-control" id="birthdate" name="gender"
                                                   value="${requestScope.user.birthdate}" autofocus required readonly/>
                                        </div>

                                        <%--active--%>
                                        <div class="mb-3">
                                            <label class="form-label">Trạng thái tài khoản</label>
                                            <select class="form-select category-dropdown" name="active" aria-label="">
                                                <option value="1" ${requestScope.user.active == 1 ? 'selected' : ''}>Hoạt động</option>
                                                <option value="0" ${requestScope.user.active == 0 ? 'selected' : ''} >Cấm</option>
                                            </select>
                                        </div>


                                        <%--role--%>
                                        <div class="mb-3">
                                            <label class="form-label">Phân quyền</label>
                                            <select class="form-select category-dropdown" name="role" aria-label="">
                                                <option value="1" ${requestScope.user.role == 1 ? 'selected' : ''}>Admin</option>
                                                <option value="0" ${requestScope.user.role == 0 ? 'selected' : ''} >User</option>
                                            </select>
                                        </div>


                                        <button class="btn btn-primary d-grid w-100">Cập nhật</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!-- Content wrapper -->
    </div>
</div>