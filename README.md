# Nginx Reverse Proxy - DVWA - CLient

## Xây dựng mô hình 4 máy ảo chạy trên container của docker.
 - Client
 - Nginx reverse proxy 
 - 2 DVWA (Damn Vulnerable Web Application)
 
## Yêu cầu
 - Máy ảo có dung lượng >= 20GB
 - Đã cài: **docker**, **docker-compose**, **git**
 
## Cách cài đặt

### 1. Pull repo về máy
```
git clone https://github.com/bibichanel/reverse-proxy-waf-model.git
```
Sau khi pull về máy thì ta có các thư mục sau:

![image](https://user-images.githubusercontent.com/65753412/168476210-2c48acfc-9fe3-4f77-9b9f-73668cdd3800.png)

_Các files **docker-compose.yml** có trong 3 thư mục **nginx**, **client**, **dvwa** để build và run thủ công từng máy. Nếu mọi người quan tâm có thể đọc qua._
_Ngoài các tệp trên còn có:_
- _File **modsecurity.sh** để pull và install ModSecurity(WAF) cho proxy Nginx (File được nằm tại workdir của container nginx)_
- _File **nginx.conf** cấu hình redirect cho reverse proxy. (File được nằm trong thư mục /etc/nginx/ của container nginx)_
- _Files **Dockerfile** để thiết lập cấu trúc cho docker image._
- _File **docker-compose.yml** ở thư mục gốc làm nhiệm vụ giúp thiết lập các service cần thiết cho mô hình của chúng ta._

### 2. Build container với file docker-compose.yml ở thư mục gốc. 
```
sudo docker-compose build
```

### 3. Chạy lệnh dưới đây để khởi động tất cả các container được chỉ định trong docker-compose.yml
```
sudo docker-compose up 
```

## Lưu ý

Sau khi chạy xong câu lệnh **sudo docker-compose up** thì mô hình đã chạy được, nhưng ModSecurity chưa được tích hợp trên Nginx proxy. Có nghĩa là thằng proxy này chưa có tường lửa. Bạn có thể truy cập vào web DVWA qua đường dẫn http://127.0.0.1/ tại local. Nó sẽ đi qua reverse proxy trước khi đến 1 trong 2 máy chủ DVWA.

#### Vậy làm sao để tích hợp modsec vào proxy?

Nó khá là đơn giản hãy làm thủ công như sau:

**Bước 1:** Truy cập vào container nginx 
```
sudo docker exec -it <id-container> /bin/bash
```
**Bước 2:** Chạy file script có trong thư mục /nginxProxy
```
./modsecurity.sh
```
**Bước 3:** Bỏ comment code các dòng lệnh trong file /etc/nginx/nginx.conf bằng trình **vim** như sau
```
include /etc/nginx/modules-enabled/*.conf;
load_module /etc/nginx/modules/ngx_http_modsecurity_module.so;

modsecurity on;
modsecurity_rules_file /etc/nginx/modsec/main.conf;
```
**Bước 4:** Chạy lại service nginx
```
service nginx restart
```
_Tại đây thì conatainer nginx sẽ thoát với code exit 0. Đừng lo lắng hãy chạy lại container và bạn sẽ thấy thành quả._

### 4. Để dừng và loại bỏ tất cả các vùng chứa
```
sudo docker-compose down
```

##### :underage: Bài viết sẽ được cập nhật sớm ...
