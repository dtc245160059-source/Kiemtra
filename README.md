**Sinh viên thực hiện:** Hà Quang Tiến - DTC245160059
**Môn học:** Triển khai và Quản trị Hệ thống Phần mềm

Dự án này triển khai toàn diện một hệ thống Website WordPress tích hợp cơ sở dữ liệu MariaDB, quản lý qua phpMyAdmin, định tuyến bằng Nginx Proxy Manager và được giám sát (Monitoring & Logging) tập trung thông qua Prometheus, Grafana, Loki, Promtail. Toàn bộ hệ thống được container hóa và điều phối bằng Docker Compose.

---

## 1. Yêu cầu hệ thống (Prerequisites)
- Máy chủ Ubuntu/Debian hoặc hệ điều hành có hỗ trợ Docker.
- Đã cài đặt **Docker Engine** và **Docker Compose**.
- Các cổng mạng (ports) sau bắt buộc phải ở trạng thái trống: `80, 81, 443, 3306, 8080, 8082, 9090, 3000, 3100`.

## 2. Hướng dẫn khởi chạy hệ thống (How to Run)

**Bước 1: Tải mã nguồn về máy (Clone repository)**
```bash
git clone https://github.com/dtc245160059-source/Kiemtra.git
cd Kiemtra
```
**Bước 2: Cấu hình biến môi trường bảo mật**

Tạo file .env tại thư mục gốc của dự án để cấu hình mật khẩu Database (Lưu ý: Không đưa file này lên Git để bảo mật thông tin):
```Bash
nano .env
```
Nội dung file .env:
```Đoạn mã
MYSQL_ROOT_PASSWORD=MatKhauRootManh123!
MYSQL_DATABASE=wordpress
MYSQL_USER=wp_user
MYSQL_PASSWORD=MatKhauWPManh456!
```
**Bước 3: Khởi chạy toàn bộ hệ thống**

Sử dụng Docker Compose để build image và chạy các container dưới dạng ngầm (detached mode):

```Bash
docker compose up -d --build
```
**Bước 4: Kiểm tra trạng thái**

Kiểm tra xem tất cả các container đã hoạt động (trạng thái Up/Running) chưa:

```Bash
docker compose ps
```
## 3. Thông tin truy cập các dịch vụ (Access Information)
Thay `<IP_SERVER>` bằng địa chỉ IP máy ảo/máy chủ của bạn (ví dụ: `192.168.1.100`):

- **Trang chủ WordPress:** `http://<IP_SERVER>:8080`
- **Quản trị Database (phpMyAdmin):** `http://<IP_SERVER>:8082` (Đăng nhập bằng user/pass khai báo trong file .env)
- **Nginx Proxy Manager (Quản lý Domain/SSL):** `http://<IP_SERVER>:81`
  - *Tài khoản mặc định: `admin@example.com` / Mật khẩu: `changeme`*
- **Hệ thống Giám sát Metrics (Prometheus):** `http://<IP_SERVER>:9090`
- **Bảng điều khiển Giám sát & Log (Grafana):** `http://<IP_SERVER>:3000`
  - *Tài khoản mặc định: `admin` / Mật khẩu: `admin`*

## 4. Hướng dẫn dừng và dọn dẹp hệ thống
- Để dừng hệ thống (tạm thời tắt các container, dữ liệu vẫn giữ nguyên):
```Bash
docker compose stop
```
- Để gỡ bỏ toàn bộ container và network (dữ liệu trong volumes vẫn được giữ nguyên):

```Bash
docker compose down
```
