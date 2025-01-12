<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Content wrapper -->
<div class="content-wrapper">

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4">Quản lý thông tin</h4>

        <div class="row">
            <div class="col-md-12">

                <div class="card mb-4">
                    <h5 class="card-header">Thông tin liên hệ</h5>
                    <div class="card-body">
                        <form>
                            <!-- Tiêu đề  -->
                            <div class="mb-3 row">
                                <label for="title" class="col-md-2 col-form-label">Tên cửa hàng</label>
                                <div class="col-md-10">
                                    <input class="form-control" type="text" id="title" name="title"
                                           value="${contact.title}"/>
                                </div>
                            </div>

                            <!-- Vị trí  -->
                            <div class="mb-3 row">
                                <label for="location" class="col-md-2 col-form-label">Vị trí</label>
                                <div class="col-md-10">
                                    <input class="form-control" type="text" id="location" name="location"
                                           value="${contact.location}"/>
                                </div>
                            </div>

                            <!-- Số điện thoại  -->
                            <div class="mb-3 row">
                                <label for="phone-number" class="col-md-2 col-form-label">Điện thoại</label>
                                <div class="col-md-10">
                                    <input class="form-control" type="text" id="phone-number" name="phone-number"
                                           value="${contact.phone}"/>
                                </div>
                            </div>

                            <!-- Mã nhúng iframe  -->
                            <div class="mb-3 row">
                                <label for="product-description" class="col-md-2 col-form-label">Mã Iframe google map</label>
                                <div class="col-md-10">
                                    <textarea id="product-description" class="form-control" rows="9" name="iframe">
                                        ${contact.iframe}
                                    </textarea>

                                </div>
                            </div>

                            <div class="btn-box d-flex justify-content-center gap-3">
                                <!-- nút lưu-->
                                <button class="btn btn-success" type="submit">Lưu</button>

                                <!-- nút reset -->
                                <button class="btn btn-danger" type="reset">Hủy</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Content wrapper -->
