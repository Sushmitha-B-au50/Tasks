create database Products 

use Products


CREATE TABLE Product (
    ProductID int NOT NULL,
    Name varchar(255) NOT NULL,
    Description varchar(255),
    Price money,
	DiscountPercentage int,
    PRIMARY KEY (ProductID)
);

CREATE TABLE Customer (
   CustomerID int NOT NULL,
    Name varchar(255) NOT NULL,
    Address varchar(255),
    ContactNo varchar(10),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE PurchaseOrder (
   POID int NOT NULL,
   Date Date,
   Amount Money,
   CustomerID int,
    PRIMARY KEY ( POID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE PurchaseOrderDetail (
   PODID int NOT NULL,
   Qty int,
   Price Money,
   POID int,
   ProductID int,
    PRIMARY KEY ( PODID),
    FOREIGN KEY (POID) REFERENCES PurchaseOrder(POID),
	FOREIGN KEY (ProductID)REFERENCES Product(ProductID)
);



select * from Product

select * from Customer

select * from PurchaseOrder

select * from PurchaseOrderDetail

INSERT INTO Product(ProductID ,
    Name ,
    Description ,
    Price ,
	DiscountPercentage) VALUES (1,'Iphone','11 pro max',76000,9)

INSERT INTO Product(ProductID ,
    Name ,
    Description ,
    Price ,
	DiscountPercentage) VALUES (2,'Redmi','Note 12',22000,10)



INSERT INTO Product(ProductID ,
    Name ,
    Description ,
    Price ,
	DiscountPercentage) VALUES (3,'OnePlus','Nord CE 5G',23000,8)



INSERT INTO Product(ProductID ,
    Name ,
    Description ,
    Price ,
	DiscountPercentage) VALUES (4,'Vivo','iQoo Z3',20000,7)

INSERT INTO Product(ProductID ,
    Name ,
    Description ,
    Price ,
	DiscountPercentage) VALUES (5,'Samsung','Galaxy F62',17000,9)

INSERT INTO Product(ProductID ,
    Name ,
    Description ,
    Price ,
	DiscountPercentage) VALUES (6,'Realme ','8 5G',19000,9)

	

select * from Customer

INSERT INTO Customer(
   CustomerID ,
    Name,
    Address,
    ContactNo) VALUES 
	(1,'sushmitha','No 14 carst kanchipuram',9090745432),
	(2,'Hari','No 10 vishnu st kanchipuram',7890765432),
	(3,'Baskar','No 11 ram st xy nagar mumbai',6789654321),
	(4,'priya','No 9 kamaraj st near vigilance office chennai',9876543211),
	(5,'harini','No 8 shenoy nagar pune',8076594721);
	INSERT INTO Customer(
   CustomerID ,
    Name,
    Address,
    ContactNo) VALUES (6,'ram','No 7 cross st anna nagar Delhi',9876543218);



select * from PurchaseOrder

INSERT INTO PurchaseOrder(POID , Date , Amount,CustomerID) VALUES 
	(1,'2021/07/10',69160,1),
	(2,'2020/05/15',19800,2),
	(3,'2021/04/5',21160,3),
	(4,'2021/07/5',18600,4),
	(5,'2020/06/25',15470,5);

INSERT INTO PurchaseOrder(POID , Date , Amount,CustomerID) VALUES 
	(6,'2021/07/2',17290,6)

select * from PurchaseOrderDetail

INSERT INTO PurchaseOrderDetail( PODID,Qty,Price,POID,ProductID ) VALUES 
	(1,1,69160,1,1),
	(2,1,19800,2,2),
	(3,1,21160,3,3),
	(4,1,18600,4,4),
	(5,1,15470,5,5);

INSERT INTO PurchaseOrderDetail( PODID,Qty,Price,POID,ProductID ) VALUES (6,2,34580,6,6);

-----------------------------------------------------------------------------------------------------
    
	select C. Name, Po.POID,p.Name,POD.Price from Customer c  join PurchaseOrder po on c.CustomerID = po.CustomerID
	 join PurchaseOrderDetail POD on po.POID = POD.POID join Product p on p.ProductID = POD.ProductID

	
	SELECT Concat(DateName(month,po.Date), '-' ,DateName(year,po.Date) )as Month, c.Name,po.Amount from PurchaseOrder 
	po join Customer c on c.CustomerID = po.CustomerID

	select Concat(DateName(month,po.Date), '-' ,DateName(year,po.Date) )as Month,p.Name, pod.Qty from PurchaseOrder po 
	join PurchaseOrderDetail pod on po.POID = pod.POID join Product p on pod.ProductID = p.ProductID Order by p.Name

	