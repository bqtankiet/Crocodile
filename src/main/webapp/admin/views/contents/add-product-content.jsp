<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4">Thêm sản phẩm mới</h4>

        <!-- --------------------------------Bảng thêm sản phẩm------------------------------- -->
        <%--  Thông tin cơ bản --%>
        <div class="card">
            <h5 class="card-header"><strong>Thông tin cơ bản</strong></h5>
            <form method="post" id="add-product-form" class="card-body needs-validation mx-4">
                <!-- Form tải hình ảnh -->
                <div class="mb-3 input-group">
                    <span class="col-md-2 col-form-label">Hình ảnh</span>
                    <div class="col-md-10 d-flex gap-3" id="product-images">
                        <div class="[ upload-image ]">
                            <input class="form-control d-none" type="file"
                                   accept="image/jpeg, image/jpg, image/png"
                                   id="uploadImage0" name="image0"
                                   required/>
                            <label for="uploadImage0" class="cursor-pointer">
                                                <span class="position-relative">
                                                    <!--https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-3.jpg-->
                                                    <img src="" alt="" id="preview0"
                                                         class="[ preview ] d-block border border-danger"
                                                         style="width: 5rem; height: 5rem; object-fit: cover">
                                                    <span class="[ add-img-icon ] fs-1 position-absolute translate-middle top-50 start-50">+</span>
                                                </span>
                                <span class="d-block text-center mt-1">Ảnh bìa</span>
                            </label>
                        </div>
                        <div class="[ upload-image ]">
                            <input class="form-control d-none" type="file"
                                   accept="image/jpeg, image/jpg, image/png"
                                   id="uploadImage1" name="image1"/>
                            <label for="uploadImage1" class="cursor-pointer">
                                                <span class="position-relative">
                                                    <!--https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-3.jpg-->
                                                    <img src="" alt="" class="[ preview ] d-block"
                                                         style="width: 5rem; height: 5rem; object-fit: cover">
                                                    <span class="[ add-img-icon ] fs-1 position-absolute translate-middle top-50 start-50">+</span>
                                                </span>
                                <span class="d-block text-center mt-1">Ảnh (1/4)</span>
                            </label>
                        </div>
                        <div class="[ upload-image ]">
                            <input class="form-control d-none" type="file"
                                   accept="image/jpeg, image/jpg, image/png"
                                   id="uploadImage2" name="image2"/>
                            <label for="uploadImage2" class="cursor-pointer">
                                                <span class="position-relative">
                                                    <!--https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-3.jpg-->
                                                    <img src="" alt="" class="[ preview ] d-block"
                                                         style="width: 5rem; height: 5rem; object-fit: cover">
                                                    <span class="[ add-img-icon ] fs-1 position-absolute translate-middle top-50 start-50">+</span>
                                                </span>
                                <span class="d-block text-center mt-1">Ảnh (2/4)</span>
                            </label>
                        </div>
                        <div class="[ upload-image ]">
                            <input class="form-control d-none" type="file"
                                   accept="image/jpeg, image/jpg, image/png"
                                   id="uploadImage3" name="image3"/>
                            <label for="uploadImage3" class="cursor-pointer">
                                                <span class="position-relative">
                                                    <!--https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-3.jpg-->
                                                    <img src="" alt="" class="[ preview ] d-block"
                                                         style="width: 5rem; height: 5rem; object-fit: cover">
                                                    <span class="[ add-img-icon ] fs-1 position-absolute translate-middle top-50 start-50">+</span>
                                                </span>
                                <span class="d-block text-center mt-1">Ảnh (3/4)</span>
                            </label>
                        </div>
                        <div class="[ upload-image ]">
                            <input class="form-control d-none" type="file"
                                   accept="image/jpeg, image/jpg, image/png"
                                   id="uploadImage4" name="image4"/>
                            <label for="uploadImage4" class="cursor-pointer">
                                                <span class="position-relative">
                                                    <!--https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-3.jpg-->
                                                    <img src="" alt="" class="[ preview ] d-block"
                                                         style="width: 5rem; height: 5rem; object-fit: cover">
                                                    <span class="[ add-img-icon ] fs-1 position-absolute translate-middle top-50 start-50">+</span>
                                                </span>
                                <span class="d-block text-center mt-1">Ảnh (4/4)</span>
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Tên sản phẩm  -->
                <div class="mb-3 row">
                    <label for="product-name" class="col-md-2 col-form-label">Tên sản phẩm</label>
                    <div class="col-md-10">
                        <input class="form-control" type="text" id="product-name" name="product-name" required/>
                    </div>
                </div>

                <!-- Danh mục sản phẩm-->
                <div class="mb-3 row">
                    <label class="col-md-2 col-form-label">Danh mục</label>
                    <div class="col-md-4">
                        <select style="width: max-content" class="form-select placement-dropdown"
                                id="selectPlacement" aria-label="" name="category">
                            <option value="1">Ví nam</option>
                            <option value="2">Ví nữ</option>
                            <option value="3">Túi xách nam</option>
                            <option value="4">Túi xách nữ</option>
                            <option value="5">Túi đeo chéo</option>
                            <option value="6">Balo</option>
                            <option value="7">Vali</option>
                            <option value="8">Thắt lưng</option>
                            <option value="9">Áo khoác</option>
                            <option value="10">Giày tây</option>
                            <option value="11">Giày cao gót</option>
                            <option value="12">Phụ kiện</option>
                            <option value="13">Danh mục khác</option>
                        </select>
                    </div>
                </div>

                <!-- Mô tả sản phẩm  -->
                <div class="mb-3 row">
                    <label for="product-description" class="col-md-2 col-form-label">Mô tả sản phẩm</label>
                    <div class="col-md-10">
                        <textarea id="product-description" class="form-control" rows="7" name="description"></textarea>
                    </div>
                </div>

            </form>
        </div>

        <%--  Thông tin chi tiết --%>
        <div class="card mt-3">
            <h5 class="card-header"><strong>Thông tin chi tiết</strong></h5>
            <form action="" class="card-body needs-validation mx-4" id="product-detail-container">
                <!-- Thương hiệu, Xuất xứ -->
                <div class="mb-3 row">
                    <div class="row col">
                        <label for="???" class="col-md-4 col-form-label text-end">Thương hiệu</label>
                        <div class="col">
                            <input class="form-control" type="text" id="???" name="???" required/>
                        </div>
                    </div>

                    <div class="row col">
                        <label for="???" class="col-md-4 col-form-label text-end">Xuất xứ</label>
                        <div class="col">
                            <input class="form-control" type="text" id="???" name="???" required/>
                        </div>
                    </div>
                </div>

                <!-- Loại da, nguồn gốc da -->
                <div class="mb-3 row">
                    <div class="row col">
                        <label for="???" class="col-md-4 col-form-label text-end">Loại da</label>
                        <div class="col">
                            <input class="form-control" type="text" id="???" name="???" required/>
                        </div>
                    </div>

                    <div class="row col">
                        <label for="???" class="col-md-4 col-form-label text-end">Nguồn gốc da</label>
                        <div class="col">
                            <input class="form-control" type="text" id="???" name="???" required/>
                        </div>
                    </div>
                </div>

                <hr/>

                <!-- Thiết kế -->
                <div class="mb-3 row">
                    <label for="???" class="col-md-2 col-form-label text-end">Thiết kế</label>
                    <div class="col-md-10">
                        <input class="form-control" type="text" id="???" name="???"/>
                    </div>
                </div>

                <!-- Chính sách -->
                <div class="mb-3 row">
                    <label for="???" class="col-md-2 col-form-label text-end">Chính sách</label>
                    <div class="col-md-10">
                        <input class="form-control" type="text" id="???" name="???"/>
                    </div>
                </div>

                <!-- Thông tin custom -->
                <%--                <div class="mb-3 row product-detail-custom">--%>
                <%--                    <input type="text" class="col-md-2 col-form-label text-end border-0 border-bottom" aria-label="">--%>
                <%--                    <div class="col">--%>
                <%--                        <input class="form-control" type="text" id="???" name="???"/>--%>
                <%--                    </div>--%>
                <%--                    <button class="col-1 btn btn-danger product-detail-delete">Xóa</button>--%>
                <%--                </div>--%>

            </form>

            <div class="d-flex justify-content-center mb-3">
                <a role="button" class="text-decoration-underline" id="product-detail-add">Thêm thông tin khác </a>
            </div>
        </div>

        <%--  Thông tin bán hàng --%>
        <div class="card mt-3">
            <h5 class="card-header"><strong>Thông tin bán hàng </strong></h5>
            <form action="" class="card-body needs-validation mx-4">
                <!-- Giá sản phẩm  -->
                <div class="mb-3 row">
                    <label for="product-price" class="col-md-2 col-form-label">Giá bán</label>
                    <div class="col-md-3">
                        <input class="form-control" type="number" id="product-price" name="price"/>
                    </div>
                </div>

                <!-- Sản phẩm KHÔNG CÓ phân loại -->
                <div>
                    <!-- Kho hàng  -->
                    <div class="mb-3 row">
                        <label for="product-quantity" class="col-md-2 col-form-label">Số lượng kho</label>
                        <div class="col-md-3">
                            <input class="form-control" type="number" id="product-quantity" name="stock"/>
                        </div>
                    </div>

                    <!-- Mã SKU  -->
                    <div class="mb-3 row">
                        <label for="???" class="col-md-2 col-form-label">Mã SKU</label>
                        <div class="col-md-3">
                            <input class="form-control" type="number" id="???" name="???" aria-label=""/>
                        </div>
                    </div>
                </div>

                <!-- Sản phẩm CÓ phân loại -->
                <div>
                    <div class="mb-3 row align-items-stretch">
                        <!-- phan loai 1 -->
                        <div id="option-group-type1" class="col-6">
                            <label class="col">Phân loại 1 </label>
                            <div class="p-3 h-100" style="background-color: #e8e8e8">
                                <input type="text" aria-label="" placeholder="Tên phân loại" class="form-control" name="option-group">
                                <hr>
                                <div class="[ options-container ] d-flex flex-wrap mt-2"
                                     style="column-gap: 2rem; row-gap: 1rem">
                                    <div class="[ option ] d-flex align-items-center w-100">
                                        <input class="[ option-value ] form-control" type="text" aria-label="" name=""
                                               placeholder="Nhập phân loại">
                                        <div class="[ upload-image ] ms-2 d-flex">
                                            <input class="option-img form-control d-none " type="file"
                                                   accept="image/jpeg, image/jpg, image/png" name=""/>
                                            <label class="cursor-pointer">
                                            <span class="position-relative">
                                                <img src="" alt="" class="[ upload-image-preview ] d-block"
                                                     style="width: 2rem; height: 2rem; object-fit: cover">
                                                <span class="[ add-img-icon ] fs-2 position-absolute translate-middle top-50 start-50">+</span>
                                            </span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- phan loai 2 -->
                        <div id="option-group-type2" class="col-6">
                            <label class="col">Phân loại 2 </label>
                            <div class="p-3 h-100" style="background-color: #e8e8e8">
                                <input type="text" aria-label="" placeholder="Tên phân loại" class="form-control"
                                       name="option-group">
                                <hr>
                                <div class="[ options-container ] d-flex flex-wrap mt-2"
                                     style="column-gap: 2rem; row-gap: 1rem">
                                    <div class="[ option ] d-flex align-items-center w-100">
                                        <input class="[ option-value ] form-control" type="text" aria-label="" name="" placeholder="Nhập phân loại">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Test-->
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Home</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Profile</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Contact</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="disabled-tab" data-bs-toggle="tab" data-bs-target="#disabled-tab-pane" type="button" role="tab" aria-controls="disabled-tab-pane" aria-selected="false" disabled>Disabled</button>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">...</div>
                    <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">...</div>
                    <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>
                    <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
                </div>
            </form>
        </div>

        <div class="btn-box d-flex justify-content-center gap-3">
            <!-- nút lưu-->
            <button class="btn btn-success" type="submit">Lưu</button>

            <!-- nút thoát -->
            <a href="products.html" class="btn btn-danger">Thoát</a>
        </div>
        <!-- ---------------------end bảng thêm sản phẩm---------------------------- -->
    </div>
    <!-- Content wrapper -->

    <!-- js -->
    <script>
        $(document).ready(function () {
            // Xử lý button xóa product-detail-custom
            $('#product-detail-container').on('click', '.product-detail-delete', function () {
                $(this).closest('.product-detail-custom').remove();
            });

            // Xử lý button thêm product-detail-custom
            $('#product-detail-add').click(function () {
                $('#product-detail-container').append(`
                <div class="mb-3 row product-detail-custom">
                    <input type="text" class="col-md-2 col-form-label text-end border-0 border-bottom"
                           aria-label=""/>
                    <div class="col">
                        <input class="form-control" type="text" id="???" name="???"/>
                    </div>
                    <button class="col-1 btn btn-danger product-detail-delete">Xóa</button>
                </div>`
                );
            });

            // Xử lý cập nhật ảnh preview khi thay đổi file
            $('.upload-image input[type="file"]').on('change', function () {
                let filePath = $(this).val();
                console.log(filePath);
                $(this).closest('.upload-image').find('.upload-image-preview').attr('src', filePath);
                $(this).closest('.upload-image').find('.add-img-icon').remove();
            });

            // Xử lý cập nhật option khi thay đổi nội dung
            $('.options-container').on('change', '.option .option-value', function () {
                const $optionContainer = $(this).closest('.options-container');
                const $currentOption = $(this).closest('.option');

                // Nếu nội dung rỗng và không phải phần tử duy nhất -> xóa option
                if ($optionContainer.children().length > 1) {
                    if ($(this).val().trim() === '') {
                        $currentOption.remove();
                        return;
                    }
                }

                // Nếu nội dung thay đổi và là phần tử cuối cùng -> thêm option
                if ($currentOption.is(':last-child')) {
                    let withImage = $currentOption.find('.upload-image').length > 0;
                    $optionContainer.append(getOptionHtmlTemplate(withImage));
                }
            });
        });

        function getOptionHtmlTemplate(withImage) {
            let html;
            if (withImage) {
                html = `
                    <div class="[ option ] d-flex align-items-center w-100">
                        <input class="[ option-value ] form-control" type="text" aria-label="" name="" placeholder="Nhập phân loại">
                        <div class="[ upload-image ] ms-2 d-flex">
                            <input class="option-img form-control d-none " type="file" accept="image/jpeg, image/jpg, image/png" name=""/>
                            <label class="cursor-pointer">
                                <span class="position-relative">
                                    <img src="" alt="" class="[ upload-image-preview ] d-block" style="width: 2rem; height: 2rem; object-fit: cover">
                                    <span class="[ add-img-icon ] fs-2 position-absolute translate-middle top-50 start-50">+</span>
                                </span>
                              </label>
                        </div>
                    </div>
                `;
            } else {
                html = `
                    <div class="[ option ] d-flex align-items-center w-100">
                        <input class="[ option-value ] form-control" type="text" aria-label="" name="" placeholder="Nhập phân loại">
                    </div>
                `;
            }
            return html;
        }
    </script>
</div>

