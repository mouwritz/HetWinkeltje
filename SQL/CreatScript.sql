USE master
GO

DROP DATABASE IF EXISTS HetWinkeltje
GO

CREATE DATABASE HetWinkeltje
GO

USE HetWinkeltje
GO

-- Create tables
CREATE TABLE Employee
(
	EmployeeId		INT			NOT NULL,
	[Name]			VARCHAR(30)	NOT NULL,
	Pincode			INT			NOT NULL
)

CREATE TABLE Product
(
	EANCode		INT			NOT NULL,
	[Name]		VARCHAR(30)	NOT NULL,
	Price		DECIMAL(6,2)NOT NULL,
	Discount	INT			NULL
)

CREATE TABLE [Order]
(
	OrderId		INT			NOT NULL,
	OrderDate	DATETIME	NOT NULL,
	EmployeeId	INT			NOT NULL
)

CREATE TABLE ProductOrder
(
	EANCode		INT		NOT NULL,
	OrderId		INT		NOT NULL,
	Amount		INT		NOT NULL
)

-- Create Primary keys
ALTER TABLE Employee
ADD CONSTRAINT PK_Employee
PRIMARY KEY (EmployeeId)

ALTER TABLE [Order]
ADD CONSTRAINT PK_Order
PRIMARY KEY (OrderId)

ALTER TABLE Product
ADD CONSTRAINT PK_Prodcut
PRIMARY KEY (EANCode)

ALTER TABLE ProductOrder
ADD CONSTRAINT PK_Product_Order
PRIMARY KEY (EANCode, OrderId)

-- Create foreign keys
ALTER TABLE [Order]
ADD CONSTRAINT FK_Employee
FOREIGN KEY (EmployeeId)
REFERENCES Employee(EmployeeId)

ALTER TABLE ProductOrder
ADD CONSTRAINT FK_Product_Order_Product
FOREIGN KEY (EANCode)
REFERENCES Product(EANCode)

ALTER TABLE ProductOrder
ADD CONSTRAINT FK_Product_Order_Order
FOREIGN KEY (OrderId)
REFERENCES [Order](OrderID)

-- ADD CHECKS