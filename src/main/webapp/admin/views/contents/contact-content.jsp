<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="contactUrl" value="<%= UrlProperties.contact() %>"/>

<!-- Content wrapper -->
<div class="content-wrapper">

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4">Quản lý thông tin</h4>

        <div class="row">
            <div class="col-md-12">

                <div class="card mb-4">
                    <h5 class="card-header">Thông tin liên hệ</h5>
                    <div class="card-body">
                        <form >
                            <!-- Tiêu đề  -->
                            <div class="mb-3 row">
                                <label for="title" class="col-md-2 col-form-label">Tên cửa hàng</label>
                                <div class="col-md-10">
                                    <input class="form-control title" type="text" id="title" name="title"
                                           value="${contact.title}"/>
                                </div>
                            </div>

                            <!-- Vị trí  -->
                            <div class="mb-3 row">
                                <label for="location" class="col-md-2 col-form-label">Vị trí</label>
                                <div class="col-md-10">
                                    <input class="form-control location" type="text" id="location" name="location"
                                           value="${contact.location}"/>
                                </div>
                            </div>

                            <!-- Số điện thoại  -->
                            <div class="mb-3 row">
                                <label for="phone" class="col-md-2 col-form-label">Điện thoại</label>
                                <div class="col-md-10">
                                    <input class="form-control phone" type="text" id="phone" name="phone"
                                           value="${contact.phone}"/>
                                </div>
                            </div>

                            <!-- Mã nhúng iframe  -->
                            <div class="mb-3 row">
                                <label for="product-description" class="col-md-2 col-form-label">Mã Iframe google map</label>
                                <div class="col-md-10">
                                    <textarea id="product-description" class="form-control iframe" rows="9" name="iframe">
                                        ${contact.iframe}
                                    </textarea>

                                </div>
                            </div>

                            <div class="btn-box d-flex justify-content-center gap-3">
                                <!-- nút lưu-->
                                <button class="btn btn-success btn-update" >
                                    Lưu
                                </button>

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

<script>
    $(document).on('click', '.btn-update', function (event) {
        event.preventDefault();
        const title = $('.title').val();
        const phone = $('.phone').val();
        const location = $('.location').val();
        const iframe = $('.iframe').val().trim();

        $.ajax({
            url: "${contactUrl}",
            type: "POST",
            data: {
                title: title,
                phone: phone,
                location: location,
                iframe: iframe
            },
            success: function (response) {
                // window.location.reload();
                alert(1)
            },

            error: function (xhr, status, error) {
                if (xhr.status === 404) {
                    alert("Không tìm thấy endpoint " + "${contactUrl}");
                } else {
                    alert(0)
                }
                console.error("Error:", error);
            }
        });
    });

</script>
