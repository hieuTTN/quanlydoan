-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th3 06, 2026 lúc 03:54 PM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlydoan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authority`
--

CREATE TABLE `authority` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `authority`
--

INSERT INTO `authority` (`name`) VALUES
('ROLE_ADMIN'),
('ROLE_PARENT'),
('ROLE_STUDENT'),
('ROLE_TEACHER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `num_view` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `blog`
--

INSERT INTO `blog` (`id`, `content`, `created_date`, `created_time`, `description`, `image`, `num_view`, `title`, `user_id`, `category_id`) VALUES
(1, 'fwgbyeufgwbefwef', '2026-03-06', '22:09:01', 'đây là mô tả oke', NULL, 0, 'thông báo nghỉ tết 2026', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` bigint NOT NULL,
  `category_type` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `category_type`, `image`, `name`) VALUES
(1, 'BLOG', 'string', 'Thông báo'),
(2, 'DOCUMENT', NULL, 'Lập trình'),
(3, 'DOCUMENT', NULL, 'Kiêm thử');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat`
--

CREATE TABLE `chat` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `is_file` bit(1) DEFAULT NULL,
  `receiver` bigint DEFAULT NULL,
  `sender` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat_room`
--

CREATE TABLE `chat_room` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `sender` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company`
--

CREATE TABLE `company` (
  `id` bigint NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_banner` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `tax_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `company`
--

INSERT INTO `company` (`id`, `address`, `description`, `image_banner`, `name`, `phone`, `tax_code`) VALUES
(1, 'hoàng mai, hà nội', 'đây là mô tả công ty', 'http:///', 'công ty cộng nghệ aladin', '00976126', '932748234');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `document`
--

CREATE TABLE `document` (
  `id` bigint NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `link_image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number_download` int DEFAULT NULL,
  `number_view` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `document`
--

INSERT INTO `document` (`id`, `created_date`, `description`, `link_image`, `name`, `number_download`, `number_view`, `status`, `category_id`, `user_id`) VALUES
(1, NULL, 'đây là mô tả oke', 'string', 'Tài liệu số 1', NULL, NULL, 'DANG_HIEN_THI', 2, 2),
(2, NULL, 'đây là mô tả oke tài liệu 2', 'string', 'Tài liệu số 2', NULL, NULL, 'DANG_HIEN_THI', 2, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `document_detail`
--

CREATE TABLE `document_detail` (
  `id` bigint NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `link_file` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `document_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `document_detail`
--

INSERT INTO `document_detail` (`id`, `file_type`, `link_file`, `name`, `document_id`) VALUES
(1, 'pdf', 'http://clod', 'file số 1', 1),
(2, 'word', 'http://clod', 'file số 2', 1),
(3, 'pdf', 'http://clod', 'file số 1', 2),
(4, 'word', 'http://clod', 'file số 2', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification`
--

CREATE TABLE `notification` (
  `id` bigint NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `related_documents`
--

CREATE TABLE `related_documents` (
  `id` bigint NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `semester_teacher_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `related_document_student`
--

CREATE TABLE `related_document_student` (
  `id` bigint NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `student_regis_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `score_ratio`
--

CREATE TABLE `score_ratio` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percent` float DEFAULT NULL,
  `semester_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `score_result`
--

CREATE TABLE `score_result` (
  `id` bigint NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percent` float DEFAULT NULL,
  `point` float DEFAULT NULL,
  `student_regis_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `semester`
--

CREATE TABLE `semester` (
  `id` bigint NOT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `year_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `semester`
--

INSERT INTO `semester` (`id`, `end_date`, `is_active`, `start_date`, `year_name`) VALUES
(1, '2024-06-06', b'0', '2024-03-06', '2024-2025'),
(2, '2024-06-06', b'1', '2024-03-06', '2025-2026');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `semester_company`
--

CREATE TABLE `semester_company` (
  `id` bigint NOT NULL,
  `current_student` int DEFAULT NULL,
  `max_student` int DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `semester_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `semester_teacher`
--

CREATE TABLE `semester_teacher` (
  `id` bigint NOT NULL,
  `current_students` int DEFAULT NULL,
  `max_students` int DEFAULT NULL,
  `semester_type_id` bigint DEFAULT NULL,
  `teacher_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `semester_type`
--

CREATE TABLE `semester_type` (
  `id` bigint NOT NULL,
  `description_project` varchar(255) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `semester_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_regis`
--

CREATE TABLE `student_regis` (
  `id` bigint NOT NULL,
  `accept` bit(1) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_phone` varchar(255) DEFAULT NULL,
  `evaluate` varchar(255) DEFAULT NULL,
  `internship_type` varchar(255) DEFAULT NULL,
  `introduction_paper` varchar(255) DEFAULT NULL,
  `local_date_time` datetime DEFAULT NULL,
  `tax_code` varchar(255) DEFAULT NULL,
  `total_score` float DEFAULT NULL,
  `semester_company_id` bigint DEFAULT NULL,
  `semester_teacher_id` bigint DEFAULT NULL,
  `student_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `activation_key` varchar(255) DEFAULT NULL,
  `actived` bit(1) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `remember_key` varchar(255) DEFAULT NULL,
  `token_fcm` varchar(255) DEFAULT NULL,
  `user_type` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `authority_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `activation_key`, `actived`, `avatar`, `code`, `created_date`, `email`, `fullname`, `password`, `phone`, `remember_key`, `token_fcm`, `user_type`, `username`, `authority_name`) VALUES
(1, NULL, b'1', NULL, NULL, '2026-03-03', 'hieutran02102804@gmail.com', 'ADMIN', '$2a$10$/7hogtfZ3R7Ssk3heLTEBeFbMP1FiBewcrohmXqA/19..T4W3MI5u', NULL, '525421', NULL, 1, 'hieutran02102804@gmail.com', 'ROLE_STUDENT'),
(2, NULL, b'1', NULL, NULL, '2026-03-06', 'admin@gmail.com', 'ADMIN', '$2a$10$N/TMxF6v7Wtlg7MdfkGz5OTNWxQ3YNVr9.vJ35iZK1tgmGL/otNb.', NULL, NULL, NULL, 1, 'admin@gmail.com', 'ROLE_ADMIN'),
(4, NULL, b'1', 'https://example.com/avatar.jpg', 'DV001', '2026-03-06', 'vana@gmail.com', 'Nguyễn Văn A', '$2a$10$2tMgDLgUxDYEDXxsE9gTZOyOUfIcKa7Kmic.C7cP8f/yn5ZIWCOwS', '0912345678', NULL, NULL, NULL, 'vana@gmail.com', 'ROLE_STUDENT'),
(5, NULL, b'1', 'https://example.com/avatar.jpg', 'SV009', '2026-03-06', 'hieu@gmail.com', 'Trần văn hiếu', '$2a$10$WcfmqC0M8VsiU.2br9qEV.0GNwlHnU2hjJ8wa2Oh1lrntC8e.ACw6', '912345678', NULL, NULL, NULL, 'hieu@gmail.com', 'ROLE_STUDENT'),
(6, NULL, b'1', NULL, 'gv01', '2026-03-06', 'gv@gmail.com', 'giảng viên hiếu', '$2a$10$UcXBx7z5S.f6wJvJhBtOkeZZBllscEAKOSxJqNM5465mhENRjYeHK', '0976123123', NULL, NULL, NULL, 'gv@gmail.com', 'ROLE_TEACHER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `work_progress`
--

CREATE TABLE `work_progress` (
  `id` bigint NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `description` text,
  `title` varchar(255) DEFAULT NULL,
  `semester_teacher_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `work_progress_student`
--

CREATE TABLE `work_progress_student` (
  `id` bigint NOT NULL,
  `content` text,
  `created_date` datetime DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `percent` float DEFAULT NULL,
  `replay` varchar(255) DEFAULT NULL,
  `replay_date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `student_regis_id` bigint DEFAULT NULL,
  `work_process_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`name`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkr2fy24puc3x3sdnla4r1iok1` (`user_id`),
  ADD KEY `FKqyvjif1i2geaeuvkh3n1jrnn4` (`category_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKassi1e8b64hoj61bb710c8oq4` (`receiver`),
  ADD KEY `FKj5nm89ig7glfvk1ksfmqdsydo` (`sender`);

--
-- Chỉ mục cho bảng `chat_room`
--
ALTER TABLE `chat_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8w9fc1tk1b9lqiboes8eq6j0s` (`sender`);

--
-- Chỉ mục cho bảng `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1vwugdy4y8ivgpikjcuojibc0` (`category_id`),
  ADD KEY `FKm19xjdnh3l6aueyrpm1705t52` (`user_id`);

--
-- Chỉ mục cho bảng `document_detail`
--
ALTER TABLE `document_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKi8p1lw3va1e0qfmuna1wpet1w` (`document_id`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnk4ftb5am9ubmkv1661h15ds9` (`user_id`);

--
-- Chỉ mục cho bảng `related_documents`
--
ALTER TABLE `related_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8c9hpbsjq3wnd6eiw0di9mwek` (`semester_teacher_id`);

--
-- Chỉ mục cho bảng `related_document_student`
--
ALTER TABLE `related_document_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2rts6hc5s57vn7318bqg7smr4` (`student_regis_id`);

--
-- Chỉ mục cho bảng `score_ratio`
--
ALTER TABLE `score_ratio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3whxlrsntmp3bqx02b8s24xqf` (`semester_id`);

--
-- Chỉ mục cho bảng `score_result`
--
ALTER TABLE `score_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5dk9emc6b60r9vlidoptqmkqc` (`student_regis_id`);

--
-- Chỉ mục cho bảng `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `semester_company`
--
ALTER TABLE `semester_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh4w7ci2796hvsex4f0ninfobc` (`company_id`),
  ADD KEY `FKpag5v0ojsqrcx2l6b6nb7f81e` (`semester_id`);

--
-- Chỉ mục cho bảng `semester_teacher`
--
ALTER TABLE `semester_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpk3y2836e0dwtxdb4gk9odfhj` (`semester_type_id`),
  ADD KEY `FKbt2lx1jh0lplu7mnvwhsash71` (`teacher_id`);

--
-- Chỉ mục cho bảng `semester_type`
--
ALTER TABLE `semester_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnr7h71k4p2jxpc6o8jj28hava` (`semester_id`);

--
-- Chỉ mục cho bảng `student_regis`
--
ALTER TABLE `student_regis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfm58hyeo7kdj557lcs9l600hb` (`semester_company_id`),
  ADD KEY `FK81879ja0u02mxa3gpj9p9nt30` (`semester_teacher_id`),
  ADD KEY `FKiltmq3wd88vd17hqj1g76ntrw` (`student_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKq6r7e19l5xjmty0j0w6i2inlv` (`authority_name`);

--
-- Chỉ mục cho bảng `work_progress`
--
ALTER TABLE `work_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKl0ik7dw1lsux5ire7vha06lti` (`semester_teacher_id`);

--
-- Chỉ mục cho bảng `work_progress_student`
--
ALTER TABLE `work_progress_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3frck48ru667g4kjqm6wqdfdh` (`student_regis_id`),
  ADD KEY `FKauyjjyp052hcora7f9atbvsmf` (`work_process_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `chat`
--
ALTER TABLE `chat`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chat_room`
--
ALTER TABLE `chat_room`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `company`
--
ALTER TABLE `company`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `document`
--
ALTER TABLE `document`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `document_detail`
--
ALTER TABLE `document_detail`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `related_documents`
--
ALTER TABLE `related_documents`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `related_document_student`
--
ALTER TABLE `related_document_student`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `score_ratio`
--
ALTER TABLE `score_ratio`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `score_result`
--
ALTER TABLE `score_result`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `semester`
--
ALTER TABLE `semester`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `semester_company`
--
ALTER TABLE `semester_company`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `semester_teacher`
--
ALTER TABLE `semester_teacher`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `semester_type`
--
ALTER TABLE `semester_type`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `student_regis`
--
ALTER TABLE `student_regis`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `work_progress`
--
ALTER TABLE `work_progress`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `work_progress_student`
--
ALTER TABLE `work_progress_student`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `FKkr2fy24puc3x3sdnla4r1iok1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKqyvjif1i2geaeuvkh3n1jrnn4` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `FKassi1e8b64hoj61bb710c8oq4` FOREIGN KEY (`receiver`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKj5nm89ig7glfvk1ksfmqdsydo` FOREIGN KEY (`sender`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `chat_room`
--
ALTER TABLE `chat_room`
  ADD CONSTRAINT `FK8w9fc1tk1b9lqiboes8eq6j0s` FOREIGN KEY (`sender`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FK1vwugdy4y8ivgpikjcuojibc0` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FKm19xjdnh3l6aueyrpm1705t52` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `document_detail`
--
ALTER TABLE `document_detail`
  ADD CONSTRAINT `FKi8p1lw3va1e0qfmuna1wpet1w` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`);

--
-- Các ràng buộc cho bảng `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FKnk4ftb5am9ubmkv1661h15ds9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `related_documents`
--
ALTER TABLE `related_documents`
  ADD CONSTRAINT `FK8c9hpbsjq3wnd6eiw0di9mwek` FOREIGN KEY (`semester_teacher_id`) REFERENCES `semester_teacher` (`id`);

--
-- Các ràng buộc cho bảng `related_document_student`
--
ALTER TABLE `related_document_student`
  ADD CONSTRAINT `FK2rts6hc5s57vn7318bqg7smr4` FOREIGN KEY (`student_regis_id`) REFERENCES `student_regis` (`id`);

--
-- Các ràng buộc cho bảng `score_ratio`
--
ALTER TABLE `score_ratio`
  ADD CONSTRAINT `FK3whxlrsntmp3bqx02b8s24xqf` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`);

--
-- Các ràng buộc cho bảng `score_result`
--
ALTER TABLE `score_result`
  ADD CONSTRAINT `FK5dk9emc6b60r9vlidoptqmkqc` FOREIGN KEY (`student_regis_id`) REFERENCES `student_regis` (`id`);

--
-- Các ràng buộc cho bảng `semester_company`
--
ALTER TABLE `semester_company`
  ADD CONSTRAINT `FKh4w7ci2796hvsex4f0ninfobc` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `FKpag5v0ojsqrcx2l6b6nb7f81e` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`);

--
-- Các ràng buộc cho bảng `semester_teacher`
--
ALTER TABLE `semester_teacher`
  ADD CONSTRAINT `FKbt2lx1jh0lplu7mnvwhsash71` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKpk3y2836e0dwtxdb4gk9odfhj` FOREIGN KEY (`semester_type_id`) REFERENCES `semester_type` (`id`);

--
-- Các ràng buộc cho bảng `semester_type`
--
ALTER TABLE `semester_type`
  ADD CONSTRAINT `FKnr7h71k4p2jxpc6o8jj28hava` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`);

--
-- Các ràng buộc cho bảng `student_regis`
--
ALTER TABLE `student_regis`
  ADD CONSTRAINT `FK81879ja0u02mxa3gpj9p9nt30` FOREIGN KEY (`semester_teacher_id`) REFERENCES `semester_teacher` (`id`),
  ADD CONSTRAINT `FKfm58hyeo7kdj557lcs9l600hb` FOREIGN KEY (`semester_company_id`) REFERENCES `semester_company` (`id`),
  ADD CONSTRAINT `FKiltmq3wd88vd17hqj1g76ntrw` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKq6r7e19l5xjmty0j0w6i2inlv` FOREIGN KEY (`authority_name`) REFERENCES `authority` (`name`);

--
-- Các ràng buộc cho bảng `work_progress`
--
ALTER TABLE `work_progress`
  ADD CONSTRAINT `FKl0ik7dw1lsux5ire7vha06lti` FOREIGN KEY (`semester_teacher_id`) REFERENCES `semester_teacher` (`id`);

--
-- Các ràng buộc cho bảng `work_progress_student`
--
ALTER TABLE `work_progress_student`
  ADD CONSTRAINT `FK3frck48ru667g4kjqm6wqdfdh` FOREIGN KEY (`student_regis_id`) REFERENCES `student_regis` (`id`),
  ADD CONSTRAINT `FKauyjjyp052hcora7f9atbvsmf` FOREIGN KEY (`work_process_id`) REFERENCES `work_progress` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
