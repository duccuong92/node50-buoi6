-- Kiểm tra version
SELECT VERSION();

-- DATABASE
-- Tạo database
CREATE DATABASE db_test;
-- Tạo database khi không tồn tại db đó
CREATE DATABASE IF NOT EXISTS db_test;
-- Xoá database
DROP DATABASE db_test;
-- KẾT NỐI SỬ DỤNG DB MONG MUỐN
USE db_cyber_community;


-- TABLES TEMPLATE
-- PRIMARY KEY: kết hợp của NOT NULL và UNIQUE

-- Tạo table thử nghiệm
CREATE TABLE Roles;
CREATE TABLE db_Roles;
CREATE TABLE `Roles` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	`name` VARCHAR(255), -- Giới hạn 255 ký tự
	`description` VARCHAR(255),
	`isActive` BOOL DEFAULT 1, -- Dữ liệu Bool True false BOOL HOẶC BOOLEAN
	
	-- Mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0, -- Để xem là ai đã xoá dữ liệu
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0, -- Xoá mềm/Không xóa mất
	`deletedAt` TIMESTAMP NULL DEFAULT NULL, -- khi người dùng xoá lúc nào
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- khi người dùng tạo lúc nào
	`updateAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 
);


CREATE TABLE `Users` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	`email` VARCHAR(255) NOT NULL UNIQUE,
	`fullName` VARCHAR(255),
	`avatar` VARCHAR(255),
	`password` VARCHAR(255),
	`facebookId` VARCHAR(255) UNIQUE,
	`googleId` VARCHAR(255) UNIQUE,
	`roleId` INT NOT NULL DEFAULT 2,
	
	-- Sử dụng khoá phụ và kết nối đến table cần lấy dự liệu tham chiếu.
	FOREIGN KEY (`roleId`) REFERENCES `Roles` (`id`),
	 
	-- Mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0, -- Để xem là ai đã xoá dữ liệu
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0, -- Xoá mềm/Không xóa mất
	`deletedAt` TIMESTAMP NULL DEFAULT NULL, -- khi người dùng xoá lúc nào
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- khi người dùng tạo lúc nào
	`updateAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 
);

-- Gán giá trị vào column của tables
INSERT INTO `Users` (`email`, `fullName`, `password`) VALUES
('test@gmail.com', 'Nguyen Van A', '1234'),
('test2@gmail.com', 'Nguyen Van B', '1234'),
('test3@gmail.com', 'Nguyen Van C', '1234'),
('test4@gmail.com', 'Nguyen Van D', '1234'),
('test5@gmail.com', 'Nguyen Van E', '1234')

-- Query lấy dữ liệu từ table
SELECT * FROM `Users`;
SELECT `email` FROM `Users`;
SELECT `email` AS 'email người dùng' FROM `Users`;


-- Đổi kiểu
ALTER TABLE `Roles`
MODIFY COLUMN `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT;

DROP TABLE `Roles`; -- xoá Table


-- Thêm dữ liệu
INSERT INTO `Roles` (`name`, `description`) VALUES
('ROLE_ADMIN', 'Quản trị hệ thống'),
('ROLE_USER', 'Người dùng hệ thống'),
('ROLE_USER-VIEW', 'Người dùng XEM')



-- Tạo và Thêm dữ liệu
CREATE TABLE `Foods` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	`foodName` VARCHAR(255),
	`description` VARCHAR(255),
	
	-- Mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0, -- Để xem là ai đã xoá dữ liệu
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0, -- Xoá mềm/Không xóa mất
	`deletedAt` TIMESTAMP NULL DEFAULT NULL, -- khi người dùng xoá lúc nào
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- khi người dùng tạo lúc nào
	`updateAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 
);

INSERT INTO `Foods` (`foodName`, `description`) VALUES
('gỏi kem', 'gỏi được làm từ kem'),
('gỏi gà', 'gỏi được làm từ gà'),
('gỏi táo', 'gỏi được làm từ táo'),
('gỏi nướng', 'gỏi được làm từ nướng'),
('gỏi heo', 'gỏi được làm từ heo')

id

-- Tạo và Thêm dữ liệu
CREATE TABLE `Orders` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	`userId` INT NOT NULL,
	`foodId` INT NOT NULL,
	
	FOREIGN KEY (`userId`) REFERENCES `Users`(`id`),
	FOREIGN KEY (`foodId`) REFERENCES `Foods` (`id`),
	
	-- Mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0, -- Để xem là ai đã xoá dữ liệu
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0, -- Xoá mềm/Không xóa mất
	`deletedAt` TIMESTAMP NULL DEFAULT NULL, -- khi người dùng xoá lúc nào
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- khi người dùng tạo lúc nào
	`updateAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 
);


-- NẾU LÀ ID INT THÌ KHÔNG ĐƯỢC ĐỂ TRONG DẤU ' '
INSERT INTO `Orders` (`userId`, `foodId`) VALUES
(1, 2),
(3, 1),
(2, 5),
(1, 3),
(3, 2)


-- * là chọn tất cả
SELECT * FROM `Orders`;


-- INNER JOIN: GIỮA 2 TABLES LẤY RA CÁC PHẦN TỬ GIỐNG NHAU
-- SELECT * Để lấy ra toàn bộ
SELECT `userId`, `foodId`, `email`, `fullName`, `password`
FROM `Users`
INNER JOIN `Orders`ON `Users`.id = `Orders`.userId;


-- LEFT JOIN OR RIGHT JOIN: 
-- SELECT *
SELECT `userId`, `foodId`, `email`, `fullName`, `password`
FROM `Users`
LEFT JOIN `Orders` ON `Users`.id = `Orders`.userId;


-- CROSS JOIN (FULL OUTER JOIN):
SELECT `userId`, `foodId`, `email`, `fullName`, `password`
FROM `Users`
CROSS JOIN `Orders`


-- Tìm 5 người đã like nhà hàng nhiều nhất (orders)
-- bước 1: lấy ra tất cả orders

SELECT * FROM `Orders`

-- bước 2: lấy thêm thông tin user (email)
SELECT `userId`, `foodId`, `email` as 'Người dùng mua', `foodName` AS 'Món ăn là'
FROM `Orders`
INNER JOIN `Users` ON `Users`.id = `Orders`.userId
INNER JOIN `Foods` ON `Orders`.foodId = `Foods`.id


-- bước 3: nhóm các userId giống nhau
-- GROUP BY là nhóm những giá trị của cột giống nhau, bắt buộc các hàng phải giống nhau
SELECT `userId`, `foodId`, `email`
FROM `Orders`
INNER JOIN `Users` ON `Users`.id = `Order`.userId
GROUP BY `userId`

-- bước 4:đếm số lượng đã được nhóm
SELECT COUNT(`userId`), `userId`, `email`
FROM `Orders`
INNER JOIN `Users` ON `Users`.id = `Orders`.userId
GROUP BY `userId`

-- bước 5: Sắp xếp giảm dần ORDER BY 
-- (DESC giảm dần từ cao đến thấp/ tăng dần)
-- (ASC từ thấp đến cao/ giảm dần)
SELECT COUNT(`userId`) AS 'Số lần mua', `userId`, `email`
FROM `Orders`
INNER JOIN `Users` ON `Users`.id = `Orders`.userId
GROUP BY `userId`
ORDER BY `Số lần mua` DESC

LIMIT 2











