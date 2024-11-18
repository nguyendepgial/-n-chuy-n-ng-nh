-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 17, 2024 lúc 05:10 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `my_database`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `best_selling_products`
--

CREATE TABLE `best_selling_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `period_type` enum('month','quarter','year') NOT NULL,
  `period_value` int(11) NOT NULL,
  `sales_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `best_selling_products`
--

INSERT INTO `best_selling_products` (`id`, `product_id`, `period_type`, `period_value`, `sales_count`, `created_at`) VALUES
(1, 1, 'month', 11, 150, '2024-11-17 15:29:37'),
(2, 2, 'month', 11, 200, '2024-11-17 15:29:37'),
(3, 3, 'quarter', 4, 500, '2024-11-17 15:29:37'),
(4, 4, 'year', 2023, 1000, '2024-11-17 15:29:37'),
(5, 5, 'year', 2023, 700, '2024-11-17 15:29:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Nội Thất Phòng Khách', 'Các sản phẩm nội thất cho phòng khách', '2024-11-17 15:29:37'),
(2, 'Nội Thất Phòng Ngủ', 'Các sản phẩm nội thất cho phòng ngủ', '2024-11-17 15:29:37'),
(3, 'Nội Thất Phòng Bếp', 'Các sản phẩm nội thất cho phòng bếp', '2024-11-17 15:29:37'),
(4, 'Nội Thất Phòng Thờ', 'Các sản phẩm nội thất cho phòng thờ', '2024-11-17 15:29:37'),
(5, 'Nội Thất Trang Trí', 'Các sản phẩm nội thất trang trí', '2024-11-17 15:29:37'),
(6, 'Nội Thất Văn Phòng', 'Các sản phẩm nội thất cho văn phòng', '2024-11-17 15:29:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `rating`, `category_id`, `created_at`) VALUES
(1, 'Giường Ngủ', 'Giường ngủ thiết kế hiện đại', 3500000.00, '/images/giuong-ngu.jpg', 5, 2, '2024-11-17 15:29:37'),
(2, 'Bàn Trà', 'Bàn trà phù hợp cho phòng khách', 1500000.00, '/images/ban-tra.jpg', 4, 1, '2024-11-17 15:29:37'),
(3, 'Tủ Bếp', 'Tủ bếp gỗ tự nhiên cao cấp', 4500000.00, '/images/tu-bep.jpg', 5, 3, '2024-11-17 15:29:37'),
(4, 'Bàn Thờ', 'Bàn thờ gỗ trang nghiêm', 5000000.00, '/images/ban-tho.jpg', 5, 4, '2024-11-17 15:29:37'),
(5, 'Bàn Làm Việc', 'Bàn làm việc tiện lợi cho văn phòng', 2500000.00, '/images/ban-lam-viec.jpg', 4, 6, '2024-11-17 15:29:37'),
(6, 'Tủ Rượu', 'Tủ rượu thiết kế sang trọng', 3000000.00, '/images/tu-ruou.jpg', 4, 5, '2024-11-17 15:29:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `best_selling_products`
--
ALTER TABLE `best_selling_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `best_selling_products`
--
ALTER TABLE `best_selling_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `best_selling_products`
--
ALTER TABLE `best_selling_products`
  ADD CONSTRAINT `best_selling_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
