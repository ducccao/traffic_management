use master
drop database [QLGT_APIContext-20210112121110]
use [QLGT_APIContext-20210112121110]

	select * from Customers
	select * from Profiles
	select* from feedbacks
	select* from Vehicles


SET IDENTITY_INSERT Customers OFF
SET IDENTITY_INSERT feedbacks OFF
SET IDENTITY_INSERT Vehicles OFF
	
SET IDENTITY_INSERT Customers ON
SET IDENTITY_INSERT feedbacks ON
SET IDENTITY_INSERT Vehicles ON


-- customers
insert into Customers(id,Name,Phone,UserName,Password,Address) values (2,'duc2','123','duccao2','123','asd');
insert into Customers(id,Name,Phone,UserName,Password,Address) values (3,'duc3','123','duccao3','123','asd');
insert into Customers(id,Name,Phone,UserName,Password,Address) values (4,'duc4','123','duccao4','123','asd');

-- feedbacks
insert into feedbacks(Id,Content,Date) values (1,'feedback 1','12/12/2020');
insert into feedbacks(Id,Content,Date) values (2,'feedback 2','12/12/2020');
insert into feedbacks(Id,Content,Date) values (3,'feedback 3','12/12/2020');

-- vehicles
insert into Vehicles(id,Name,Capacity,Type,LicensePlates,Price,SignedUpDate,Status) 
values (1,'xe 1',100,'Xe máy','1001',10000000,'12/12/2020','true');
