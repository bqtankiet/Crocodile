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
                                           value="ĐỒ DA CAO CẤP CROCODILE"/>
                                </div>
                            </div>

                            <!-- Vị trí  -->
                            <div class="mb-3 row">
                                <label for="location" class="col-md-2 col-form-label">Vị trí</label>
                                <div class="col-md-10">
                                    <input class="form-control" type="text" id="location" name="location"
                                           value="27 Phan Đình Phùng, Phường 17 Quận Phú Nhuận, Tp HCM"/>
                                </div>
                            </div>

                            <!-- Số điện thoại  -->
                            <div class="mb-3 row">
                                <label for="phone-number" class="col-md-2 col-form-label">Điện thoại</label>
                                <div class="col-md-10">
                                    <input class="form-control" type="text" id="phone-number" name="phone-number"
                                           value="082 878 6789"/>
                                </div>
                            </div>

                            <!-- Mã nhúng iframe  -->
                            <div class="mb-3 row">
                                <label for="product-description" class="col-md-2 col-form-label">Mã Iframe google map</label>
                                <div class="col-md-10">
                                    <textarea id="product-description" class="form-control" rows="9" name="iframe">
                                        <iframe class="google-map"
                                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.2408235347784!2d106.68294947485718!3d10.792858489356917!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528d2542cb98f%3A0xd62d81f3f3579bb9!2zMjcgUGhhbiDEkMOsbmggUGjDuW5nLCBQaMaw4budbmcgMTcsIFBow7ogTmh14bqtbiwgSOG7kyBDaMOtIE1pbmgsIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1730818827712!5m2!1sen!2s"
                                        width="1688" height="600" style="border:0;" allowfullscreen="" loading="lazy"
                                        referrerpolicy="no-referrer-when-downgrade">
                                        </iframe>
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
