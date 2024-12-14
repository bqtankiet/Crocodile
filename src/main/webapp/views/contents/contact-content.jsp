<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="CONTENT">
    <style>
        .contact-section {
            position: relative;
        }

        .contact-info {
            position: absolute;
            padding: 50px 40px 50px 55px;
            background-color: #161616;
            top: 50%;
            transform: translateY(-50%);
            margin-left: 150px;
            max-width: 348px;
            height: 322px;
        }

        .contact-title {
            color: #fff;
            font-size: 24px;
        }

        .telephone {
            color: #fff;
            text-decoration: none;
            font-size: 19px;

            &:hover {
                text-decoration: underline;
            }
        }
    </style>

    <div class="contact-section">
        <iframe class="google-map"
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.2408235347784!2d106.68294947485718!3d10.792858489356917!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528d2542cb98f%3A0xd62d81f3f3579bb9!2zMjcgUGhhbiDEkMOsbmggUGjDuW5nLCBQaMaw4budbmcgMTcsIFBow7ogTmh14bqtbiwgSOG7kyBDaMOtIE1pbmgsIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1730818827712!5m2!1sen!2s"
                width="1688" height="600" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>

        <div class="contact-info">
            <h3 class="contact-title my-2">ĐỒ DA CAO CẤP CROCODILE</h3>
            <div class="location">
                <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" fill="currentColor"
                     class="bi bi-geo-alt-fill text-white mx-2" viewBox="0 0 16 16">
                    <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10m0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6"></path>
                </svg>
                <span class="text-white" style="font-size: 16px;">27 Phan Đình Phùng, Phường 17 Quận Phú Nhuận,
                            Tp HCM</span>
            </div>
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                 class="bi bi-telephone text-white mx-2" viewBox="0 0 16 16">
                <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"></path>
            </svg>
            <a class="telephone" href="">082 878 6789</a>
        </div>
    </div>
</div>
