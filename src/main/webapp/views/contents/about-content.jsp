<%@ page import="vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="homeUrl" value="<%= UrlProperties.home()%>"/>

    <div id="CONTENT">
        <!-- Breadcrumb Navigation-->
        <div class="container">
            <nav style="--bs-breadcrumb-divider: '>'">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${homeUrl}">Trang Chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Giới Thiệu</li>
                </ol>
            </nav>
            <hr>
        </div>

        <div class="container py-5">
            <h2 class="custom-text-primary-lighter fw-bold">Giới Thiệu</h2>
            <div class="row">
                <div class="col-2">
                    <div class="nav flex-column nav-pills me-3 gap-2" id="v-pills-tab" role="tablist">
                        <button class="nav-link active" data-bs-toggle="pill"
                                data-bs-target="#tab-1" type="button" role="tab">1947
                        </button>
                        <button class="nav-link" data-bs-toggle="pill"
                                data-bs-target="#tab-2" type="button" role="tab">1949 - 1996
                        </button>
                        <button class="nav-link" data-bs-toggle="pill"
                                data-bs-target="#tab-3" type="button" role="tab">2000 - Nay
                        </button>
                    </div>
                </div>
                <div class="col">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade show active" id="tab-1" role="tabpanel" tabindex="0">
                            <div class="row">
                                <div class="col-8">
                                    <p class="lh-lg " style="text-align: justify">
                                        Thương hiệu “Crocodile” được thành lập tại Singapore vào năm 1947, chuyên kinh
                                        doanh
                                        các
                                        sản phẩm
                                        làm từ da cá sấu cao cấp. Ban đầu, thương hiệu khởi nguồn từ việc sản xuất các
                                        sản
                                        phẩm
                                        từ da thuộc
                                        và không ngừng phát triển để trở thành biểu tượng của phong cách sống sang
                                        trọng,
                                        đẳng
                                        cấp quốc tế.
                                        Người sáng lập, Dato' Dr. Tan Hian Tsin, đã chọn hình ảnh cá sấu – một loài động
                                        vật
                                        mạnh mẽ, bền bỉ
                                        với làn da quý hiếm – làm biểu tượng cho thương hiệu. Ông tin rằng các phẩm chất
                                        độc
                                        đáo
                                        này tượng
                                        trưng cho cam kết của mình trong việc cung cấp những sản phẩm da cá sấu chất
                                        lượng
                                        vượt
                                        trội, tinh
                                        tế và trường tồn với thời gian. Để nhấn mạnh sự liên kết với loài vật này, ông
                                        thậm
                                        chí
                                        từng sử dụng
                                        cá sấu sống trong các hoạt động quảng bá, khiến hình ảnh cá sấu trở thành biểu
                                        tượng
                                        đặc
                                        trưng và
                                        niềm tự hào của thương hiệu.
                                    </p>
                                </div>
                                <div class="col-4">
                                    <img src="https://www.crocodileinternational.com/modules/jscomposer/uploads/1947_Tab.jpg"
                                         alt="" class="w-100">
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab-2" role="tabpanel" tabindex="0">
                            <div id="1949">
                                <h5 class="custom-text-primary">1949</h5>
                                <div class="row">
                                    <div class="col-3">
                                        <img src="https://www.crocodileinternational.com/modules/jscomposer/uploads/1949_Tab.jpg"
                                             alt="" class="w-100">
                                    </div>
                                    <p class="col">
                                        Crocodile mở rộng sang khu vực Đông Nam Á, cụ thể là Malaysia, Brunei, Indonesia
                                        và Thái Lan.
                                        Dato Tiến sĩ Tan tặng quà cho Tổng thống Indonesia khi đó (Tổng thống Sukarno).
                                    </p>
                                </div>
                                <hr>
                            </div>
                            <div id="1953">
                                <h5 class="custom-text-primary">1953</h5>
                                <div class="row">
                                    <div class="col-3">
                                        <img src="https://www.crocodileinternational.com/modules/jscomposer/uploads/1953_Tab.jpg"
                                             alt="" class="w-100">
                                    </div>
                                    <p class="col">
                                        Crocodile được mở rộng sang HongKong.
                                    </p>
                                </div>
                                <hr>
                            </div>
                            <div id="1960">
                                <h5 class="custom-text-primary">1960</h5>
                                <div class="row">
                                    <div class="col-3">
                                        <img src="https://www.crocodileinternational.com/modules/jscomposer/uploads/1960_Tab_R.jpg"
                                             alt="" class="w-100">
                                    </div>
                                    <p class="col">
                                        Tiến sĩ Tan gặp Tổng thống đầu tiên của Singapore, ông Yusoff Ishak, tại dinh
                                        thự của Tổng thống.
                                    </p>
                                </div>
                                <hr>
                            </div>
                            <div id="1996">
                                <h5 class="custom-text-primary">1996</h5>
                                <div class="row">
                                    <div class="col-3">
                                        <img src="https://www.crocodileinternational.com/modules/jscomposer/uploads/1996_Tab-1.jpg"
                                             alt="" class="w-100">
                                    </div>
                                    <p class="col">
                                        Crocodile tiến vào thị tường Ấn Độ.
                                    </p>
                                </div>
                                <hr>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab-3" role="tabpanel" tabindex="0">
                            <div id="2004">
                                <h5 class="custom-text-primary">2004</h5>
                                <div class="row">
                                    <div class="col-3">
                                        <img src="https://www.crocodileinternational.com/modules/jscomposer/uploads/2004_Tab.jpg"
                                             alt="" class="w-100">
                                    </div>
                                    <p class="col">
                                        Crocodile tặng một tàu y tế phục vụ người nghèo và người khó khăn ở
                                        Bangladesh. </p>
                                </div>
                                <hr>
                            </div>
                            <div id="2009">
                                <h5 class="custom-text-primary">2009</h5>
                                <div class="row">
                                    <div class="col-3">
                                        <img src="https://www.crocodileinternational.com/modules/jscomposer/uploads/2009_Tab.jpg"
                                             alt="" class="w-100">
                                    </div>
                                    <p class="col">
                                        Crocodile tài trợ cho tác phẩm nghệ thuật lớn nhất thế giới tại Malaysia – tác
                                        phẩm này đã được ghi vào Kỷ lục Thế giới Guinness. </p>
                                </div>
                                <hr>
                            </div>
                            <div id="2015">
                                <h5 class="custom-text-primary">2015</h5>
                                <div class="row">
                                    <div class="col-3">
                                        <img src="https://www.crocodileinternational.com/modules/jscomposer/uploads/2015_Tab-1.jpg"
                                             alt="" class="w-100">
                                    </div>
                                    <p class="col">
                                        Người chiến thắng Cuộc thi Thương hiệu SG50 của IPOS.
                                    </p>
                                </div>
                                <hr>
                            </div>
                            <div id="2019">
                                <h5 class="custom-text-primary">2019</h5>
                                <div class="row">
                                    <div class="col-3">
                                        <img src="https://www.crocodileinternational.com/modules/jscomposer/uploads/2019_Tab.jpg"
                                             alt="" class="w-100">
                                    </div>
                                    <p class="col">
                                        Crocodile Ấn Độ đã được trao giải Thương hiệu Được Tin Cậy Nhất Ấn Độ.
                                    </p>
                                </div>
                                <hr>
                            </div>
                            <div id="2024">
                                <h5 class="custom-text-primary">2024</h5>
                                <div class="row">
                                    <div class="col-3">
                                        <img src="https://cdn-media.sforum.vn/storage/app/media/ctv_seo3/hoc-phi-dai-hoc-nong-lam-1.jpg"
                                             alt="" class="w-100">
                                    </div>
                                    <p class="col">
                                        Crocodile mở rộng sang thị trường Việt Nam.
                                    </p>
                                </div>
                                <hr>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>