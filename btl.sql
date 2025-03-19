CREATE DATABASE QuanLyKhoaHocTrucTuyen;
USE QuanLyKhoaHocTrucTuyen;
--Ktra + xoá
IF OBJECT_ID('dbo.tblDangKy', 'U') IS NOT NULL
DROP TABLE dbo.tblDangKy;
IF OBJECT_ID('dbo.tblGiaoVien', 'U') IS NOT NULL
DROP TABLE dbo.tblGiaoVien;
IF OBJECT_ID('dbo.tblKhoaHoc', 'U') IS NOT NULL
DROP TABLE dbo.tblKhoaHoc;
IF OBJECT_ID('dbo.tblHocVien', 'U') IS NOT NULL
DROP TABLE dbo.tblHocVien;
GO

CREATE TABLE tblHocVien (
  MaHocVien VARCHAR(20) PRIMARY KEY,
  TenHocVien NVARCHAR(50),
  NgaySinh DATE,
  GioiTinh NVARCHAR(10)
);
GO

CREATE TABLE tblKhoaHoc (
  MaKhoaHoc VARCHAR(20) PRIMARY KEY,
  TenKhoaHoc NVARCHAR(50),
  MoTa NVARCHAR(255),
  HocPhi DECIMAL
);
GO

ALTER TABLE tblKhoaHoc  
ADD MaGiaoVien VARCHAR(20),  
CONSTRAINT FK_KhoaHoc_GiaoVien FOREIGN KEY (MaGiaoVien) REFERENCES tblGiaoVien(MaGiaoVien);


CREATE TABLE tblGiaoVien (
  MaGiaoVien VARCHAR(20) PRIMARY KEY,
  TenGiaoVien NVARCHAR(50),
  Email NVARCHAR(50),
  SoDienThoai VARCHAR(15)
);
GO

CREATE TABLE tblDangKy (
  MaHocVien VARCHAR(20),
  MaKhoaHoc VARCHAR(20),
  NgayDangKy DATETIME,
  PRIMARY KEY (MaHocVien, MaKhoaHoc),
  FOREIGN KEY (MaHocVien) REFERENCES tblHocVien(MaHocVien),
  FOREIGN KEY (MaKhoaHoc) REFERENCES tblKhoaHoc(MaKhoaHoc)
);
GO

CREATE TABLE tblChuongTrinhHoc (
  MaChuongTrinh VARCHAR(20) PRIMARY KEY,
  MaKhoaHoc VARCHAR(20),
  TenChuongTrinh NVARCHAR(50),
  NoiDung NVARCHAR(255),
  FOREIGN KEY (MaKhoaHoc) REFERENCES tblKhoaHoc(MaKhoaHoc)
);
GO

CREATE TABLE tblLog (
  LogID INT IDENTITY(1,1) PRIMARY KEY,
  Action NVARCHAR(50),
  MaHocVien VARCHAR(20),
  ThoiGian DATETIME DEFAULT GETDATE()
);
GO

-- Tạo bảng tblTuoi
CREATE TABLE tblTuoi (
  MaHocVien VARCHAR(20) PRIMARY KEY,
  Tuoi INT,
  FOREIGN KEY (MaHocVien) REFERENCES tblHocVien(MaHocVien)
);
GO

INSERT INTO tblTuoi (MaHocVien, Tuoi)
SELECT MaHocVien, DATEDIFF(YEAR, NgaySinh, GETDATE()) 
FROM tblHocVien;
GO

SELECT h.MaHocVien, h.TenHocVien, h.NgaySinh, t.Tuoi
FROM tblHocVien h
JOIN tblTuoi t ON h.MaHocVien = t.MaHocVien;
GO

INSERT INTO tblHocVien (MaHocVien, TenHocVien, NgaySinh, GioiTinh, )
VALUES (N'HV01', N'Nguyễn Văn A', '2000-01-01', N'Nam'),
       (N'HV02', N'Trần Thị B', '2001-02-02', N'Nữ'),
       (N'HV03', N'Lê Văn C', '2002-03-03', N'Nam'),
       (N'HV04', N'Phạm Thị D', '2003-04-04', N'Nữ'),
       (N'HV05', N'Hoàng Văn E', '2004-05-05', N'Nam'),
       (N'HV06', N'Nguyễn Thị F', '2005-06-06', N'Nữ'),
       (N'HV07', N'Trần Văn G', '2006-07-07', N'Nam'),
       (N'HV08', N'Lê Thị H', '2007-08-08', N'Nữ'),
       (N'HV09', N'Phạm Văn I', '2008-09-09', N'Nam'),
       (N'HV10', N'Hoàng Thị J', '2009-10-10', N'Nữ'),
       (N'HV11', N'Nguyễn Văn K', '2010-11-11', N'Nam'),
       (N'HV12', N'Trần Thị L', '2011-12-12', N'Nữ'),
       (N'HV13', N'Lê Văn M', '2012-01-13', N'Nam'),
       (N'HV14', N'Phạm Thị N', '2013-02-14', N'Nữ'),
       (N'HV15', N'Hoàng Văn O', '2014-03-15', N'Nam');

INSERT INTO tblKhoaHoc (MaKhoaHoc, TenKhoaHoc, MoTa, HocPhi)
VALUES (N'KH01', N'Lập trình C++', N'Khóa học lập trình C++ từ cơ bản đến nâng cao', 5000000),
       (N'KH02', N'Thiết kế Web', N'Khóa học thiết kế web chuyên nghiệp', 4000000),
       (N'KH03', N'Phân tích dữ liệu', N'Khóa học phân tích dữ liệu với Python', 6000000),
       (N'KH04', N'An ninh mạng', N'Khóa học bảo mật và an ninh mạng', 5500000),
       (N'KH05', N'Lập trình Java', N'Khóa học lập trình Java từ cơ bản đến nâng cao', 5000000),
       (N'KH06', N'Thiết kế đồ họa', N'Khóa học thiết kế đồ họa với Photoshop và Illustrator', 4500000),
       (N'KH07', N'Quản lý dự án', N'Khóa học quản lý dự án chuyên nghiệp', 5000000),
       (N'KH08', N'Machine Learning', N'Khóa học về học máy và trí tuệ nhân tạo', 7000000),
       (N'KH09', N'Marketing số', N'Khóa học marketing số và quảng cáo trực tuyến', 4000000),
       (N'KH10', N'Tiếng Anh giao tiếp', N'Khóa học tiếng Anh giao tiếp hàng ngày', 3000000),
       (N'KH11', N'SEO', N'Khóa học tối ưu hóa công cụ tìm kiếm', 3500000),
       (N'KH12', N'Kinh doanh online', N'Khóa học kinh doanh trực tuyến', 4500000),
       (N'KH13', N'Kỹ năng mềm', N'Khóa học kỹ năng giao tiếp và thuyết trình', 2500000),
       (N'KH14', N'Thiết kế UX/UI', N'Khóa học thiết kế trải nghiệm người dùng', 6000000),
       (N'KH15', N'Blockchain', N'Khóa học về công nghệ chuỗi khối và ứng dụng', 7500000);

INSERT INTO tblGiaoVien (MaGiaoVien, TenGiaoVien, Email, SoDienThoai)
VALUES (N'GV01', N'Nguyễn Văn Tùng', N'tungnguyen@example.com', N'0912345678'),
       (N'GV02', N'Trần Thị Lan', N'lantran@example.com', N'0912345679'),
       (N'GV03', N'Lê Văn Bình', N'binhle@example.com', N'0912345680'),
       (N'GV04', N'Phạm Thị Hoa', N'hoapham@example.com', N'0912345681'),
       (N'GV05', N'Hoàng Văn Phú', N'phuhoang@example.com', N'0912345682'),
       (N'GV06', N'Nguyễn Thị Cẩm', N'camnguyen@example.com', N'0912345683'),
       (N'GV07', N'Trần Văn Cường', N'cuongtran@example.com', N'0912345684'),
       (N'GV08', N'Lê Thị Thu', N'thule@example.com', N'0912345685'),
       (N'GV09', N'Phạm Văn Hùng', N'hungpham@example.com', N'0912345686'),
       (N'GV10', N'Hoàng Thị Linh', N'linhhoang@example.com', N'0912345687'),
       (N'GV11', N'Nguyễn Văn Hòa', N'hoanguyen@example.com', N'0912345688'),
       (N'GV12', N'Trần Thị Trang', N'trangtran@example.com', N'0912345689'),
       (N'GV13', N'Lê Văn Huy', N'huyle@example.com', N'0912345690'),
       (N'GV14', N'Phạm Thị Hạnh', N'hanhpham@example.com', N'0912345691'),
       (N'GV15', N'Hoàng Văn Khải', N'khaikhoang@example.com', N'0912345692');

INSERT INTO tblDangKy (MaHocVien, MaKhoaHoc, NgayDangKy)
VALUES (N'HV01', N'KH01', '2025-03-01 10:00:00'),
       (N'HV02', N'KH02', '2025-03-01 11:00:00'),
       (N'HV03', N'KH03', '2025-03-02 09:00:00'),
       (N'HV04', N'KH04', '2025-03-02 14:00:00'),
       (N'HV05', N'KH05', '2025-03-03 10:00:00'),
       (N'HV06', N'KH06', '2025-03-03 11:00:00'),
       (N'HV07', N'KH07', '2025-03-04 09:00:00'),
       (N'HV08', N'KH08', '2025-03-04 14:00:00'),
       (N'HV09', N'KH09', '2025-03-05 10:00:00'),
       (N'HV10', N'KH10', '2025-03-05 11:00:00'),
       (N'HV11', N'KH11', '2025-03-06 09:00:00'),
       (N'HV12', N'KH12', '2025-03-06 14:00:00'),
       (N'HV13', N'KH13', '2025-03-07 10:00:00'),
       (N'HV14', N'KH14', '2025-03-07 11:00:00'),
       (N'HV15', N'KH15', '2025-03-08 09:00:00');

INSERT INTO tblChuongTrinhHoc (MaChuongTrinh, MaKhoaHoc, TenChuongTrinh, NoiDung)
VALUES (N'CT01', N'KH01', N'Lập trình cơ bản', N'Lập trình C++ từ cơ bản đến nâng cao'),
       (N'CT02', N'KH02', N'Thiết kế Web', N'Thiết kế web chuyên nghiệp với HTML, CSS, JavaScript'),
       (N'CT03', N'KH03', N'Phân tích dữ liệu', N'Phân tích dữ liệu với Python và các công cụ hỗ trợ'),
       (N'CT04', N'KH04', N'An ninh mạng', N'Bảo mật và an ninh mạng trong thời đại số'),
       (N'CT05', N'KH05', N'Lập trình Java', N'Lập trình Java từ cơ bản đến nâng cao'),
       (N'CT06', N'KH06', N'Thiết kế đồ họa', N'Thiết kế đồ họa với Photoshop và Illustrator'),
       (N'CT07', N'KH07', N'Quản lý dự án', N'Quản lý dự án chuyên nghiệp với các phương pháp hiện đại'),
       (N'CT08', N'KH08', N'Machine Learning', N'Học máy và trí tuệ nhân tạo'),
       (N'CT09', N'KH09', N'Marketing số', N'Marketing số và quảng cáo trực tuyến'),
       (N'CT10', N'KH10', N'Tiếng Anh giao tiếp', N'Tiếng Anh giao tiếp hàng ngày cho người mới bắt đầu'),
       (N'CT11', N'KH11', N'SEO', N'Tối ưu hóa công cụ tìm kiếm'),
       (N'CT12', N'KH12', N'Kinh doanh online', N'Kinh doanh trực tuyến hiệu quả'),
       (N'CT13', N'KH13', N'Kỹ năng mềm', N'Kỹ năng giao tiếp và thuyết trình'),
       (N'CT14', N'KH14', N'Thiết kế UX/UI', N'Thiết kế trải nghiệm người dùng'),
       (N'CT15', N'KH15', N'Blockchain', N'Công nghệ chuỗi khối và ứng dụng');

-- Chương 4:Tạo View
CREATE VIEW vwDanhSachHocVien AS
SELECT MaHocVien, TenHocVien, NgaySinh, GioiTinh
FROM tblHocVien;

SELECT * FROM vwDanhSachHocVien;
GO

CREATE VIEW vwThongTinHocVien AS
SELECT MaHocVien, TenHocVien, NgaySinh, GioiTinh
FROM tblHocVien;

SELECT * FROM vwThongTinHocVien;
GO
CREATE VIEW vwThongTinKhoaHoc AS
SELECT MaKhoaHoc, TenKhoaHoc, MoTa, HocPhi
FROM tblKhoaHoc;

SELECT * FROM vwThongTinKhoaHoc;
GO

CREATE VIEW vwThongTinGiaoVien AS
SELECT MaGiaoVien, TenGiaoVien, Email, SoDienThoai
FROM tblGiaoVien; 

SELECT * FROM vwThongTinGiaoVien;
GO

CREATE VIEW vwDanhSachDangKyHocVien AS
SELECT MaHocVien, MaKhoaHoc, NgayDangKy
FROM tblDangKy;

SELECT * FROM vwDanhSachDangKyHocVien;

CREATE VIEW vwChuongTrinhHoc AS
SELECT MaChuongTrinh, MaKhoaHoc, TenChuongTrinh, NoiDung
FROM tblChuongTrinhHoc;

SELECT * FROM vwChuongTrinhHoc;
GO

CREATE VIEW vwHocVienKhoaHoc AS
SELECT hv.MaHocVien, hv.TenHocVien, kh.MaKhoaHoc, kh.TenKhoaHoc
FROM tblHocVien hv
JOIN tblDangKy dk ON hv.MaHocVien = dk.MaHocVien
JOIN tblKhoaHoc kh ON dk.MaKhoaHoc = kh.MaKhoaHoc;
 
SELECT * FROM vwHocVienKhoaHoc;
GO

CREATE VIEW vwGiaoVienDayKhoaHoc AS
SELECT gv.MaGiaoVien, gv.TenGiaoVien, kh.MaKhoaHoc, kh.TenKhoaHoc
FROM tblGiaoVien gv
JOIN tblChuongTrinhHoc cth ON gv.MaGiaoVien = cth.MaKhoaHoc
JOIN tblKhoaHoc kh ON cth.MaKhoaHoc = kh.MaKhoaHoc;
SELECT * FROM vwGiaoVienDayKhoaHoc;
GO

CREATE VIEW vwThongTinChiTietKhoaHoc AS
SELECT kh.MaKhoaHoc, kh.TenKhoaHoc, kh.MoTa, kh.HocPhi, cth.TenChuongTrinh, cth.NoiDung
FROM tblKhoaHoc kh
JOIN tblChuongTrinhHoc cth ON kh.MaKhoaHoc = cth.MaKhoaHoc;

SELECT * FROM vwThongTinChiTietKhoaHoc;
GO

CREATE VIEW vwThongTinChiTietHocVien AS
SELECT hv.MaHocVien, hv.TenHocVien, hv.NgaySinh, hv.GioiTinh, kh.TenKhoaHoc
FROM tblHocVien hv
JOIN tblDangKy dk ON hv.MaHocVien = dk.MaHocVien
JOIN tblKhoaHoc kh ON dk.MaKhoaHoc = kh.MaKhoaHoc;

SELECT * FROM vwThongTinChiTietHocVien;
GO

CREATE VIEW vwDoanhThuKhoaHoc AS
SELECT kh.MaKhoaHoc, kh.TenKhoaHoc, SUM(kh.HocPhi) AS DoanhThu
FROM tblDangKy dk
JOIN tblKhoaHoc kh ON dk.MaKhoaHoc = kh.MaKhoaHoc
GROUP BY kh.MaKhoaHoc, kh.TenKhoaHoc;

SELECT * FROM vwDoanhThuKhoaHoc;
GO

-- Chương 5:
CREATE PROCEDURE spTimKiemKhoaHoc
@TenKhoaHoc NVARCHAR(50)
AS
BEGIN
  SELECT MaKhoaHoc, TenKhoaHoc, MoTa, HocPhi
  FROM tblKhoaHoc
  WHERE TenKhoaHoc LIKE '%' + @TenKhoaHoc + '%';
END;
GO

CREATE PROCEDURE spDanhSachHocVien
AS
BEGIN
  SELECT MaHocVien, TenHocVien, NgaySinh, GioiTinh
  FROM tblHocVien;
END;
GO

CREATE PROCEDURE spDanhSachKhoaHoc
AS
BEGIN
  SELECT MaKhoaHoc, TenKhoaHoc, MoTa, HocPhi
  FROM tblKhoaHoc;
END;
GO

CREATE PROCEDURE spDanhSachGiaoVien
AS
BEGIN
  SELECT MaGiaoVien, TenGiaoVien, Email, SoDienThoai
  FROM tblGiaoVien;
END;
GO

CREATE PROCEDURE spDanhSachDangKy
AS
BEGIN
  SELECT MaHocVien, MaKhoaHoc, NgayDangKy
  FROM tblDangKy;
END;
GO

CREATE PROCEDURE spChuongTrinhHoc
AS
BEGIN
  SELECT MaChuongTrinh, MaKhoaHoc, TenChuongTrinh, NoiDung
  FROM tblChuongTrinhHoc;
END;
GO

CREATE PROCEDURE spThongTinHocVien
@MaHocVien VARCHAR(20)
AS
BEGIN
  SELECT MaHocVien, TenHocVien, NgaySinh, GioiTinh
  FROM tblHocVien
  WHERE MaHocVien = @MaHocVien;
END;
GO

CREATE PROCEDURE spThongTinKhoaHoc
@MaKhoaHoc VARCHAR(20)
AS
BEGIN
  SELECT MaKhoaHoc, TenKhoaHoc, MoTa, HocPhi
  FROM tblKhoaHoc
  WHERE MaKhoaHoc = @MaKhoaHoc;
END;
GO

CREATE PROCEDURE spThongTinGiaoVien
@MaGiaoVien VARCHAR(20)
AS
BEGIN
  SELECT MaGiaoVien, TenGiaoVien, Email, SoDienThoai
  FROM tblGiaoVien
  WHERE MaGiaoVien = @MaGiaoVien;
END;
GO

CREATE PROCEDURE spDangKyKhoaHoc
@MaHocVien VARCHAR(20),
@MaKhoaHoc VARCHAR(20),
@NgayDangKy DATETIME
AS
BEGIN
  INSERT INTO tblDangKy (MaHocVien, MaKhoaHoc, NgayDangKy)
  VALUES (@MaHocVien, @MaKhoaHoc, @NgayDangKy);
END;
GO

CREATE PROCEDURE spHuyDangKyKhoaHoc
@MaHocVien VARCHAR(20),
@MaKhoaHoc VARCHAR(20)
AS
BEGIN
  DELETE FROM tblDangKy
  WHERE MaHocVien = @MaHocVien AND MaKhoaHoc = @MaKhoaHoc;
END;
GO

--Chạy
EXEC spTimKiemKhoaHoc @TenKhoaHoc = N'Khoá học';-- Ví dụ: An ninh mạng
EXEC spDanhSachHocVien;
EXEC spDanhSachKhoaHoc;
EXEC spDanhSachGiaoVien;
EXEC spDanhSachDangKy;
EXEC spChuongTrinhHoc;
EXEC spThongTinHocVien @MaHocVien = 'Nhập mã học viên';--Ví dụ: HV10
EXEC spThongTinKhoaHoc @MaKhoaHoc = 'Mã Khóa Học';--Ví dụ: KH01
EXEC spThongTinGiaoVien @MaGiaoVien = 'Mã Giáo Viên';
EXEC spDangKyKhoaHoc @MaHocVien = 'Mã Học Viên', @MaKhoaHoc = 'Mã Khóa Học', @NgayDangKy = 'Ngày Đăng Ký';
EXEC spHuyDangKyKhoaHoc @MaHocVien = 'Mã Học Viên', @MaKhoaHoc = 'Mã Khóa Học';

EXEC spDangKyKhoaHoc @MaHocVien = 'HV11', @MaKhoaHoc = 'KH10', @NgayDangKy = '10/09/2025';
EXEC spHuyDangKyKhoaHoc @MaHocVien = 'HV11', @MaKhoaHoc = 'KH10';


--Chương 6:
CREATE TRIGGER trgSauInsertHocVien
ON tblHocVien
AFTER INSERT
AS
BEGIN
  PRINT 'Hoc vien moi da duoc them vao he thong!';
END;
GO

ALTER TABLE tblKhoaHoc
ADD SoLuongHocVien INT DEFAULT 0;

CREATE TRIGGER trgCapNhatSoLuongHocVienDangKy
ON tblDangKy
AFTER INSERT, DELETE
AS
BEGIN
  IF EXISTS (SELECT * FROM inserted)
  BEGIN
    UPDATE tblKhoaHoc
    SET SoLuongHocVien = SoLuongHocVien + 1
    WHERE MaKhoaHoc IN (SELECT MaKhoaHoc FROM inserted);
  END

  IF EXISTS (SELECT * FROM deleted)
  BEGIN
    UPDATE tblKhoaHoc
    SET SoLuongHocVien = SoLuongHocVien - 1
    WHERE MaKhoaHoc IN (SELECT MaKhoaHoc FROM deleted);
  END
END;
GO

-- Trigger kiểm tra độ dài tên học viên trước khi chèn
CREATE TRIGGER trgKiemTraTenHocVien
ON tblHocVien
INSTEAD OF INSERT
AS
BEGIN
  IF EXISTS (SELECT * FROM inserted WHERE LEN(TenHocVien) < 5)
  BEGIN
    RAISERROR ('Tên học viên phải có ít nhất 5 ký tự', 16, 1);
  END
  ELSE
  BEGIN
    INSERT INTO tblHocVien (MaHocVien, TenHocVien, NgaySinh, GioiTinh)
    SELECT MaHocVien, TenHocVien, NgaySinh, GioiTinh FROM inserted;
  END
END;
GO

-- Trigger tự động ghi log khi xóa học viên
CREATE TRIGGER trgGhiLogXoaHocVien
ON tblHocVien
AFTER DELETE
AS
BEGIN
  INSERT INTO tblLog (Action, MaHocVien, ThoiGian)
  SELECT 'Xóa', MaHocVien, GETDATE() FROM deleted;
END;
GO

-- Trigger tự động cập nhật tổng số khóa học đã đăng ký khi chèn học viên
ALTER TABLE tblHocVien
ADD TongSoKhoaHoc INT DEFAULT 0;

CREATE TRIGGER trgCapNhatTongSoKhoaHocDangKy
ON tblDangKy
AFTER INSERT
AS
BEGIN
  UPDATE tblHocVien
  SET TongSoKhoaHoc = TongSoKhoaHoc + 1
  WHERE MaHocVien IN (SELECT MaHocVien FROM inserted);
END;
GO

-- Tạo trigger kiểm tra tuổi học viên trước khi chèn
CREATE TRIGGER trgKiemTraTuoiHocVien
ON tblHocVien
AFTER INSERT
AS
BEGIN
  IF EXISTS (SELECT * FROM inserted WHERE DATEDIFF(YEAR, NgaySinh, GETDATE()) < 18)
  BEGIN
    -- Xóa bản ghi đã chèn nếu học viên không đủ 18 tuổi
    DELETE FROM tblHocVien
    WHERE MaHocVien IN (SELECT MaHocVien FROM inserted WHERE DATEDIFF(YEAR, NgaySinh, GETDATE()) < 18);
    
    -- Gửi thông báo lỗi
    RAISERROR ('Học viên phải đủ 18 tuổi trở lên', 16, 1);
  END
END;
GO


-- Trigger tự động cập nhật ngày cập nhật cuối cùng khi chỉnh sửa khóa học
ALTER TABLE tblKhoaHoc
ADD NgayCapNhatCuoi DATETIME DEFAULT GETDATE();

CREATE TRIGGER trgCapNhatNgayCapNhatKhoaHoc
ON tblKhoaHoc
AFTER UPDATE
AS
BEGIN
  UPDATE tblKhoaHoc
  SET NgayCapNhatCuoi = GETDATE()
  WHERE MaKhoaHoc IN (SELECT MaKhoaHoc FROM inserted);
END;
GO

-- Trigger tự động ghi log khi chèn giáo viên
CREATE TRIGGER trgGhiLogChenGiaoVien
ON tblGiaoVien
AFTER INSERT
AS
BEGIN
  INSERT INTO tblLog (Action, MaGiaoVien, ThoiGian)
  SELECT 'Chèn', MaGiaoVien, GETDATE() FROM inserted;
END;
GO

-- Trigger kiểm tra học phí khóa học trước khi chèn
CREATE TRIGGER trgKiemTraHocPhiKhoaHoc
ON tblKhoaHoc
INSTEAD OF INSERT
AS
BEGIN
  IF EXISTS (SELECT * FROM inserted WHERE HocPhi < 0)
  BEGIN
    RAISERROR ('Học phí không được nhỏ hơn 0', 16, 1);
  END
  ELSE
  BEGIN
    INSERT INTO tblKhoaHoc (MaKhoaHoc, TenKhoaHoc, MoTa, HocPhi)
    SELECT MaKhoaHoc, TenKhoaHoc, MoTa, HocPhi FROM inserted;
  END
END;
GO

-- Trigger tự động ghi log khi cập nhật thông tin học viên
CREATE TRIGGER trgGhiLogCapNhatHocVien
ON tblHocVien
AFTER UPDATE
AS
BEGIN
  INSERT INTO tblLog (Action, MaHocVien, ThoiGian)
  SELECT 'Cập nhật', MaHocVien, GETDATE() FROM inserted;
END;
GO

-- Trigger tự động cập nhật trạng thái khóa học khi đủ số lượng học viên đăng ký
ALTER TABLE tblKhoaHoc
ADD TrangThai NVARCHAR(50) DEFAULT 'Chưa đủ số lượng';

CREATE TRIGGER trgCapNhatTrangThaiKhoaHoc
ON tblDangKy
AFTER INSERT
AS
BEGIN
  IF EXISTS (SELECT MaKhoaHoc FROM tblKhoaHoc WHERE SoLuongHocVien >= 20)
  BEGIN
    UPDATE tblKhoaHoc
    SET TrangThai = 'Đủ số lượng'
    WHERE MaKhoaHoc IN (SELECT MaKhoaHoc FROM inserted);
  END
END;
GO






--Chuơng 7:
-- Kiểm tra và tạo login TaiKhoanQuanLy
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'TaiKhoanQuanLy')
BEGIN
    CREATE LOGIN TaiKhoanQuanLy WITH PASSWORD = '123123';
END;

-- Kiểm tra và tạo login TaiKhoanNhanVien
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'TaiKhoanNhanVien')
BEGIN
    CREATE LOGIN TaiKhoanNhanVien WITH PASSWORD = 'mnbvcxz';
END;

-- Kiểm tra và tạo login TaiKhoanKhachHang
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'TaiKhoanKhachHang')
BEGIN
    CREATE LOGIN TaiKhoanKhachHang WITH PASSWORD = '1234jqk';
END;

-- Tạo các user trong cơ sở dữ liệu hiện tại
CREATE USER TaiKhoanQuanLy FOR LOGIN TaiKhoanQuanLy;
CREATE USER TaiKhoanNhanVien FOR LOGIN TaiKhoanNhanVien;
CREATE USER TaiKhoanKhachHang FOR LOGIN TaiKhoanKhachHang;

-- Gán quyền cho các tài khoản
ALTER ROLE db_owner ADD MEMBER TaiKhoanQuanLy;
ALTER ROLE db_datareader ADD MEMBER TaiKhoanNhanVien;
ALTER ROLE db_datawriter ADD MEMBER TaiKhoanNhanVien;

-- Hiển thị danh sách các login đã tạo
SELECT name, type_desc
FROM sys.server_principals
WHERE name IN ('TaiKhoanQuanLy', 'TaiKhoanNhanVien', 'TaiKhoanKhachHang');

-- Hiển thị danh sách các user đã tạo trong cơ sở dữ liệu hiện tại
SELECT name, type_desc
FROM sys.database_principals
WHERE name IN ('TaiKhoanQuanLy', 'TaiKhoanNhanVien', 'TaiKhoanKhachHang');

-- Hiển thị các thành viên của vai trò db_owner
SELECT DP1.name AS RoleName, DP2.name AS MemberName
FROM sys.database_role_members AS DRM
JOIN sys.database_principals AS DP1 ON DRM.role_principal_id = DP1.principal_id
JOIN sys.database_principals AS DP2 ON DRM.member_principal_id = DP2.principal_id
WHERE DP1.name = 'db_owner';

-- Hiển thị các thành viên của vai trò db_datareader
SELECT DP1.name AS RoleName, DP2.name AS MemberName
FROM sys.database_role_members AS DRM
JOIN sys.database_principals AS DP1 ON DRM.role_principal_id = DP1.principal_id
JOIN sys.database_principals AS DP2 ON DRM.member_principal_id = DP2.principal_id
WHERE DP1.name = 'db_datareader';

-- Hiển thị các thành viên của vai trò db_datawriter
SELECT DP1.name AS RoleName, DP2.name AS MemberName
FROM sys.database_role_members AS DRM
JOIN sys.database_principals AS DP1 ON DRM.role_principal_id = DP1.principal_id
JOIN sys.database_principals AS DP2 ON DRM.member_principal_id = DP2.principal_id
WHERE DP1.name = 'db_datawriter';

INSERT INTO tblHocVien (MaHocVien, TenHocVien, NgaySinh, GioiTinh)
VALUES (N'HV26', N'Nguyễn Văn T', '2005-04-16', N'Nam');

INSERT INTO tblHocVien (MaHocVien, TenHocVien, NgaySinh, GioiTinh)
VALUES (N'HV27', N'Nguyễn Văn TT', '2010-04-16', N'Nam');

INSERT INTO tblHocVien (MaHocVien, TenHocVien, NgaySinh, GioiTinh)
VALUES (N'HV28', N'Nguyễn Văn TT', '2006-04-16', N'Nam');

SHOW ENGINE INNODB STATUS; 