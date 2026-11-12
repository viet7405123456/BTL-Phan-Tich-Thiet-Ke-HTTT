USE libman;

-- ===== Thanh vien (Member) =====
-- id=1, 5, 6, 7: chua dang ki the ban doc -> dung de demo luong "Dang ki lam the ban doc"
-- id=2, 8, 9, 10: da co the hieu luc + co lich su muon -> dung de demo Module 2
-- id=3: quan li
-- id=4: nhan vien thu thu
INSERT INTO tblMember8 (id, tendangnhap, matkhau, hoten, ngaysinh, gioitinh, diachi, email, sodienthoai) VALUES
(1, 'hoanglan',  '123456', N'Hoàng Thị Lan',      '2003-05-12', 0, N'Hà Nội',      'hoanglan@example.com', '0901111111'),
(2, 'tranbinh',  '123456', N'Trần Văn Bình',      '2002-09-20', 1, N'Hải Phòng',   'tranbinh@example.com', '0902222222'),
(3, 'quanlivien','123456', N'Nguyễn Thị Quản Lý', '1990-01-15', 0, N'Hà Nội',      'quanli@example.com',   '0903333333'),
(4, 'thuthu',    '123456', N'Lê Văn Thủ Thư',     '1995-03-08', 1, N'Hà Nội',      'thuthu@example.com',   '0904444444'),
(5, 'phamhoa',   '123456', N'Phạm Thị Hoa',       '2004-02-18', 0, N'Hà Nội',      'phamhoa@example.com',  '0905555555'),
(6, 'dovanminh', '123456', N'Đỗ Văn Minh',        '2003-11-02', 1, N'Nam Định',    'dovanminh@example.com','0906666666'),
(7, 'vuthingoc', '123456', N'Vũ Thị Ngọc',        '2002-07-25', 0, N'Hải Dương',   'vuthingoc@example.com','0907777777'),
-- id=8,9,10: da co the hieu luc -> them du lieu lich su muon cho Module 2 phong phu hon
(8, 'lequynh',   '123456', N'Lê Thị Quỳnh',       '2001-03-11', 0, N'Hà Nội',      'lequynh@example.com',  '0908888881'),
(9, 'phambao',   '123456', N'Phạm Gia Bảo',       '1985-06-22', 1, N'Đà Nẵng',     'phambao@example.com',  '0908888882'),
(10,'tranmylinh','123456', N'Trần Mỹ Linh',       '2000-12-01', 0, N'TP.HCM',      'tranmylinh@example.com','0908888883');

-- Member id=2, 8, 9, 10 da la Reader (co the hieu luc)
INSERT INTO tblReader8 (id, mabandoc, loaibandoc, mathe, ngaycapthe, ngayhethanthe, trangthaithe) VALUES
(2, 'BD0002', N'Sinh viên',  'THE0002', '2025-09-01', '2027-09-01', N'Hiệu lực'),
(8, 'BD0008', N'Sinh viên',  'THE0008', '2025-10-01', '2027-10-01', N'Hiệu lực'),
(9, 'BD0009', N'Giảng viên', 'THE0009', '2025-08-15', '2029-08-15', N'Hiệu lực'),
(10,'BD0010', N'Sinh viên',  'THE0010', '2025-11-01', '2027-11-01', N'Hiệu lực');

-- Member id=3, id=4 la Staff
INSERT INTO tblStaff8 (id, manhanvien, chucvu) VALUES
(3, 'NV0003', N'Quản lí thư viện'),
(4, 'NV0004', N'Thủ thư');

INSERT INTO tblManager8 (id) VALUES (3);
INSERT INTO tblLibraryStaff8 (id) VALUES (4);

-- ===== Tai lieu =====
INSERT INTO tblDocumentType8 (id, maloai, tenloai, mota) VALUES
(1, 'LT01', N'Công nghệ thông tin', N'Sách chuyên ngành CNTT'),
(2, 'LT02', N'Văn học',             N'Sách văn học, tiểu thuyết'),
(3, 'LT03', N'Kinh tế',             N'Sách chuyên ngành kinh tế');

INSERT INTO tblPublisher8 (id, manhaxuatban, tennhaxuatban, diachi, sodienthoai, email) VALUES
(1, 'NXB01', N'NXB Giáo dục Việt Nam', N'Hà Nội',  '0243333333', 'contact@nxbgd.vn'),
(2, 'NXB02', N'NXB Trẻ',               N'TP.HCM',  '0283222222', 'contact@nxbtre.com.vn');

INSERT INTO tblDocument8 (id, matailieu, tentailieu, namxuatban, dongia, mota, tblDocumentTypeid, tblPublisherid) VALUES
(1, 'TL001', N'Nhập môn Công nghệ phần mềm', 2022, 85000, N'Giáo trình nhập môn', 1, 1),
(2, 'TL002', N'Cơ sở dữ liệu nâng cao',      2021, 95000, N'Giáo trình chuyên sâu', 1, 1),
(3, 'TL003', N'Lập trình Java căn bản',      2023, 75000, N'Giáo trình lập trình', 1, 1),
(4, 'TL004', N'Truyện Kiều',                 2020, 45000, N'Tác phẩm văn học cổ điển', 2, 2),
(5, 'TL005', N'Kinh tế vĩ mô',               2022, 90000, N'Giáo trình kinh tế', 3, 1),
(6, 'TL006', N'Mạng máy tính',               2021, 80000, N'Giáo trình chuyên ngành', 1, 1),
(7, 'TL007', N'Số đỏ',                       2019, 40000, N'Tiểu thuyết văn học', 2, 2);

INSERT INTO tblDocumentCopy8 (id, mabansao, vitriluutru, tinhtrangbansao, trangthaimuon, tblDocumentid) VALUES
(1,  'TL001-01', N'Kệ A1', N'Tốt', N'Đang được mượn', 1),
(2,  'TL001-02', N'Kệ A1', N'Tốt', N'Sẵn sàng',       1),
(3,  'TL002-01', N'Kệ A2', N'Tốt', N'Đang được mượn', 2),
(4,  'TL003-01', N'Kệ A3', N'Tốt', N'Đang được mượn', 3),
(5,  'TL003-02', N'Kệ A3', N'Tốt', N'Đang được mượn', 3),
(6,  'TL004-01', N'Kệ B1', N'Tốt', N'Đang được mượn', 4),
(7,  'TL004-02', N'Kệ B1', N'Tốt', N'Đang được mượn', 4),
(8,  'TL005-01', N'Kệ C1', N'Tốt', N'Đang được mượn', 5),
(9,  'TL005-02', N'Kệ C1', N'Tốt', N'Sẵn sàng',       5),
(10, 'TL006-01', N'Kệ A4', N'Tốt', N'Đang được mượn', 6),
(11, 'TL006-02', N'Kệ A4', N'Tốt', N'Sẵn sàng',       6),
(12, 'TL007-01', N'Kệ B2', N'Tốt', N'Đang được mượn', 7),
(13, 'TL007-02', N'Kệ B2', N'Tốt', N'Sẵn sàng',       7);

-- ===== Phieu muon (du lieu de Module 2 thong ke co ket qua, trai dai nhieu thang) =====
INSERT INTO tblBorrowSlip8 (id, maphieumuon, ngaymuon, ngayhentra, trangthai, tblReaderid, tblLibraryStaffid) VALUES
(1,  'PM0001', '2026-01-10', '2026-01-24', N'Đang mượn', 2, 4),
(2,  'PM0002', '2026-02-05', '2026-02-19', N'Đang mượn', 2, 4),
(3,  'PM0003', '2026-01-15', '2026-01-29', N'Đang mượn', 8, 4),
(4,  'PM0004', '2026-03-01', '2026-03-15', N'Đang mượn', 9, 4),
(5,  'PM0005', '2026-04-10', '2026-04-24', N'Đang mượn', 10,4),
(6,  'PM0006', '2026-05-05', '2026-05-19', N'Đang mượn', 2, 4),
(7,  'PM0007', '2026-06-12', '2026-06-26', N'Đang mượn', 8, 4),
(8,  'PM0008', '2026-07-20', '2026-08-03', N'Đang mượn', 9, 4),
(9,  'PM0009', '2026-08-15', '2026-08-29', N'Đang mượn', 10,4),
(10, 'PM0010', '2026-09-10', '2026-09-24', N'Đang mượn', 2, 4);

INSERT INTO tblBorrowDetail8 (id, tinhtrangbansaokhimuon, tblBorrowSlipid, tblDocumentCopyid) VALUES
(1,  N'Tốt', 1,  1),
(2,  N'Tốt', 2,  3),
(3,  N'Tốt', 3,  4),
(4,  N'Tốt', 4,  6),
(5,  N'Tốt', 5,  8),
(6,  N'Tốt', 6,  2),
(7,  N'Tốt', 7,  10),
(8,  N'Tốt', 8,  5),
(9,  N'Tốt', 9,  12),
(10, N'Tốt', 10, 7);
