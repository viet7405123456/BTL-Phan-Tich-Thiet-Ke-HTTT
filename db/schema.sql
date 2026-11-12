-- LibMan - Schema CSDL, sinh tu "2_SoDoThietKeCSDL.puml"
-- Giu nguyen ten bang/cot theo dung so do thiet ke CSDL da np.

CREATE DATABASE IF NOT EXISTS libman CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE libman;

-- ========== Nguoi dung (Member / Reader / Staff) ==========
CREATE TABLE tblMember8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tendangnhap VARCHAR(100) NOT NULL UNIQUE,
  matkhau VARCHAR(255) NOT NULL,
  hoten VARCHAR(100) NOT NULL,
  ngaysinh DATE,
  gioitinh BIT,
  diachi VARCHAR(255),
  email VARCHAR(100),
  sodienthoai VARCHAR(15)
) ENGINE=InnoDB;

CREATE TABLE tblReader8 (
  id INT PRIMARY KEY,
  mabandoc VARCHAR(20) UNIQUE,
  loaibandoc VARCHAR(30),
  mathe VARCHAR(20),
  ngaycapthe DATE,
  ngayhethanthe DATE,
  trangthaithe VARCHAR(30),
  CONSTRAINT fk_reader_member FOREIGN KEY (id) REFERENCES tblMember8(id)
) ENGINE=InnoDB;

CREATE TABLE tblStaff8 (
  id INT PRIMARY KEY,
  manhanvien VARCHAR(20) UNIQUE,
  chucvu VARCHAR(50),
  CONSTRAINT fk_staff_member FOREIGN KEY (id) REFERENCES tblMember8(id)
) ENGINE=InnoDB;

CREATE TABLE tblLibraryStaff8 (
  id INT PRIMARY KEY,
  CONSTRAINT fk_librarystaff_staff FOREIGN KEY (id) REFERENCES tblStaff8(id)
) ENGINE=InnoDB;

CREATE TABLE tblManager8 (
  id INT PRIMARY KEY,
  CONSTRAINT fk_manager_staff FOREIGN KEY (id) REFERENCES tblStaff8(id)
) ENGINE=InnoDB;

-- ========== Tai lieu ==========
CREATE TABLE tblDocumentType8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  maloai VARCHAR(20) UNIQUE,
  tenloai VARCHAR(100),
  mota VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE tblPublisher8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  manhaxuatban VARCHAR(20) UNIQUE,
  tennhaxuatban VARCHAR(150),
  diachi VARCHAR(255),
  sodienthoai VARCHAR(15),
  email VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE tblDocument8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  matailieu VARCHAR(20) UNIQUE,
  tentailieu VARCHAR(255) NOT NULL,
  namxuatban INT,
  dongia FLOAT,
  mota VARCHAR(255),
  tblDocumentTypeid INT,
  tblPublisherid INT,
  CONSTRAINT fk_document_type FOREIGN KEY (tblDocumentTypeid) REFERENCES tblDocumentType8(id),
  CONSTRAINT fk_document_publisher FOREIGN KEY (tblPublisherid) REFERENCES tblPublisher8(id)
) ENGINE=InnoDB;

CREATE TABLE tblDocumentCopy8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mabansao VARCHAR(20) UNIQUE,
  vitriluutru VARCHAR(100),
  tinhtrangbansao VARCHAR(30),
  trangthaimuon VARCHAR(30),
  tblDocumentid INT NOT NULL,
  CONSTRAINT fk_copy_document FOREIGN KEY (tblDocumentid) REFERENCES tblDocument8(id)
) ENGINE=InnoDB;

CREATE TABLE tblAuthor8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  matacgia VARCHAR(20) UNIQUE,
  tentacgia VARCHAR(100),
  quoctich VARCHAR(50),
  mota VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE tblDocumentAuthor8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tblDocumentid INT NOT NULL,
  tblAuthorid INT NOT NULL,
  CONSTRAINT fk_da_document FOREIGN KEY (tblDocumentid) REFERENCES tblDocument8(id),
  CONSTRAINT fk_da_author FOREIGN KEY (tblAuthorid) REFERENCES tblAuthor8(id)
) ENGINE=InnoDB;

-- ========== Nha cung cap / Nhap sach ==========
CREATE TABLE tblSupplier8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  manhacungcap VARCHAR(20) UNIQUE,
  ten VARCHAR(150),
  diachi VARCHAR(255),
  sodienthoai VARCHAR(15),
  email VARCHAR(100),
  nguoilienhe VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE tblImportSlip8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  maphieunhap VARCHAR(20) UNIQUE,
  ngaynhap DATE,
  tblSupplierid INT,
  tblLibraryStaffid INT,
  CONSTRAINT fk_import_supplier FOREIGN KEY (tblSupplierid) REFERENCES tblSupplier8(id),
  CONSTRAINT fk_import_staff FOREIGN KEY (tblLibraryStaffid) REFERENCES tblLibraryStaff8(id)
) ENGINE=InnoDB;

CREATE TABLE tblImportDetail8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  soluongnhap INT,
  dongia FLOAT,
  tblImportSlipid INT NOT NULL,
  tblDocumentid INT NOT NULL,
  CONSTRAINT fk_importdetail_slip FOREIGN KEY (tblImportSlipid) REFERENCES tblImportSlip8(id),
  CONSTRAINT fk_importdetail_document FOREIGN KEY (tblDocumentid) REFERENCES tblDocument8(id)
) ENGINE=InnoDB;

-- ========== Muon / Tra ==========
CREATE TABLE tblBorrowSlip8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  maphieumuon VARCHAR(20) UNIQUE,
  ngaymuon DATE,
  ngayhentra DATE,
  trangthai VARCHAR(30),
  tblReaderid INT NOT NULL,
  tblLibraryStaffid INT,
  CONSTRAINT fk_borrowslip_reader FOREIGN KEY (tblReaderid) REFERENCES tblReader8(id),
  CONSTRAINT fk_borrowslip_staff FOREIGN KEY (tblLibraryStaffid) REFERENCES tblLibraryStaff8(id)
) ENGINE=InnoDB;

CREATE TABLE tblBorrowDetail8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tinhtrangbansaokhimuon VARCHAR(30),
  tblBorrowSlipid INT NOT NULL,
  tblDocumentCopyid INT NOT NULL,
  CONSTRAINT fk_borrowdetail_slip FOREIGN KEY (tblBorrowSlipid) REFERENCES tblBorrowSlip8(id),
  CONSTRAINT fk_borrowdetail_copy FOREIGN KEY (tblDocumentCopyid) REFERENCES tblDocumentCopy8(id)
) ENGINE=InnoDB;

CREATE TABLE tblReturnSlip8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  maphieutra VARCHAR(20) UNIQUE,
  ngaytra DATE,
  ghichu VARCHAR(255),
  tblReaderid INT NOT NULL,
  tblLibraryStaffid INT,
  CONSTRAINT fk_returnslip_reader FOREIGN KEY (tblReaderid) REFERENCES tblReader8(id),
  CONSTRAINT fk_returnslip_staff FOREIGN KEY (tblLibraryStaffid) REFERENCES tblLibraryStaff8(id)
) ENGINE=InnoDB;

CREATE TABLE tblReturnDetail8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tinhtrangtailieu VARCHAR(30),
  tblReturnSlipid INT NOT NULL,
  tblBorrowDetailid INT NOT NULL UNIQUE,
  CONSTRAINT fk_returndetail_slip FOREIGN KEY (tblReturnSlipid) REFERENCES tblReturnSlip8(id),
  CONSTRAINT fk_returndetail_borrowdetail FOREIGN KEY (tblBorrowDetailid) REFERENCES tblBorrowDetail8(id)
) ENGINE=InnoDB;

CREATE TABLE tblPenaltyType8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  maloaiphat VARCHAR(20) UNIQUE,
  tenloaiphat VARCHAR(100),
  cachtinhphat VARCHAR(30),
  mucphat FLOAT,
  mota VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE tblPenaltyDetail8 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  sotienphat FLOAT,
  ghichu VARCHAR(255),
  tblReturnDetailid INT NOT NULL,
  tblPenaltyTypeid INT NOT NULL,
  CONSTRAINT fk_penaltydetail_returndetail FOREIGN KEY (tblReturnDetailid) REFERENCES tblReturnDetail8(id),
  CONSTRAINT fk_penaltydetail_type FOREIGN KEY (tblPenaltyTypeid) REFERENCES tblPenaltyType8(id)
) ENGINE=InnoDB;
