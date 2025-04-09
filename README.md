<!-- Các thư viện đã cài -->

ExpressJS
NODEMON: reload lại server khi có sự thay đổi code (sửa file .env phải tắt server và mở lại)
mysql2: Dùng để tương tác với db bằng câu lệnh sql
Example: SELECT * FROM users WHERE id = 1;

sequelize: ORM giúp tương tác với db bằng các hàm đơn giản trên nền mysql2

Cài thư viện extensionless giúp import file js bằng cách import tên file mà không cần đuôi .js
npm i extensionless

squelize-auto: chỉ có 1 chức năng duy nhất là vào DB lấy ra thông tin và tự tạo ra model.

dotenv: thư viện giúp lấy biến trong file .env đưa vào dự án (process.env)