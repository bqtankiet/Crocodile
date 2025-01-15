
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="insCateUrl" value="${applicationScope.urls['admin.category.insert']}"/>

<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="container">
            <div class="container-xxl">
                <div class="authentication-wrapper authentication-basic ">
                    <div class="authentication-inner">
                        <div class="card">
                            <div class="card-body">
                                <div class="app-brand justify-content-center">
                                    <span class="fs-3 demo text-body fw-bolder">Thêm danh mục</span>
                                </div>

                                <form action="${insCateUrl}" method ="post" enctype="multipart/form-data"
                                      id="formAuthentication" class="mb-3">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Tên danh mục</label>
                                        <input type="text" class="form-control" id="name" name="name"
                                               placeholder="Nhập tên danh mục" autofocus />
                                    </div>
                                    <%--TODO ckfinder--%>
                                    <div class="mb-3">
<%--                                        <label for="image" class="form-label">Hình ảnh</label>--%>
<%--                                        <input type="text" class="form-control" id="image" name="image"--%>
<%--                                               placeholder="Nhập hình ảnh" />--%>
                                            <label class="form-label">Chọn ảnh:</label>
                                            <div class="[ upload-image ]">
                                                <input class="form-control d-none" type="text" name="image-url" aria-label=""/>
                                                <div class="cursor-pointer">
                                                    <div class="position-relative">
                                                        <img src="" alt="" class="[ preview ] d-block border border-danger"
                                                             style="width: 5rem; height: 5rem; object-fit: cover">
                                                    </div>
                                                </div>
                                            </div>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Trạng thái hiển thị</label>
                                        <select class="form-select category-dropdown" name="active">
                                            <option value="1">Hiển thị</option>
                                            <option value="0">Ẩn</option>
                                        </select>
                                    </div>

                                    <button type="submit" class="btn btn-primary d-grid w-100">Thêm</button>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <!-- Content wrapper -->
    <script src="<c:url value="/public/ckfinder/ckfinder.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/ckfinder/popupCkfinder.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/pages/product-detail-content/handle-popup-ckfinder.js"/>"></script>
</div>
