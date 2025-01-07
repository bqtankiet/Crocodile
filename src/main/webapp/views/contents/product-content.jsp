<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="CONTENT">
    <!-- Breadcrumb Navigation-->
    <div class="container">
        <nav style="--bs-breadcrumb-divider: '>'">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="home.html">Trang Chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Ví Nam</li>
            </ol>
        </nav>
        <hr>
    </div>

    <!-- Products Section -->
    <div class="container">
        <div class="row">
            <!-- Product Filter -->
            <div class="col-12 d-flex flex-column gap-3">
                <!-- Danh muc -->
                <div class="ms-1 ms-lg-0 bg-secondary-subtle p-3">
                    <div class="gap-2" role="button" id="triggerCategory" data-bs-toggle="collapse"
                         data-bs-target="#collapseCategory">
                        <div class="d-flex align-items-center gap-2">
                            <div class="custom-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-chevron-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                          d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-chevron-down hide" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                          d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708"/>
                                </svg>
                            </div>
                            <h5 class="m-0 lh-sm">Danh Mục</h5>
                        </div>
                    </div>
                    <div class="collapse" id="collapseCategory">
                        <hr>
                        <ul class="category-list row list-unstyled mb-2 ms-3 gy-2">
                            <li class="category-item col-4 active"><a href="#" class="text-decoration-none">Ví
                                nam</a></li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Ví nữ</a></li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Túi xách
                                nam</a></li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Túi xách nữ</a>
                            </li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Túi đeo
                                chéo</a></li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Balo</a></li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Vali</a></li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Thắt lưng</a>
                            </li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Áo khoác</a>
                            </li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Giày tây</a>
                            </li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Giày cao
                                gót</a></li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Phụ kiện</a>
                            </li>
                            <li class="category-item col-4"><a href="#" class="text-decoration-none">Danh mục
                                khác</a></li>


                        </ul>
                    </div>
                </div>
                <!-- Muc gia -->
                <div class="ms-1 ms-lg-0 bg-secondary-subtle p-3">
                    <div class="gap-2" role="button" id="triggerPriceRange" data-bs-toggle="collapse"
                         data-bs-target="#collapsePriceRange">
                        <div class="d-flex align-items-center gap-2">
                            <div class="custom-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-chevron-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                          d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-chevron-down hide" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                          d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708"/>
                                </svg>
                            </div>
                            <h5 class="m-0 lh-sm">Mức Giá</h5>
                        </div>
                    </div>
                    <form class="collapse" id="collapsePriceRange">
                        <hr>
                        <div class="d-flex gap-1">
                            <div class="col">
                                <div class="form-check">
                                    <input id="filter-tat-ca" class="form-check-input" type="checkbox" checked>
                                    <label for="filter-tat-ca" class="form-check-label">Tất cả</label>
                                </div>
                                <div class="form-check">
                                    <input id="filter-duoi-500k" class="form-check-input" type="checkbox">
                                    <label for="filter-duoi-500k" class="form-check-label">Dưới 500.000₫</label>
                                </div>
                                <div class="form-check">
                                    <input id="filter-500k-1tr500" class="form-check-input" type="checkbox">
                                    <label for="filter-500k-1tr500" class="form-check-label">500.000₫ -
                                        1.500.000₫</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-check">
                                    <input id="filter-1tr500-3tr" class="form-check-input" type="checkbox">
                                    <label for="filter-1tr500-3tr" class="form-check-label">1.500.000₫ -
                                        3.000.000₫</label>
                                </div>
                                <div class="form-check">
                                    <input id="filter-3tr-5tr" class="form-check-input" type="checkbox">
                                    <label for="filter-3tr-5tr" class="form-check-label">3.000.000₫ -
                                        5.000.000₫</label>
                                </div>
                                <div class="form-check">
                                    <input id="filter-tren-5tr" class="form-check-input" type="checkbox">
                                    <label for="filter-tren-5tr" class="form-check-label">Trên 5.000.000₫</label>
                                </div>
                            </div>
                        </div>
                        <button class="btn custom-btn-primary rounded-0 w-100 text-uppercase mt-3">Áp dụng</button>
                    </form>
                </div>
            </div>

            <!-- Products Container -->
            <div class="col-12 mt-4">
                <!-- Sort bar -->
                <div class="d-flex align-items-center p-4 mb-2 bg-secondary-subtle" style="height: 50px;">
                    <span class="me-3 fw-semibold">Sắp Xếp Theo</span>
                    <div class="d-flex gap-3">
                        <button class="btn custom-btn-primary">Mặc định</button>
                        <button class="btn custom-btn-primary bg-white text-black">Mới Nhất</button>
                        <button class="btn custom-btn-primary bg-white text-black">Bán Chạy</button>
                    </div>
                    <div class="dropdown ms-3">
                        <button class="btn bg-white dropdown-toggle" type="button" id="dropdownMenuButton"
                                data-bs-toggle="dropdown" aria-expanded="false">
                            Giá
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <li><a class="dropdown-item" href="#">Giá: Tăng Dần</a></li>
                            <li><a class="dropdown-item" href="#">Giá: Giảm Dần</a></li>
                        </ul>
                    </div>
                </div>

                <!-- Product list -->
                <ul id="products-list" class="list-unstyled row">
                    <li class="p-2">
                        <a class="product_card_template" href="product-details.html"
                           data-json='{
                                "img": "https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-3.jpg",
                                "name": "Ví gấp nam da cá sấu V7068",
                                "price": "1.100.000",
                                "basePrice": "1.500.000",
                                "discount": "Giảm 27%",
                                "badge": "NEW"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://www.gento.vn/wp-content/uploads/2024/06/tui-cam-tay-da-bo3.jpg"
                           data-json='{
                                "img": "https://www.gento.vn/wp-content/uploads/2024/06/tui-cam-tay-da-bo3.jpg",
                                "name": "Ví cầm tay nam da bò dập vân cá sấu V7065",
                                "price": "1.350.000",
                                "basePrice": "1.700.000",
                                "discount": "Giảm 21%",
                                "badge": "NEW"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://www.gento.vn/wp-content/uploads/2021/10/vi-cam-tay-da-ca-sau-gs9825.jpeg"
                           data-json='{
                                "img": "https://www.gento.vn/wp-content/uploads/2021/10/vi-cam-tay-da-ca-sau-gs9825.jpeg",
                                "name": "Ví cầm tay da cá sấu cao cấp GS982 Nâu",
                                "price": "1.300.000",
                                "basePrice": "1.900.000",
                                "discount": "Giảm 32%",
                                "badge": "NEW"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://www.gento.vn/wp-content/uploads/2023/11/vi-da-ca-sau-nam-cao-cap10.jpg"
                           data-json='{
                                "img": "https://www.gento.vn/wp-content/uploads/2023/11/vi-da-ca-sau-nam-cao-cap10.jpg",
                                "name": "Ví cầm tay nam da cá sấu cao cấp Gento GS985",
                                "price": "1.950.000",
                                "basePrice": "2.350.000",
                                "discount": "Giảm 17%",
                                "badge": "NEW"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://tamanh.net/wp-content/uploads/2020/01/vi-da-hong-ca-sau-VTA1500N-H-D-1.jpg"
                           data-json='{
                                "img": "https://tamanh.net/wp-content/uploads/2020/01/vi-da-hong-ca-sau-VTA1500N-H-D-1.jpg",
                                "name": "Ví da cá sấu 2 mặt dáng ngang da hông cao cấp VTA1500N-H-D",
                                "price": "1.550.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://casauhoanglong.com/wp-content/uploads/2024/01/Bop-da-ca-sau-nam-2-mat-da-bung-VN70HM.jpeg"
                           data-json='{
                                "img": "https://casauhoanglong.com/wp-content/uploads/2024/01/Bop-da-ca-sau-nam-2-mat-da-bung-VN70HM.jpeg",
                                "name": "Bóp da cá sấu nam 2 mặt da bụng VN70HM",
                                "price": "1.100.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://casauhoanglong.com/wp-content/uploads/2023/10/vi-da-ca-sau-VNA201-2-600x820.jpg"
                           data-json='{
                                "img": "https://casauhoanglong.com/wp-content/uploads/2023/10/vi-da-ca-sau-VNA201-2-600x820.jpg",
                                "name": "Ví nam da cá sấu vân bụng màu đen – VN42",
                                "price": "900.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://lavatino.com/wp-content/uploads/2019/10/DSC03477.jpg"
                           data-json='{
                                "img": "https://lavatino.com/wp-content/uploads/2019/10/DSC03477.jpg",
                                "name": "Ví Dài Cá Sấu Vân Bụng 1 Mặt",
                                "price": "1.900.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://lavatino.com/wp-content/uploads/2019/10/DSC02914-1000x1000-1.jpg"
                           data-json='{
                                "img": "https://lavatino.com/wp-content/uploads/2019/10/DSC02914-1000x1000-1.jpg",
                                "name": "Ví ngang cá sấu WSO vân bụng",
                                "price": "1.100.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://lavatino.com/wp-content/uploads/2022/01/KEYL3389-copy-1000x1000-1.jpg"
                           data-json='{
                                "img": "https://lavatino.com/wp-content/uploads/2022/01/KEYL3389-copy-1000x1000-1.jpg",
                                "name": "Ví ngang cá sấu WST vân chân",
                                "price": "1.550.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://lavatino.com/wp-content/uploads/2022/01/KEYL3431-copy-1000x1000-1.jpg"
                           data-json='{
                                "img": "https://lavatino.com/wp-content/uploads/2022/01/KEYL3431-copy-1000x1000-1.jpg",
                                "name": "Ví đứng cá sấu WST vân gù",
                                "price": "1.750.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://lavatino.com/wp-content/uploads/2021/07/vi-dai-nam-da-ca-sau-wls04-chinh-hang-8186-2.jpg"
                           data-json='{
                                "img": "https://lavatino.com/wp-content/uploads/2021/07/vi-dai-nam-da-ca-sau-wls04-chinh-hang-8186-2.jpg",
                                "name": "Ví đứng cá sấu WST vân gù",
                                "price": "3.200.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://lavatino.com/wp-content/uploads/2023/07/vi-dai-da-ca-sau-chinh-hang-lavatino-21-595x595.jpg"
                           data-json='{
                                "img": "https://lavatino.com/wp-content/uploads/2023/07/vi-dai-da-ca-sau-chinh-hang-lavatino-21-595x595.jpg",
                                "name": "Ví dài NOMENT ZPM da cá sấu vân bụng",
                                "price": "1.800.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://lavatino.com/wp-content/uploads/2023/10/cls24-595x595.jpg"
                           data-json='{
                                "img": "https://lavatino.com/wp-content/uploads/2023/10/cls24-595x595.jpg",
                                "name": "Ví nam cầm tay CLUTCH VICTOR da cá sấu chính hãng Lavatino [CLS24]",
                                "price": "4.500.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://lavatino.com/wp-content/uploads/2022/01/KEYL3453-1000x1000-1.jpg"
                           data-json='{
                                "img": "https://lavatino.com/wp-content/uploads/2022/01/KEYL3453-1000x1000-1.jpg",
                                "name": "Ví đứng cá sấu WSO vân chân",
                                "price": "1.100.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://lavatino.com/wp-content/uploads/2022/01/KEYL3463-copy-1000x1000-1.jpg"
                           data-json='{
                                "img": "https://lavatino.com/wp-content/uploads/2022/01/KEYL3463-copy-1000x1000-1.jpg",
                                "name": "Ví đứng cá sấu WSO vân đuôi",
                                "price": "1.100.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://www.leonardo.vn/cdn/shop/products/vi-ca-s-u-wallet-leonardo-11680430686313_600x.jpg?v=1622190323"
                           data-json='{
                                "img": "https://www.leonardo.vn/cdn/shop/products/vi-ca-s-u-wallet-leonardo-11680430686313_600x.jpg?v=1622190323",
                                "name": "Ví ngắn da cá sấu cao cấp sang trọng VN707",
                                "price": "2.200.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://tamanh.net/wp-content/uploads/2020/07/bop-da-ca-sau-VTA1500D-H-ND-1.jpg"
                           data-json='{
                                "img": "https://tamanh.net/wp-content/uploads/2020/07/bop-da-ca-sau-VTA1500D-H-ND-1.jpg",
                                "name": "Ví nam da cá sấu 2 mặt dáng đứng da hông thời trang VTA1500D-H-ND",
                                "price": "1.500.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://tamanh.net/wp-content/uploads/2020/01/vi-da-hong-ca-sau-VTA990N-H-ND-5.jpg"
                           data-json='{
                                "img": "https://tamanh.net/wp-content/uploads/2020/01/vi-da-hong-ca-sau-VTA990N-H-ND-5.jpg",
                                "name": "Ví da nam cá sấu 1 mặt dáng ngang da hông đẹp VTA990N-H-ND",
                                "price": "1.500.000"
                                }'>
                        </a>
                    </li>

                    <li class="p-2">
                        <a class="product_card_template"
                           href="https://tamanh.net/wp-content/uploads/2015/11/vi-da-duoi-ca-sau-VTA790N-D-ND-1.jpg"
                           data-json='{
                                "img": "https://tamanh.net/wp-content/uploads/2015/11/vi-da-duoi-ca-sau-VTA790N-D-ND-1.jpg",
                                "name": "Ví da cá sấu 1 mặt dáng ngang da đuôi lịch lãm VTA790N-D-ND",
                                "price": "790.000"
                                }'>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Pagination-->
    <div class="container">
        <ul class="pagination pagination-lg justify-content-center m-5">
            <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">></a></li>
        </ul>
    </div>
</div>