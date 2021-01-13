use master
drop database if exists QLGT2;
go
create database QLGT2
go
use QLGT2
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HoSo](
	[MaHS] INT IDENTITY (1,1) NOT NULL,
	[Img] NVARCHAR(100) NULL,
	[NgayTao] DATETIME NOT NULL,
	[MaKhachHang] INT NOT NULL,
	[MaXe] INT NOT NULL,
	CONSTRAINT [PK_MaHS] PRIMARY KEY ([MaHS])
)
GO
CREATE TABLE [Xe](
	[MaXe] INT IDENTITY (1,1) NOT NULL,
	[BienSo] NVARCHAR(10) NOT NULL,
	[Gia] MONEY NOT NULL,
	[MauXe] NVARCHAR(50) NOT NULL,
	[NgayDangKy] DATETIME NOT NULL,
	[TenXe] NVARCHAR(50) NOT NULL,
	[TrangThai] BIT NOT NULL,
	[MaLoaiXe] INT NOT NULL,
	[MaKhachHang] INT NOT NULL,
	CONSTRAINT [PK_MaXe] PRIMARY KEY ([MaXe])
)
GO
CREATE TABLE [LoaiXe](
	[MaLoaiXe] INT IDENTITY (1,1) NOT NULL,
	[TenLoaiXe] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_MaLoaiXe] PRIMARY KEY ([MaLoaiXe])
)
GO
CREATE TABLE [KhachHang](
	[MaKhachHang] INT IDENTITY (1,1) NOT NULL,
	[DienThoai] NVARCHAR(14) NULL,
	[DiaChi] NVARCHAR(100) NOT NULL,
	[Password] NVARCHAR(25) NULL,
	[TenKH] NVARCHAR(50) NOT NULL,
	[Username] NVARCHAR(25) NULL,
	CONSTRAINT [PK_MaKhachHang] PRIMARY KEY ([MaKhachHang])
)
CREATE TABLE [Admin](
	[MaAdmin] INT IDENTITY (1,1) NOT NULL,
	[Password] NVARCHAR(25) NULL,
	[TenAdmin] NVARCHAR(50) NOT NULL,
	[Username] NVARCHAR(25) NULL,
	CONSTRAINT [PK_MaAdmin] PRIMARY KEY ([MaAdmin])
)
GO
CREATE TABLE [ThanhToan](
	[MaThanhToan] INT IDENTITY (1,1) NOT NULL,
	[LoaiThanhToan] BIT NOT NULL,
	[NgayTao] DATETIME NOT NULL,
	[MaKhachHang] INT NOT NULL,
	CONSTRAINT [PK_MaThanhToan] PRIMARY KEY ([MaThanhToan])
)
GO
CREATE TABLE [LichHen](
	[MaLich] INT IDENTITY (1,1) NOT NULL,
	[NgayHen] DATETIME NOT NULL,
	[LyDo] NVARCHAR(60) NULL,
	[MaKhachHang] INT NOT NULL,
	CONSTRAINT [PK_MaLich] PRIMARY KEY ([MaLich])
)
GO
CREATE TABLE [Video](
	[MaVideo] INT IDENTITY (1,1) NOT NULL,
	[NgayTao] DATETIME NOT NULL,
	[URL] NVARCHAR(100) NULL,
	[MaKhachHang] INT NULL,
	CONSTRAINT [PK_MaVideo] PRIMARY KEY ([MaVideo])
)
GO
CREATE TABLE [DanhGia](
	[MaDanhGia] INT IDENTITY (1,1) NOT NULL,
	[NgayDanhGia] DATETIME NOT NULL,
	[NoiDung] NVARCHAR(100) NULL,
	[MaKhachHang] INT NULL,
	CONSTRAINT [PK_MaDanhGia] PRIMARY KEY ([MaDanhGia])
)
GO
ALTER TABLE [HoSo] ADD CONSTRAINT [FK_MaXe_HoSo] FOREIGN KEY ([MaXe])
REFERENCES [Xe]([MaXe])
ALTER TABLE [HoSo] ADD CONSTRAINT [FK_MaKhachHang_HoSo] FOREIGN KEY ([MaKhachHang])
REFERENCES [KhachHang]([MaKhachHang])
ALTER TABLE [Xe] ADD CONSTRAINT [FK_MaKhachHang_Xe] FOREIGN KEY ([MaKhachHang])
REFERENCES [KhachHang]([MaKhachHang])
ALTER TABLE [Xe] ADD CONSTRAINT [FK_MaLoaiXe_Xe] FOREIGN KEY ([MaLoaiXe])
REFERENCES [LoaiXe]([MaLoaiXe])
ALTER TABLE [ThanhToan] ADD CONSTRAINT [FK_MaKhachHang_ThanhToan] FOREIGN KEY ([MaKhachHang])
REFERENCES [KhachHang]([MaKhachHang])
ALTER TABLE [LichHen] ADD CONSTRAINT [FK_MaKhachHang_LichHen] FOREIGN KEY ([MaKhachHang])
REFERENCES [KhachHang]([MaKhachHang])
ALTER TABLE [Video] ADD CONSTRAINT [FK_MaKhachHang_Video] FOREIGN KEY ([MaKhachHang])
REFERENCES [KhachHang]([MaKhachHang])
ALTER TABLE [DanhGia] ADD CONSTRAINT [FK_MaKhachHang_DanhGia] FOREIGN KEY ([MaKhachHang])
REFERENCES [KhachHang]([MaKhachHang])
GO
SET IDENTITY_INSERT [KhachHang] ON
GO
--insert KhachHang
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(1,'083-181-3997','Ap #969-5750 Id Street','Carlos','loremac','Erin O. White')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(2,'027-184-8582','569-3808 Leo. Avenue','Kirk','Vivamusnon','Sydnee A. Delacruz')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(3,'047-785-9121','7693 Commodo Avenue','Ryder','neceuismod','Zeph G. Manning')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(4,'076-623-6946','Ap #489-767 Porttitor Street','Zia','Maurisnulla','Porter I. Mccoy')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(5,'044-673-0673','947-3879 Mi St.','Eliana','ipsumprimis','Grace V. Schroeder')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(6,'065-762-4478','1815 Gravida Rd.','Amal','turpisIn','Cassidy G. Chambers')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(7,'010-193-9679','207-4187 Luctus Av.','Callie','feugiatSed','Garrett F. Powers')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(8,'030-010-1659','8802 Sem. Street','Gisela','ipsumacmi','Hayden X. Cameron')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(9,'015-378-1017','Ap #891-9695 Augue Rd.','Allistair','nequeMorbi','Chancellor L. James')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(10,'057-468-2677','Ap #475-883 Lacus. Avenue','Xyla','eutemporerat','Paloma C. Gates')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(11,'072-255-1796','Ap #993-7656 Mauris Rd.','Illiana','commodotinci','Blythe K. Mullins')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(12,'047-406-8680','Ap #657-3791 Turpis Road','Colorado','convallisante','Shea K. Martinez')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(13,'013-140-9798','P.O. Box 941, 425 Amet, Rd.','Eagan','luctusvulputate','Abraham K. Kirby')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(14,'033-310-5073','P.O. Box 763, 6429 Et St.','Judah','habitantmorbi','Howard Q. Johns')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(15,'082-897-2741','2895 Vel Ave','Grant','egestasFusce','Macey P. Dean')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(16,'022-403-2509','4714 Convallis St.','Hiroko','vel nisl. Quisquefring','Whoopi E. Diaz')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(17,'082-897-7432','Ap #396-2761 Donec Ave','Ira','Praesentluctus','Zephr Y. Joyce')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(18,'092-427-4193','3037 Nisl Ave','Clementine','sedconsequat','Hilel C. Chan')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(19,'072-655-8677','Ap #369-7234 Placerat Road','Suki','eratvolutpat','Quinn M. Nixon')
INSERT INTO [KhachHang]([MaKhachHang],[DienThoai],[DiaChi],[Username],[Password],[TenKH]) VALUES(20,'017-774-1888','P.O. Box 405, 1224 Sed St.','Elaine','nectempusmauris','Shellie X. Mor')
GO
SET IDENTITY_INSERT [KhachHang] OFF
GO
SET IDENTITY_INSERT [LoaiXe] ON
GO
--insert LoaiXe
INSERT INTO [LoaiXe]([MaLoaiXe],[TenLoaiXe]) VALUES(1,N'Xe dung tích 50cc')
INSERT INTO [LoaiXe]([MaLoaiXe],[TenLoaiXe]) VALUES(2,N'Xe phân khối lớn')
INSERT INTO [LoaiXe]([MaLoaiXe],[TenLoaiXe]) VALUES(3,N'Xe tải')
INSERT INTO [LoaiXe]([MaLoaiXe],[TenLoaiXe]) VALUES(4,N'Xe bán tải')
INSERT INTO [LoaiXe]([MaLoaiXe],[TenLoaiXe]) VALUES(5,N'Xe 4 chỗ')
INSERT INTO [LoaiXe]([MaLoaiXe],[TenLoaiXe]) VALUES(6,N'Xe 6 chỗ')
GO
SET IDENTITY_INSERT [LoaiXe] OFF
GO
SET IDENTITY_INSERT [Xe] ON
GO
--insert Xe
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(1,'06555',5.932,1,1,'Donec sollicitudin',SYSDATETIME(),'Clare Saunders',1)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(2,'24626',6.897,2,2,'vulputate eu',SYSDATETIME(),'Sarah Gaines',1)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(3,'33355',8.798,3,3,'ac nulla',SYSDATETIME(),'Jennifer Pollard',0)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(4,'89529',9.819,4,4,'Aenean eget magna',SYSDATETIME(),'Candace Arnold',1)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(5,'28205',5.071,5,5,'Aenean massa',SYSDATETIME(),'Rebekah Kramer',0)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(6,'52795',6.617,6,6,'utmolestie in',SYSDATETIME(),'Casey Nieves',1)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(7,'33315',9.803,7,6,'lectus rutrum urna',SYSDATETIME(),'Abra Raymond',0)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(8,'50030',5.035,8,5,'Vivamus molestie',SYSDATETIME(),'Nita Campos',1)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(9,'02830',8.118,9,4,'vel quam dignissim',SYSDATETIME(),'Olga Park',0)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(10,'51271',8.693,10,3,'Mauris eu turpis',SYSDATETIME(),'Hope Cervantes',1)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(11,'01693',5.010,11,2,'cursus a',SYSDATETIME(),'Helen Webb',0)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(12,'24038',9.783,12,1,'nonummy ac',SYSDATETIME(),'Kelly Leblanc',0)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(13,'50489',6.328,13,3,'Nam ligula',SYSDATETIME(),'Isadora Poole',0)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(14,'37313',7.338,14,4,'Suspendisse ',SYSDATETIME(),'Briar Valencia',0)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(15,'75038',7.635,15,5,'odio sagittis',SYSDATETIME(),'Freya Schwartz',0)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(16,'60757',8.062,16,6,'mi lorem',SYSDATETIME(),'Gemma Kinney',0)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(17,'77975',7.722,17,1,'sollicitudin commodo',SYSDATETIME(),'Lani Reese',0)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(18,'44621',7.607,18,2,'aliquam enim nec',SYSDATETIME(),'Kelsie Yang',1)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(19,'72124',6.751,19,3,'accumsan neque',SYSDATETIME(),'Lenore Fleming',1)
INSERT INTO Xe([MaXe],[BienSo],[Gia],[MaKhachHang],[MaLoaiXe],[MauXe],[NgayDangKy],[TenXe],[TrangThai]) VALUES(20,'01181',5.616,20,5,'vitae aliquam eros',SYSDATETIME(),'Sasha Baxter',1)
GO
SET IDENTITY_INSERT [Xe] OFF
GO
SET IDENTITY_INSERT [HoSo] ON
GO
--insert HoSo

INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(1,'475',SYSDATETIME(),1,1)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(2,'749',SYSDATETIME(),2,2)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(3,'550',SYSDATETIME(),3,3)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(4,'704',SYSDATETIME(),4,4)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(5,'302',SYSDATETIME(),5,5)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(6,'498',SYSDATETIME(),6,6)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(7,'151',SYSDATETIME(),7,7)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(8,'339',SYSDATETIME(),8,8)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(9,'829',SYSDATETIME(),9,9)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(10,'584',SYSDATETIME(),10,10)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(11,'365',SYSDATETIME(),11,11)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(12,'296',SYSDATETIME(),12,12)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(13,'400',SYSDATETIME(),13,13)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(14,'200',SYSDATETIME(),14,14)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(15,'112',SYSDATETIME(),15,15)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(16,'499',SYSDATETIME(),16,16)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(17,'390',SYSDATETIME(),17,17)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(18,'516',SYSDATETIME(),18,18)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(19,'776',SYSDATETIME(),19,19)
INSERT INTO [HoSo]([MaHS],[Img],[NgayTao],[MaKhachHang],[MaXe]) VALUES(20,'883',SYSDATETIME(),20,20)
GO
SET IDENTITY_INSERT [HoSo] OFF
GO
SET IDENTITY_INSERT [Admin] ON
GO
--insert Admin
INSERT INTO [Admin]([MaAdmin],[Username],[Password],[TenAdmin]) VALUES(1,'Sydney','enimnislelementum','Colt B. Harper')
INSERT INTO [Admin]([MaAdmin],[Username],[Password],[TenAdmin]) VALUES(2,'Stewart','Donecvitaeerat','Briar G. Ryan')
INSERT INTO [Admin]([MaAdmin],[Username],[Password],[TenAdmin]) VALUES(3,'Amena','quamdignissim','Garrett M. Hooper')
INSERT INTO [Admin]([MaAdmin],[Username],[Password],[TenAdmin]) VALUES(4,'Derek','Integerv','Jemima Q. Whitfield')
INSERT INTO [Admin]([MaAdmin],[Username],[Password],[TenAdmin]) VALUES(5,'Holly','molestieorci','Melissa V. Nguyen')
INSERT INTO [Admin]([MaAdmin],[Username],[Password],[TenAdmin]) VALUES(6,'Isaiah','Suspendisse','Skyler Z. Lewis')
INSERT INTO [Admin]([MaAdmin],[Username],[Password],[TenAdmin]) VALUES(7,'Isadora','aliquam','Emi R. Downs')
INSERT INTO [Admin]([MaAdmin],[Username],[Password],[TenAdmin]) VALUES(8,'Colette','nuncinterdum','Emi K. Phelps')
INSERT INTO [Admin]([MaAdmin],[Username],[Password],[TenAdmin]) VALUES(9,'Ethan','maurissapien','Donovan D. Gibbs')
INSERT INTO [Admin]([MaAdmin],[Username],[Password],[TenAdmin]) VALUES(10,'Jaquelyn','duiquis,','Imelda B. Parks')
GO
SET IDENTITY_INSERT [Admin] OFF