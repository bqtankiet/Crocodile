<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="home-content">
    <style>
        #my-carousel .carousel-item img {
            height: calc(100vh - 50px);
            object-fit: cover;
        }

        #my-carousel .carousel-caption {
            background-image: linear-gradient(to bottom, transparent, black);
        }
    </style>

    <!-------------------- Carousel -------------------->
    <div class="row m-0">
        <div id="my-carousel" class="carousel slide px-0" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <c:forEach var="i" begin="0" end="${fn:length(requestScope.carousels)-1}">
                    <button type="button" data-bs-target="#my-carousel" data-bs-slide-to="${i}"
                            class="<c:if test="${i == 0}">active</c:if>">
                    </button>
                </c:forEach>
            </div>
            <div class="carousel-inner">
                <c:forEach var="carousel" items="${requestScope.carousels}" varStatus="status">
                    <div class="carousel-item <c:if test="${status.first}">active</c:if>">
                        <img src="<c:url value="${carousel.image}"/>"
                             class="d-block w-100" alt="">
                        <div class="carousel-caption d-block start-0 bottom-0 w-100 px-5 text-start">
                            <div class="row">
                                <div class="col d-flex flex-column justify-content-end" style="height: 20rem">
                                    <h4 class="fw-semibold text-capitalize">${carousel.title}</h4>
                                    <p class="fw-light">${carousel.description}</p>
                                </div>
                                <div class="col-2 d-flex mt-auto mb-3 z-3">
                                    <a class="btn btn-outline-light ms-auto" role="link" href="${carousel.link}">Xem
                                        thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#my-carousel"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#my-carousel"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <!-- -------------------------BEGIN SERVICE---------------------------------- -->
    <div class="service bg-black">
        <div class="container">
            <div class="row service-box">
                <!-- Giao hàng  -->
                <div class="col-3 serv">
                    <div class="list-icon fas fa-shipping-fast"></div>
                    <div class="list-content">
                        <span>Giao hàng miễn phí</span>
                        <p>Với hóa đơn trên 690k</p>
                    </div>
                </div>

                <!-- Bảo hành  -->
                <div class="col-3 serv">
                    <div class="list-icon fas fa-award"></div>
                    <div class="list-content">
                        <span>Bảo hành 36 tháng</span>
                        <p>Theo chính sách của Crocodile</p>
                    </div>
                </div>

                <!-- Chính hãng  -->
                <div class="col-3 serv">
                    <div class="list-icon fas fa-shield-alt"></div>
                    <div class="list-content">
                        <span>Cam kết da thật 100%</span>
                        <p>Cam kết chất liệu da thật</p>
                    </div>
                </div>

                <!-- Đổi trả  -->
                <div class="col-3 serv">
                    <div class="list-icon fas fa-money-check"></div>
                    <div class="list-content">
                        <span>Đổi trả trong 7 ngày</span>
                        <p>Đổi mới với lỗi từ nhà sản xuất</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- -------------------------END SERVICE BOX---------------------------------- -->

    <div class="brand-introduction py-3">
        <div class="container shadow-lg py-5 my-5 bg-dark-subtle">
            <h1 class="product-category-title pb-3" style="letter-spacing: 0.5rem">CROCODILE</h1>
            <p class="product-category-subtitle" style="color: saddlebrown;">Sang trọng – Mạnh mẽ – Khí chất</p>
            <p class="product-category-description px-5 ">
                Thương hiệu “Crocodile” được thành lập tại Singapore vào năm 1947, chuyên kinh doanh các sản phẩm
                làm từ da cá sấu cao cấp. Ban đầu, thương hiệu khởi nguồn từ việc sản xuất các sản phẩm từ da thuộc
                và không ngừng phát triển để trở thành biểu tượng của phong cách sống sang trọng, đẳng cấp quốc tế.
                Người sáng lập, Dato' Dr. Tan Hian Tsin, đã chọn hình ảnh cá sấu – một loài động vật mạnh mẽ, bền bỉ
                với làn da quý hiếm – làm biểu tượng cho thương hiệu. Ông tin rằng các phẩm chất độc đáo này tượng
                trưng cho cam kết của mình trong việc cung cấp những sản phẩm da cá sấu chất lượng vượt trội, tinh
                tế và trường tồn với thời gian. Để nhấn mạnh sự liên kết với loài vật này, ông thậm chí từng sử dụng
                cá sấu sống trong các hoạt động quảng bá, khiến hình ảnh cá sấu trở thành biểu tượng đặc trưng và
                niềm tự hào của thương hiệu.
            </p>
        </div>
    </div>

    <!-- -------------------------BEGIN CATEGORY---------------------------------- -->
    <div class="product-category custom-bg-primary-darker ">
        <div class="product-category-box py-5">
            <div class="container">
                <h2 class="text-white text-center fw-bold text-uppercase">Danh Mục Nổi Bật</h2>

                <div class="menu-box d-flex justify-content-center flex-wrap py-3 gap-2">
                    <c:forEach var="category" items="${applicationScope.categories}">
                        <div class="item_menu">
                            <c:url var="categoryUrl" value="${applicationScope.url['url.category']}">
                                <c:param name="id" value="${category.id}"/>
                            </c:url>
                            <a href="${categoryUrl}">
                                <img src="<c:url value="${category.image}"/>" alt="img">
                                <p class="pt-1">${category.name}</p>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <!-- -------------------------END CATEGORY---------------------------------- -->

    <!-- -------------------------BEGIN BEST SALE PRODUCTS---------------------------------- -->
    <div class="best-sale-product py-5">
        <div class="container">
            <div class="section-title pb-3">
                <h1 class="best-sale-title fw-bold ">Sản phẩm bán chạy</h1>
                <p class="text-center">#Top sản phẩm mua nhiều nhất trong tháng</p>
                <hr>
            </div>
            <%--       TODO:          --%>

            <%--                <div class="product_gallery_template" data-owl-main='{"items": 4, "margin": 10, "dots": false}'>--%>
            <%--                    <a class="product_card_template"--%>
            <%--                       href="https://www.gento.vn/wp-content/uploads/2021/10/vi-cam-tay-da-ca-sau-gs9825.jpeg"--%>
            <%--                       data-json='{--%>
            <%--                                "img": "https://www.gento.vn/wp-content/uploads/2021/10/vi-cam-tay-da-ca-sau-gs9825.jpeg",--%>
            <%--                                "name": "Ví cầm tay da cá sấu cao cấp GS982 Nâu",--%>
            <%--                                "price": "1.300.000",--%>
            <%--                                "basePrice": "1.900.000",--%>
            <%--                                "discount": "Giảm 32%",--%>
            <%--                                "badge": "NEW"--%>
            <%--                                }'>--%>
            <%--                    </a>--%>
            <%--                    <a class="product_card_template" href="404"--%>
            <%--                       data-json='{--%>
            <%--                                "img":"https://casauhoanglong.com/wp-content/uploads/2024/01/Bop-da-ca-sau-nam-2-mat-da-bung-VN70HM.jpeg",--%>
            <%--                                "name":"Ví cầm tay nam da cá sấu cao cấp Gento GS985",--%>
            <%--                                "price":"1.100.000",--%>
            <%--                                "basePrice":null,--%>
            <%--                                "discount":null,--%>
            <%--                                "badge":null--%>
            <%--                                }'>--%>
            <%--                    </a>--%>
            <%--                    <a class="product_card_template"--%>
            <%--                       href="404"--%>
            <%--                       data-json='{--%>
            <%--                                "img": "https://lavatino.com/wp-content/uploads/2021/08/tui-da-nu-cao-cap-hsf30-da-ca-sau-4.jpg",--%>
            <%--                                "name": "Túi xách nữ cao cấp HSF30 da cá sấu thật",--%>
            <%--                                "price": "14.200.000"--%>
            <%--                                }'>--%>
            <%--                    </a>--%>
            <%--                    <a class="product_card_template" href="404"--%>
            <%--                       data-json='{--%>
            <%--                                "img":"https://lavatino.com/wp-content/uploads/2021/08/tui-xach-nu-thoi-trang-da-ca-sau-hsf21-2-1.jpg",--%>
            <%--                                "name":"Túi xách nữ thời trang da cá sấu mã HSF21",--%>
            <%--                                "price":"12 .100.000",--%>
            <%--                                "basePrice":null,--%>
            <%--                                "discount":null,--%>
            <%--                                "badge":null--%>
            <%--                                }'>--%>
            <%--                    </a>--%>

            <%--                </div>--%>
        </div>
    </div>
    <!-- -------------------------END BEST SALE PRODUCTS---------------------------------- -->

    <!-- -------------------------BEGIN SUGGESTED PRODUCTS---------------------------------- -->
    <div class="suggested-products py-5">
        <div class="container border border-3 custom-border-primary-darker">
            <div class="section-title py-2 mb-2 custom-bg-primary-darker text-white row">
                <h2 class="best-sale-title fw-bold ">Sản phẩm nổi bật</h2>
                <p class="text-center">#Top sản phẩm được yêu thích nhất theo danh mục</p>
            </div>

            <div class="d-flex flex-column gap-4">
                <%--        TODO:             --%>

                <%--                    <div class="product-group p-3">--%>
                <%--                        <div class="product-group-title d-flex mb-2--%>
                <%--                             border-bottom border-2 custom-border-primary-darker">--%>
                <%--                            <h1 class="custom-bg-primary-darker text-white fw-bold m-0 px-2">#1</h1>--%>
                <%--                            <h3 class="fw-semibold custom-bg-primary text-white py-2 px-3 m-0 ">Túi xách nữ</h3>--%>
                <%--                            <a href="404" class="ms-auto my-auto">Xem thêm </a>--%>
                <%--                        </div>--%>
                <%--                        <div class="product_gallery_template" data-owl-main='{"items": 4, "margin": 10, "dots": false}'>--%>
                <%--                            <a class="product_card_template"--%>
                <%--                               href="404"--%>
                <%--                               data-json='{--%>
                <%--                                "img": "https://lavatino.com/wp-content/uploads/2021/08/tui-da-nu-cao-cap-hsf30-da-ca-sau-4.jpg",--%>
                <%--                                "name": "Túi xách nữ cao cấp HSF30 da cá sấu thật",--%>
                <%--                                "price": "14.200.000"--%>
                <%--                                }'>--%>
                <%--                            </a>--%>
                <%--                            <a class="product_card_template"--%>
                <%--                               href="404"--%>
                <%--                               data-json='{--%>
                <%--                                "img":"https://lavatino.com/wp-content/uploads/2021/08/tui-xach-nu-thoi-trang-da-ca-sau-hsf21-2-1.jpg",--%>
                <%--                                "name":"Túi xách nữ thời trang da cá sấu mã HSF21",--%>
                <%--                                "price":"12 .100.000",--%>
                <%--                                "basePrice":null,--%>
                <%--                                "discount":null,--%>
                <%--                                "badge":null--%>
                <%--                                }'>--%>
                <%--                            </a>--%>
                <%--                            <a class="product_card_template"--%>
                <%--                               href="404"--%>
                <%--                               data-json='{--%>
                <%--                                "img":"https://lavatino.com/wp-content/uploads/2024/07/HIHI6008-xong-595x595.jpg",--%>
                <%--                                "name":"Túi Xách Nữ Da Cá Sấu Chính Hãng Lavatino",--%>
                <%--                                "price":"15 .100.000",--%>
                <%--                                "basePrice":null,--%>
                <%--                                "discount":null,--%>
                <%--                                "badge":null--%>
                <%--                                }'>--%>
                <%--                            </a>--%>
                <%--                            <a class="product_card_template"--%>
                <%--                               href="404"--%>
                <%--                               data-json='{--%>
                <%--                                "img":"https://lavatino.com/wp-content/uploads/2021/07/tui-nu-da-ca-sau-tron-2.jpg",--%>
                <%--                                "name":"Mẫu túi xách nữ da cá sấu trơn HSF18 thời trang",--%>
                <%--                                "price":"20 .100.000",--%>
                <%--                                "basePrice":null,--%>
                <%--                                "discount":null,--%>
                <%--                                "badge":null--%>
                <%--                                }'>--%>
                <%--                            </a>--%>

                <%--                        </div>--%>
                <%--                    </div>--%>

                <%--                    <div class="product-group p-3">--%>
                <%--                        <div class="product-group-title d-flex mb-2--%>
                <%--                             border-bottom border-2 custom-border-primary-darker">--%>
                <%--                            <h1 class="custom-bg-primary-darker text-white fw-bold m-0 px-2">#2</h1>--%>
                <%--                            <h3 class="fw-semibold custom-bg-primary text-white py-2 px-3 m-0">Giày tây</h3>--%>
                <%--                            <a href="404" class="ms-auto my-auto">Xem thêm </a>--%>
                <%--                        </div>--%>
                <%--                        <div class="product_gallery_template" data-owl-main='{"items": 4, "margin": 10, "dots": false}'>--%>
                <%--                            <a class="product_card_template"--%>
                <%--                               href="404"--%>
                <%--                               data-json='{--%>
                <%--                                "img": "https://crocoleather.com/resources/uploads/images/automatic/gi%C3%A0y_m%E1%BB%8Di_da_c%C3%A1_s%E1%BA%A5u_1.JPG",--%>
                <%--                                "name": "Giày da cá sấu nam GCS57",--%>
                <%--                                "price": "5.300.000",--%>
                <%--                                "basePrice": null,--%>
                <%--                                "discount": null,--%>
                <%--                                "badge": null--%>
                <%--                                }'>--%>
                <%--                            </a>--%>
                <%--                            <a class="product_card_template"--%>
                <%--                               href="404"--%>
                <%--                               data-json='{--%>
                <%--                                "img":"https://crocoleather.com/resources/uploads/images/automatic/giay-da-ca-sau-gcs01-2.jpg",--%>
                <%--                                "name":"Giày lười da cá sấu GCS03",--%>
                <%--                                "price":"4.100.000",--%>
                <%--                                "basePrice":null,--%>
                <%--                                "discount":null,--%>
                <%--                                "badge":null--%>
                <%--                                }'>--%>
                <%--                            </a>--%>
                <%--                            <a class="product_card_template"--%>
                <%--                               href="404"--%>
                <%--                               data-json='{--%>
                <%--                                "img": "https://img.myipadbox.com/upload/store/detail_raw/TBD0382542003A_2.jpg",--%>
                <%--                                "name": "Giày tây sang trọng da cá sấu bóng cho nam",--%>
                <%--                                "price": "9.500.000"--%>
                <%--                                }'>--%>
                <%--                            </a>--%>
                <%--                            <a class="product_card_template"--%>
                <%--                               href="404"--%>
                <%--                               data-json='{--%>
                <%--                                "img":"https://img.myipadbox.com/upload/store/detail_raw/TBD0415456008C_1.jpg",--%>
                <%--                                "name":"Giày công sở nam Giày da cá sấu Sọc mũi nhọn",--%>
                <%--                                "price":"8.990.000",--%>
                <%--                                "basePrice":null,--%>
                <%--                                "discount":null,--%>
                <%--                                "badge":null--%>
                <%--                                }'>--%>
                <%--                            </a>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>

                <%--                    <div class="product-group p-3">--%>
                <%--                        <div class="product-group-title d-flex mb-2--%>
                <%--                             border-bottom border-2 custom-border-primary-darker">--%>
                <%--                            <h1 class="custom-bg-primary-darker text-white fw-bold m-0 px-2">#3</h1>--%>
                <%--                            <h3 class="fw-semibold custom-bg-primary text-white py-2 px-3 m-0">Ví nam</h3>--%>
                <%--                            <a href="404" class="ms-auto my-auto">Xem thêm </a>--%>
                <%--                        </div>--%>
                <%--                        <div class="product_gallery_template" data-owl-main='{"items": 4, "margin": 10, "dots": false}'>--%>
                <%--                            <a class="product_card_template"--%>
                <%--                               href="https://www.gento.vn/wp-content/uploads/2021/10/vi-cam-tay-da-ca-sau-gs9825.jpeg"--%>
                <%--                               data-json='{--%>
                <%--                                "img": "https://www.gento.vn/wp-content/uploads/2021/10/vi-cam-tay-da-ca-sau-gs9825.jpeg",--%>
                <%--                                "name": "Ví cầm tay da cá sấu cao cấp GS982 Nâu",--%>
                <%--                                "price": "1.300.000",--%>
                <%--                                "basePrice": "1.900.000",--%>
                <%--                                "discount": "Giảm 32%",--%>
                <%--                                "badge": "NEW"--%>
                <%--                                }'>--%>
                <%--                            </a>--%>
                <%--                            <a class="product_card_template" href="404"--%>
                <%--                               data-json='{--%>
                <%--                                "img":"https://casauhoanglong.com/wp-content/uploads/2024/01/Bop-da-ca-sau-nam-2-mat-da-bung-VN70HM.jpeg",--%>
                <%--                                "name":"Ví cầm tay nam da cá sấu cao cấp Gento GS985",--%>
                <%--                                "price":"1.100.000",--%>
                <%--                                "basePrice":null,--%>
                <%--                                "discount":null,--%>
                <%--                                "badge":null--%>
                <%--                                }'>--%>
                <%--                            </a>--%>
                <%--                            <a class="product_card_template"--%>
                <%--                               href="https://tamanh.net/wp-content/uploads/2020/01/vi-da-hong-ca-sau-VTA1500N-H-D-1.jpg"--%>
                <%--                               data-json='{--%>
                <%--                                "img": "https://tamanh.net/wp-content/uploads/2020/01/vi-da-hong-ca-sau-VTA1500N-H-D-1.jpg",--%>
                <%--                                "name": "Ví da cá sấu 2 mặt dáng ngang da hông cao cấp VTA1500N-H-D",--%>
                <%--                                "price": "1.550.000"--%>
                <%--                                }'>--%>
                <%--                            </a>--%>
                <%--                            <a class="product_card_template"--%>
                <%--                               href="https://casauhoanglong.com/wp-content/uploads/2023/10/vi-da-ca-sau-VNA201-2-600x820.jpg"--%>
                <%--                               data-json='{--%>
                <%--                                "img": "https://casauhoanglong.com/wp-content/uploads/2023/10/vi-da-ca-sau-VNA201-2-600x820.jpg",--%>
                <%--                                "name": "Ví nam da cá sấu vân bụng màu đen – VN42",--%>
                <%--                                "price": "900.000"--%>
                <%--                                }'>--%>
                <%--                            </a>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
            </div>
        </div>

    </div>
    <!-- -------------------------END SUGGESTED PRODUCTS---------------------------------- -->
</div>
