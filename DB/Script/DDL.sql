USE master;
GO
ALTER DATABASE libreria_esau SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE libreria_esau SET ONLINE;
DROP DATABASE IF EXISTS libreria_esau;
GO
CREATE DATABASE libreria_esau;
GO
USE libreria_esau;
GO

CREATE TABLE client(
	ID_CLIENT int identity(1,1),
	[NAME] varchar(50),
	PHONE varchar(13),
	ADDRESS varchar(200),
	primary key(ID_CLIENT)
);

CREATE TABLE employee(
 ID_EMPLOYEE int identity(1,1),
 [NAME] varchar(50),
 PHONE varchar(13),
 ADDRESS varchar(200),
 SALARY float,
 primary key(ID_EMPLOYEE)
);

CREATE TABLE authors(
 ID_AUTHOR int identity(1,1),
 NAME VARCHAR(50),
 NATIONALITY VARCHAR(50)
 primary key(ID_AUTHOR)
);

CREATE TABLE books(
	ID_BOOK int identity(1,1),
	[NAME] varchar(100),
	DESCRIPTION varchar(500),
	PRICE float,
	STOCK int,
	ID_AUTHOR int,
	primary key(ID_BOOK),
	foreign key(ID_AUTHOR) references authors (ID_AUTHOR)
)

CREATE TABLE loans(
	ID_LOAN int identity(1,1),
	ID_BOOK int,
	ID_EMPLOYEE int,
	ID_CLIENT int,
	[DATE] DATE,
	primary key(ID_LOAN),
	foreign key(ID_BOOK) references books (ID_BOOK),
	foreign key(ID_EMPLOYEE) references employee (ID_EMPLOYEE),
	foreign key(ID_CLIENT) references client (ID_CLIENT)
);

CREATE TABLE returnss(
	ID_RETURN int identity(1,1),
	ID_LOAN int,
	[DATE] DATE
	primary key(ID_RETURN),
	foreign key(ID_LOAN) references loans (ID_LOAN)
)

CREATE TABLE sales(
	ID_SALE int identity(1,1),
	ID_BOOK int,
	ID_EMPLOYEE int,
	ID_CLIENT int,
	[DATE] date,
	primary key(ID_SALE),
	foreign key(ID_BOOK) references books (ID_BOOK),
	foreign key(ID_EMPLOYEE) references employee (ID_EMPLOYEE),
	foreign key(ID_CLIENT) references client (ID_CLIENT)
);