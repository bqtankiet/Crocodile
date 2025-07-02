# Crocodile - Website Thương Mại Điện Tử Đồ Da Cá Sấu

[![NongLamUniversity](https://img.shields.io/badge/Nong_Lam_University-green?style=flat)](https://www.hcmuaf.edu.vn/)
[![Java](https://img.shields.io/badge/Java-17-ED8B00.svg?style=flat-square&logo=java&logoColor=white)](https://adoptium.net/temurin/releases/?version=17&os=any&arch=any)
[![JSP/Servlet](https://img.shields.io/badge/JSP%2FServlet-4.0-orange.svg?style=flat-square)](https://www.jetbrains.com/idea/download/?section=windows)
[![MariaDB](https://img.shields.io/badge/MariaDB-latest-blue.svg?style=flat-square&logo=mariadb&logoColor=white)](https://mariadb.org/)
[![Docker](https://img.shields.io/badge/Docker-24.0-2496ED.svg?style=flat-square&logo=docker&logoColor=white)](https://docs.docker.com/desktop/setup/install/windows-install/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3-7952B3.svg?style=flat-square&logo=bootstrap&logoColor=white)](https://getbootstrap.com/docs/5.3/getting-started/introduction/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://github.com/bqtankiet/Crocodile/blob/main/LICENSE)
[![Contributors](https://img.shields.io/github/contributors/bqtankiet/Crocodile?style=flat-square)](https://github.com/bqtankiet/Crocodile/graphs/contributors)
[![Issues](https://img.shields.io/github/issues/bqtankiet/Crocodile?style=flat-square)](https://github.com/bqtankiet/Crocodile/issues)

**Crocodile** là một website thương mại điện tử chuyên cung cấp các sản phẩm thời trang làm từ da cá sấu cao cấp như ví, dây lưng, túi xách, giày dép,... Dự án được thực hiện trong khuôn khổ học phần **Thực tập lập trình web** yêu cầu sử dụng JSP/Servlet, xây dựng ứng dụng web hoàn chỉnh từ frontend đến backend và triển khai bằng docker.

## Members:
- @bqtankiet https://github.com/bqtankiet

- @MrMinKhoi https://github.com/MrMinKhoi

- @ahkiet123 https://github.com/ahkiet123

---

## Chức năng chính

### Phía người dùng (User)

| Chức năng                    | Mô tả                                                               |
|------------------------------|---------------------------------------------------------------------|
| **Đăng ký và đăng nhập**     | Cho phép người dùng tạo tài khoản và đăng nhập an toàn              |
| **Quên mật khẩu**            | Hỗ trợ lấy lại mật khẩu thông qua email                             |
| **Tìm kiếm & lọc sản phẩm**  | Tìm kiếm sản phẩm theo từ khóa, lọc theo danh mục, giá,...          |
| **Xem chi tiết sản phẩm**    | Hiển thị thông tin, hình ảnh và đánh giá sản phẩm                   |
| **Quản lý giỏ hàng**         | Thêm, xoá, cập nhật số lượng sản phẩm trong giỏ                     |
| **Đặt hàng**                 | Quy trình đặt hàng đơn giản, nhanh chóng                            |
| **Thanh toán MoMo**          | Tích hợp cổng thanh toán MoMo để thanh toán trực tuyến              |
| **Đánh giá sản phẩm**        | Người dùng có thể để lại nhận xét và đánh giá sản phẩm đã mua       |
| **Quản lý thông tin cá nhân**| Cập nhật hồ sơ, địa chỉ giao hàng, thông tin tài khoản              |
| **Xem lịch sử đặt hàng**     | Theo dõi trạng thái và chi tiết các đơn hàng đã mua                 |
| **Sử dụng Voucher**          | Nhập mã giảm giá để nhận ưu đãi khi thanh toán                      |
| _**Các chức năng khác**_     | _Hãy clone repo và khám phá các chức năng thú vị khác nhé_          |

### Phía quản trị viên (Admin)

| Chức năng                    | Mô tả                                                                |
|------------------------------|----------------------------------------------------------------------|
| **Dashboard**                | Hiển thị tổng quan về doanh thu, đơn hàng và hoạt động website       |
| **Quản lý danh mục**         | Thêm, sửa, xoá các danh mục sản phẩm                                 |
| **Quản lý sản phẩm**         | Quản lý thông tin, giá cả, tồn kho và hình ảnh sản phẩm              |
| **Quản lý đơn hàng**         | Theo dõi, cập nhật trạng thái và xử lý đơn hàng của khách hàng       |
| **Quản lý người dùng**       | Quản lý tài khoản người dùng, phân quyền theo vai trò (Role/Permission) |
| **Theo dõi lịch sử ghi log** | Ghi lại và xem các hoạt động của người dùng và admin trong hệ thống  |
| **Quản lý kho hàng**         | Theo dõi tồn kho, cập nhật số lượng sản phẩm                         |
| **Quản lý mã giảm giá**      | Tạo, sửa, huỷ và phân phối mã giảm giá cho người dùng                |
| _**Các chức năng khác**_     | _Hãy clone repo và khám phá các chức năng thú vị khác nhé_           |

## Công nghệ sử dụng

### Frontend

| Công nghệ       | Mô tả                                                                |
|-----------------|----------------------------------------------------------------------|
| **HTML, CSS, JavaScript** | Xây dựng giao diện người dùng thân thiện, responsive       |
| **Bootstrap 5** | Framework CSS giúp thiết kế UI hiện đại, nhanh chóng                 |
| **jQuery**      | Hỗ trợ thao tác DOM, xử lý sự kiện, hiệu ứng mượt mà                 |
| **Ajax**        | Gửi/nhận dữ liệu không đồng bộ, giúp tải nội dung mà không reload trang |

### Backend

| Công nghệ       | Mô tả                                                               |
|-----------------|---------------------------------------------------------------------|
| **Java**        | Ngôn ngữ lập trình chính xử lý logic phía server                    |
| **JSP/Servlet** | Xây dựng ứng dụng web động theo mô hình MVC                         |
| **JDBI**        | Thư viện Java giúp tương tác với cơ sở dữ liệu đơn giản và hiệu quả |

### Cơ sở dữ liệu

| Công nghệ       | Mô tả                                                                |
|-----------------|----------------------------------------------------------------------|
| **MariaDB**     | Hệ quản trị cơ sở dữ liệu quan hệ, nhẹ, mã nguồn mở và tương thích MySQL |

### Triển khai & Vận hành

| Công nghệ           | Mô tả                                                                 |
|---------------------|-----------------------------------------------------------------------|
| **Docker**          | Tạo môi trường ảo hóa và đóng gói ứng dụng vào container để dễ dàng triển khai |
| **VPS (AlmaLinux)** | Máy chủ VPS sử dụng hệ điều hành AlmaLinux (Có thể dùng bản phân phối khác) |

### Công nghệ khác
| Công nghệ           | Mô tả                                                                 |
|---------------------|----------------------------------------------------------------------|
| **CKEditor**        | Trình soạn thảo văn bản WYSIWYG để nhập nội dung mô tả sản phẩm       |
| **CKFinder**        | Công cụ quản lý và tải lên hình ảnh tích hợp với CKEditor             |
| **MoMo API**        | Tích hợp thanh toán trực tuyến qua ví điện tử MoMo                    |
| **GHD API**         | API kiểm tra đơn vị vận chuyển và phí giao hàng                       |
| **JavaMail API**    | Gửi email (ví dụ: xác thực tài khoản, quên mật khẩu)                  |
| **Google OAuth 2.0**| Đăng nhập bằng tài khoản Google thông qua xác thực OAuth 2.0          |

---

##  🚀 Hướng dẫn Clone dự án
### 1️⃣ Chuẩn bị môi trường
| Công cụ                    | Mục đích                           | Tải về                                   |
|----------------------------|------------------------------------|------------------------------------------|
| **JDK 17**                 | Biên dịch và chạy project Java     | [Tải JDK 17](https://adoptium.net/temurin/releases/?version=17&os=any&arch=any) |
| **IntelliJ IDEA**          | IDE để lập trình Java              | [Tải IntelliJ](https://www.jetbrains.com/idea/download/?section=windows) |
| **Git**                    | Clone và quản lý mã nguồn          | [Tải Git](https://git-scm.com/downloads) |
| **Docker Desktop**         | Chạy môi trường ảo hóa (container) | [Tải Docker](https://docs.docker.com/desktop/setup/install/windows-install/) |
| **Navicat** *(tùy chọn)*   | Công cụ quản lý Cơ sở dữ liệu      | [Tải Navicat](https://www.navicat.com/en/download/navicat-premium-lite) |

### 2️⃣ Clone dự án
Mở **Terminal** hoặc **Git Bash** và thực hiện các lệnh sau:
```
# Clone repository từ GitHub
git clone https://github.com/bqtankiet/Crocodile.git
```

### 3️⃣ Build file WAR
- Mở project trong IntelliJ và tiến hành build file `WAR` bằng maven
```
# Build file WAR
mvn clean package -DskipTests
```
- Trong thư mục `\target` mà maven vừa tạo ra, tìm file `crocodile-1.0-SNAPSHOT.war` đổi tên thành `ROOT.war`
- Copy file `ROOT.war` vào thư mục `\docker\volumes\tomcat_webapps`

### 4️⃣ Chạy Local với Docker Desktop
- Truy cập vào thư mục `docker` (có chứa file `docker-compose.yml`
- Tại thư mục `docker` chạy lệnh docker compose
```
docker compose up -d --build
```
> - Thư mục webapps của tomcat được mount tại `\docker\volumes\tomcat_webapps`
> - Dữ liệu database được mount tại `\docker\volumes\db_data`

- Kiểm tra các container đang chạy (Đảm bảo 2 container `crocodile_db` và `crocodile_web` đang chạy)
```
docker ps
```

- Truy cập website tại đường dẫn http://localhost:8080
> Tài khoản admin:
> - Email: admin@gmail.com
> - Password: admin

---

## ☁️ Hướng dẫn triển khai lên VPS
> Lưu ý: Phần hướng dẫn triển khai VPS đang được cập nhật. Dưới đây là các bước cơ bản:
> 1. Chuẩn bị VPS (Có thể thuê tại các dịch vụ VPS hoặc sử dụng VirtualMachine)
> 2. Kết nối vào VPS
> 3. Cài đặt Docker Engine
> 4. Cài đặt Nginx
> 5. Mở cổng 80
> 6. Clone project
> 7. Cấu hình project
> 8. Chạy docker compose
> 9. Truy cập website
> 10. (Tùy chọn) Cài SSL miễn phí

---

## Sơ đồ website
``` markdown
- Trang chủ (/)
  ├── Danh mục sản phẩm (/product-list)
  ├── Chi tiết sản phẩm (/product-detail?id=:id)
  ├── Liên hệ (/contact)
  ├── Giới thiệu (/about)
  ├── Giỏ hàng (/cart)
  ├── Thanh toán (/checkout/v2)
  ├── Đăng nhập (/login)
  ├── Đăng ký (/signup)
  ├── Quên mật khẩu (/forget-password)
  └── Trang cá nhân (/user)

- Quản trị viên (/admin)
  ├── Dashboard (/admin/)
  ├── Quản lý danh mục (/admin/category)
  ├── Quản lý sản phẩm (/admin/product)
  ├── Quản lý đơn hàng (/admin/order)
  ├── Quản lý người dùng (/admin/user)
  ├── Quản lý mã giảm giá (/admin/discount-codes)
  ├── Quản lý kho (/admin/inventory-management)
  ├── Phân quyền (/admin/role-permission)
  └── Nhật ký hệ thống (/admin/log)
```

---
## Giao diện
### Trang chủ
![localhost_8080_ (1)](https://github.com/user-attachments/assets/d87747cf-8d5a-4d88-a81c-65f89e420f05)

### Trang chi tiết sản phẩm
![localhost_8080_product-detail_id=1](https://github.com/user-attachments/assets/51ab2cfb-d8ff-48f1-8591-08ef51830471)

### Trang Admin
![localhost_8080_admin_](https://github.com/user-attachments/assets/3ac8d701-cb9f-4fca-8a1c-6e1a8b0924af)

---

📫 Liên hệ: [bqtankiet@gmail.com](mailto:bqtankiet@gmail.com)  

🔗 Học phần Thực tập Lập trình Web – Khoa Công nghệ Thông tin, Đại học Nông Lâm TP.HCM

⚠️ Dự án chỉ nhằm phục vụ mục đích học tập, không dùng cho thương mại.

---
🙏 Cảm ơn bạn đã ghé thăm Repository! Chúc các bạn một ngày tốt lành!
