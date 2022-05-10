# Nginx Reverse Proxy - DVWA - CLient

## Xây dựng mô hình 4 máy ảo chạy trên container của docker.
 - Client
 - Nginx reverse proxy 
 - 2 DVWA 

## Cách cài đặt

### 1. Pull repo về máy
```
git clone https://github.com/bibichanel/reverse-proxy-waf-model.git
```
Sau khi pull về máy thì ta có các thư mục sau:
> ![treeFile](https://user-images.githubusercontent.com/65753412/163180963-d7aeb993-aa2f-42e7-a3d0-86c301abf75c.png)

_Các tệp docker-compose.yml có trong 3 thư mục nginx, client, dvwa để build và run thủ công từng máy. Nếu mọi người quan tâm có thể đọc qua._

### 2. Build services với file docker-compose.yml ở thư mục build. 
```
sudo docker-compose build
```

### 3. Chạy lệnh dưới đây để khởi động tất cả các container được chỉ định trong docker-compose.yml
```
sudo docker-compose up -d
```

### 4. Để dừng và loại bỏ tất cả các vùng chứa
```
sudo docker-compose down
```

##### :underage: Bài viết sẽ được cập nhật sớm ...
