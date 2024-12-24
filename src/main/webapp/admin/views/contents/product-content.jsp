<%@ page import="vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="url_productCreate" value="<%=UrlProperties.productCreate()%>"/>

<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4">
            <span class="text-muted fw-light">Quản lý danh mục /</span>
            Sản phẩm
        </h4>

        <!-- Bordered Table -->
        <div class="card">
            <!-- ------------------------------Bảng sản phẩm------------------------------ -->
            <div class="card-body">
                <div class="container">
                    <h2>
                        Danh sách sản phẩm
                        <a href="${url_productCreate}"
                           class="btn btn-secondary float-end text-white">Thêm</a>
                    </h2>

                    <table class="table table-striped table-hover my-3 pt-3" id="products-table">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col" class="align-middle">#</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Loại danh mục</th>
                            <th scope="col">Hình ảnh</th>
                            <th scope="col">Giá tiền</th>
                            <th scope="col">Tác vụ</th>
                        </tr>
                        </thead>
                        <tbody>

                        <!-- Product -->
                        <tr>
                            <th scope="row">
                                <strong>2</strong>
                            </th>
                            <td>
                                <strong class="product-name">Ví da nam</strong>
                            </td>
                            <td>
                                <strong class="category-name">Ví nam</strong>
                                <select style="max-width: 170px;"
                                        class="form-select category-dropdown d-none">
                                    <option value="">Ví nam</option>
                                    <option value="">Ví nữ</option>
                                    <option value="">Túi xách nam</option>
                                    <option value="">Túi xách nữ</option>
                                    <option value="">Túi đeo chéo</option>
                                    <option value="">Balo</option>
                                    <option value="">Vali</option>
                                    <option value="">Thắt lưng</option>
                                    <option value="">Áo khoác</option>
                                    <option value="">Giày tây</option>
                                    <option value="">Giày cao gót</option>
                                    <option value="">Phụ kiện</option>
                                </select>
                            </td>
                            <td>
                                <img style="max-height: 80px;" class="img-fluid"
                                     src="https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-1.jpg"
                                     alt="">
                            </td>
                            <td>
                                <strong class="product-price">700.000</strong>
                            </td>
                            <td>
                                <div class="btn-box d-none">
                                    <i class="bx bx-check me-2 btn-save fs-3 cursor-pointer"></i>
                                    <i class="bx bx-undo me-2 btn-cancel fs-3 cursor-pointer"></i>
                                </div>
                                <div class="dropdown option-box">
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
        </div>

    </div>
    <!-- Content wrapper -->
</div>
