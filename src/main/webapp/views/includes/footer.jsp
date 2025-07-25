<%@ page import="vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:url var="homeUrl" value="<%= UrlProperties.home() %>"/>
<!-- HTML -->
<footer class="custom-bg-primary pb-5">
    <!--Style-->
    <style>
        :root {
            --icon-color: white;
        }

        .logo {
            width: 250px;
            height: auto;
            padding: 50px 0 20px;
        }

        ul {
            list-style-type: none;
            padding-left: 0;
            margin-bottom: 3rem;
        }


        .social-icon {
            color: white;
            padding: 5px 10px 0;
            cursor: pointer;
        }

        .widget-title {
            font-size: 18px;
            text-transform: uppercase;
            font-weight: 700;
            letter-spacing: 2px;
            margin-bottom: 25px;
            padding-bottom: 4px;
        }

        .widget-text {
            font-size: 16px;
            text-decoration: none;
            color: white;

            &:hover {
                text-decoration: underline;
            }
        }

        .title {
            font-size: 21px;
            line-height: 20px;
            color: white;
            word-spacing: 7px;
            letter-spacing: 2px;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .sub-title {
            font-size: 16px;
            color: white;
            line-height: 1.8;
            margin-bottom: 20px;
        }

        .info {
            font-size: 18px;
            line-height: 20px;
            color: white;
            font-weight: 700;
        }

        .information a {
            line-height: 1.8;
        }
    </style>

    <div class="container">

        <!-- LOGO  -->
        <p class="text-center">
            <a href="${homeUrl}">
                <img class="logo" src="https://www.crocodileinternational.com/themes/crocs_child/assets/img/logo.svg"
                     alt="">
            </a>
        </p>

        <!-- SOCIAL MEDIA  -->
        <ul class="social-media d-flex justify-content-center">
            <li class="social-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor"
                     class="bi bi-facebook" viewBox="0 0 16 16">
                    <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"></path>
                </svg>
            </li>

            <li class="social-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-twitter"
                     viewBox="0 0 16 16">
                    <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334q.002-.211-.006-.422A6.7 6.7 0 0 0 16 3.542a6.7 6.7 0 0 1-1.889.518 3.3 3.3 0 0 0 1.447-1.817 6.5 6.5 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.32 9.32 0 0 1-6.767-3.429 3.29 3.29 0 0 0 1.018 4.382A3.3 3.3 0 0 1 .64 6.575v.045a3.29 3.29 0 0 0 2.632 3.218 3.2 3.2 0 0 1-.865.115 3 3 0 0 1-.614-.057 3.28 3.28 0 0 0 3.067 2.277A6.6 6.6 0 0 1 .78 13.58a6 6 0 0 1-.78-.045A9.34 9.34 0 0 0 5.026 15"></path>
                </svg>
            </li>

            <li class="social-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor"
                     class="bi bi-instagram" viewBox="0 0 16 16">
                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.9 3.9 0 0 0-1.417.923A3.9 3.9 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.9 3.9 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.9 3.9 0 0 0-.923-1.417A3.9 3.9 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599s.453.546.598.92c.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.5 2.5 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.5 2.5 0 0 1-.92-.598 2.5 2.5 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233s.008-2.388.046-3.231c.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92s.546-.453.92-.598c.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92m-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217m0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334"></path>
                </svg>
            </li>

            <li class="social-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-youtube"
                     viewBox="0 0 16 16">
                    <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.01 2.01 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.01 2.01 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31 31 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.01 2.01 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A100 100 0 0 1 7.858 2zM6.4 5.209v4.818l4.157-2.408z"></path>
                </svg>
            </li>

            <li class="social-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor"
                     class="bi bi-pinterest" viewBox="0 0 16 16">
                    <path d="M8 0a8 8 0 0 0-2.915 15.452c-.07-.633-.134-1.606.027-2.297.146-.625.938-3.977.938-3.977s-.239-.479-.239-1.187c0-1.113.645-1.943 1.448-1.943.682 0 1.012.512 1.012 1.127 0 .686-.437 1.712-.663 2.663-.188.796.4 1.446 1.185 1.446 1.422 0 2.515-1.5 2.515-3.664 0-1.915-1.377-3.254-3.342-3.254-2.276 0-3.612 1.707-3.612 3.471 0 .688.265 1.425.595 1.826a.24.24 0 0 1 .056.23c-.061.252-.196.796-.222.907-.035.146-.116.177-.268.107-1-.465-1.624-1.926-1.624-3.1 0-2.523 1.834-4.84 5.286-4.84 2.775 0 4.932 1.977 4.932 4.62 0 2.757-1.739 4.976-4.151 4.976-.811 0-1.573-.421-1.834-.919l-.498 1.902c-.181.695-.669 1.566-.995 2.097A8 8 0 1 0 8 0"></path>
                </svg>
            </li>

            <li class="social-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor"
                     class="bi bi-linkedin" viewBox="0 0 16 16">
                    <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854zm4.943 12.248V6.169H2.542v7.225zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248S2.4 3.226 2.4 3.934c0 .694.521 1.248 1.327 1.248zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016l.016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225z"></path>
                </svg>
            </li>
        </ul>
        <!-- END SOCIAL MEDIA  -->

        <div class="row text-white">
            <div class="col-2">
                <h5 class="widget-title">Thông tin</h5>
                <div class="text">
                    <ul class="menu">
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Liên hệ</a>
                        </li>
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Về chúng tôi</a>
                        </li>
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Khuyến mãi</a>
                        </li>
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Sản xuất đồ da</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-2">
                <h5 class="widget-title">Hỗ trợ</h5>
                <div class="text">
                    <ul class="menu">
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Các câu hỏi</a>
                        </li>
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Tin tức</a>
                        </li>
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Tuyển dụng</a>
                        </li>

                    </ul>
                </div>
            </div>

            <div class="col-2">
                <h5 class="widget-title">Chính sách</h5>
                <div class="text">
                    <ul class="menu">
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Chính sách bảo mật</a>
                        </li>
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Đổi trả và bảo hành</a>
                        </li>
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Chính sách vận chuyển</a>
                        </li>
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Hướng dẫn mua hàng</a>
                        </li>
                        <li style="margin-bottom: 15px;">
                            <a class="widget-text" href="#">Hướng dẫn thanh toán</a>
                        </li>

                    </ul>
                </div>
            </div>

            <div class="information col-6">
                <h4 class="title">CÔNG TY TNHH Crocodile</h4>
                <p class="sub-title">
                    Crocodile không ngừng sáng tạo để khẳng định thương hiệu trong thế giới đồ da.
                    Sứ mệnh của chúng tôi là tạo ra những sản phẩm đạt tiêu chuẩn chất lượng cao
                    và phổ cập đồ da đến với đông đảo người tiêu dùng Việt Nam.
                </p>

                <h2 class="info">CROCODILE PREMIUM LEATHER</h2>
                <div class="">
                    <svg style="color: var(--icon-color);" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                         fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
                        <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4z"></path>
                    </svg>
                    <a class="widget-text mb-2" href="https://g.page/r/CfxxO7bL0a1FEBA">
                        <strong>CROCODILE Phú Nhuận:</strong>
                        27 Phan Đình Phùng, P.17, Q.Phú Nhuận, Tp HCM
                        <strong style="font-size: 14px; color: var(--icon-color);">(Ngay chân cầu kiệu)</strong>
                    </a>
                </div>

                <div class="">
                    <svg style="color: var(--icon-color);" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                         fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
                        <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4z"></path>
                    </svg>
                    <a class="widget-text mb-2" href="https://g.page/r/CfxxO7bL0a1FEBA">
                        <strong>Xưởng sản xuất:</strong>
                        53 Phan Đình Phùng, P. Tân Thành, Quận Tân Phú, Tp HCM
                    </a>
                </div>

                <div class="">
                    <svg style="color: var(--icon-color);" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                         fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                        <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"></path>
                    </svg>
                    <strong>Điện thoại:</strong>
                    <a class="widget-text" href="">082 878 6789</a>
                    -
                    <a class="widget-text" href="">0901 828 898</a>

                </div>

                <div class="">
                    <svg style="color: var(--icon-color);" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                         fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                        <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741M1 11.105l4.708-2.897L1 5.383z"></path>
                    </svg>
                    <a class="widget-text mb-2" href="https://g.page/r/CfxxO7bL0a1FEBA">
                        <strong>Email:</strong>
                        info@CROCODILEvietnam.com
                    </a>
                </div>
            </div>
        </div>
    </div>
</footer>
