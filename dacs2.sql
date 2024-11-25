CREATE DATABASE dacs3;
GO

USE dacs3;
GO

-- Tạo bảng taikhoan
CREATE TABLE taikhoan (
    id INT IDENTITY(1,1) PRIMARY KEY,
    hoten VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    diachi VARCHAR(100) NOT NULL,
    sdt INT NOT NULL
);

INSERT INTO taikhoan (hoten, username, password, diachi, sdt) VALUES
('Nguyen A', 'admin', 'admin123', 'Quảng Trị', 123456789),
('Nguyen B', 'user1', 'user123', 'Đà Nẵng', 987654321);

-- Tạo bảng danhmuc
CREATE TABLE danhmuc (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tendanhmuc VARCHAR(100) NOT NULL
);

INSERT INTO danhmuc (tendanhmuc) VALUES
('Sneaker Vans'),
('Sneaker Converse'),
('Sneaker Nike'),
('Giày Jordan'),
('Giày Balenciaga');

-- Tạo bảng sanpham
CREATE TABLE sanpham (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tensp VARCHAR(100) NOT NULL,
    giasp INT NOT NULL,
    mota VARCHAR(1000) NOT NULL,
    hinhanh VARCHAR(100) NOT NULL,
    soluong INT NOT NULL,
    size INT NOT NULL,
    mau VARCHAR(100) NOT NULL,
    iddanhmuc INT NOT NULL,
    FOREIGN KEY (iddanhmuc) REFERENCES danhmuc(id) -- ràng buộc với bảng danhmuc
);

INSERT INTO sanpham (tensp, giasp, mota, hinhanh, soluong, size, mau, iddanhmuc) VALUES
('Sneaker Vans Classic', 1500, 'Giày Vans Classic', 'vans.jpg', 50, 42, 'Trắng', 1),
('Sneaker Converse', 1800, 'Giày Converse', 'converse.jpg', 30, 40, 'Đen', 2),
('Giày Nike Air Max', 2200, 'Giày Nike Air Max', 'nike.jpg', 25, 43, 'Xanh', 3),
('Giày Jordan 1', 5000, 'Giày Jordan 1', 'jordan1.jpg', 10, 44, 'Đỏ', 4),
('Giày Balenciaga Triple S', 12000, 'Giày Balenciaga Triple S', 'balenciaga.jpg', 5, 45, 'Vàng', 5);

-- Tạo bảng donhang
CREATE TABLE donhang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    iduser INT NOT NULL,
    tongtien INT NOT NULL,
    trangthai VARCHAR(100) NOT NULL,
    ngaymua DATE NOT NULL,
    diachi VARCHAR(100) NOT NULL,
    FOREIGN KEY (iduser) REFERENCES taikhoan(id) -- ràng buộc với bảng taikhoan
);

INSERT INTO donhang (iduser, tongtien, trangthai, ngaymua, diachi) VALUES
(1, 580, 'Đã thanh toán', '2021-10-28', 'Quảng Trị'),
(2, 2040, 'Đã thanh toán', '2021-10-28', 'Đà Nẵng');

-- Tạo bảng binhluan
CREATE TABLE binhluan (
    id INT IDENTITY(1,1) PRIMARY KEY,
    noidung VARCHAR(1000) NOT NULL,
    username VARCHAR(100) NOT NULL,
    idsp INT NOT NULL,
    time DATETIME2(5) NOT NULL DEFAULT SYSDATETIME(),
    FOREIGN KEY (idsp) REFERENCES sanpham(id) -- ràng buộc với bảng sanpham
);

INSERT INTO binhluan (noidung, username, idsp, time) VALUES
('tốt', 'admin', 1, '2021-11-10 22:54:28.00000'),
('Sản phẩm tốt', 'admin', 2, '2021-11-24 21:47:07.24643'),
('vip pro', 'admin', 3, '2021-11-30 16:32:52.14125'),
('đá', 'admin', 4, '2021-12-01 22:54:48.08996');

-- Tạo bảng chitietdonhang
CREATE TABLE chitietdonhang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    iddonhang INT NOT NULL,
    idsp INT NOT NULL,
    soluong INT NOT NULL,
    FOREIGN KEY (iddonhang) REFERENCES donhang(id), -- ràng buộc với bảng donhang
    FOREIGN KEY (idsp) REFERENCES sanpham(id) -- ràng buộc với bảng sanpham
);

INSERT INTO chitietdonhang (iddonhang, idsp, soluong) VALUES
(1, 1, 1),
(2, 2, 2),
(1, 3, 1),
(2, 4, 1);

-- Tạo bảng thongke
CREATE TABLE thongke (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tongtien VARCHAR(1000) NOT NULL,
    thang INT NOT NULL,
    soluongsp INT NOT NULL
);

INSERT INTO thongke (tongtien, thang, soluongsp) VALUES
('2640', 12, 3);
