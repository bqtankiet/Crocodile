
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="updateCateUrl" value="${applicationScope.urls['admin.category.update']}"/>

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
                                        <span class="fs-3 demo text-body fw-bolder">Chỉnh sửa danh mục</span>
                                    </div>

                                    <form action="${updateCateUrl}" method="post" id="formAuthentication" class="mb-3">
                                        <div class="mb-3">
                                            <label for="id" class="form-label">ID danh mục</label>
                                            <input type="text" class="form-control" id="id" name="id"
                                                   value="${category.id}" readonly />
                                        </div>
                                        <div class="mb-3">
                                            <label for="name" class="form-label">Tên danh mục</label>
                                            <input type="text" class="form-control" id="name" name="name"
                                                   placeholder="Nhập tên danh mục"
                                                   value="${category.name}" autofocus required/>
                                        </div>
                                        <div class="mb-3">
                                            <label for="image" class="form-label">Hình ảnh</label>
                                            <input type="text" class="form-control" id="image" name="image"
                                                   value="${category.image}"
                                                   placeholder="Nhập hình ảnh" />
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Trạng thái hiển thị</label>
                                            <select  class="form-select category-dropdown" name="active">
                                                <option value="1" ${category.active == 1 ? 'selected' : ''}>Hiển thị</option>
                                                <option value="0" ${category.active == 0 ? 'selected' : ''} >Ẩn</option>
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
