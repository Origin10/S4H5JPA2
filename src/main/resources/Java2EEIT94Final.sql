Use EEIT94

DROP TABLE PERSONS;
DROP TABLE detail;
DROP TABLE Product;

CREATE TABLE PERSONS(
 id       integer primary key,
FIRST_NAME varchar(20),
LAST_NAME varchar(20),
EMAIL varchar(50)
);
go


CREATE TABLE Product (
   id       integer primary key,
   name     varchar(20),
   price    float,
   make     datetime,
   expire    integer
);

INSERT INTO product values (1,'Coca Cola',20, '2007-01-01',365);
INSERT INTO product values (2,'Milk Tea',15, '2007-02-14',150);
INSERT INTO product values (3,'Easy Coffe',10, '2007-10-01',200);
INSERT INTO product values (4,'Coffe Square',15, '2007-02-20',100);
INSERT INTO product values (5,'Cookie',25, '2007-03-27',45);
INSERT INTO product values (6,'Prince Noodle',5, '2007-04-02',365);
INSERT INTO product values (7,'Chicken Noodle',20, '2006-10-30',300);
INSERT INTO product values (8,'Qwi-Qwi',20, '2007-02-28',200);
INSERT INTO product values (9,'Ice Pop',15, '2007-05-30',150);
INSERT INTO product values (10,'HotDog',25, '2007-04-30',1);

/*==========================================================================*/

CREATE TABLE detail (
   photoid  integer primary key REFERENCES Product(id),
   photo    image
);

/*==========================================================================*/

DROP TABLE customer;
CREATE TABLE customer (
   custid     varchar(20) primary key,
   password   varbinary(50),
   email      varchar(30),
   birth      datetime
);

INSERT INTO customer values ('Alex', 0x41, 'alex@lab.com', '2001-07-20');
INSERT INTO customer values ('Babe', 0x42, 'babe@lab.com', '2003-03-20');
INSERT INTO customer values ('Carol', 0x43, 'carol@lab.com', '2001-09-11');
INSERT INTO customer values ('Dave', 0x44, 'dave@lab.com', '2001-01-20');
INSERT INTO customer values ('Ellen', 0x45, 'ellen@lab.com', '2000-05-20');

/*==========================================================================*/

DROP TABLE ProjEmp;
DROP TABLE Proj;
DROP TABLE Emp;
DROP TABLE Dept;
CREATE TABLE Dept (
  deptid     integer  primary key,
  deptname   VARCHAR(20)
);

INSERT INTO DEPT VALUES (10, 'Java');
INSERT INTO DEPT VALUES (20, 'Delphi');
INSERT INTO DEPT VALUES (30, 'Visual Basic');

/*=====================================================================*/

CREATE TABLE Emp (
  empid     integer primary key identity,
  empname   VARCHAR(10),
  salary    integer,
  sex       CHAR(1),
  photo     image,
  deptid    integer NOT NULL REFERENCES DEPT(DEPTID)
);

INSERT INTO EMP (EMPNAME, SALARY, SEX, DEPTID) VALUES ('Samuel', 10, 'M', 10);
INSERT INTO EMP (EMPNAME, SALARY, SEX, DEPTID) VALUES ('Crystal', 100, 'F', 30);
INSERT INTO EMP (EMPNAME, SALARY, SEX, DEPTID) VALUES ('Sammy', 1000, 'M', 10);
INSERT INTO EMP (EMPNAME, SALARY, SEX, DEPTID) VALUES ('Momo', 10000, 'M', 20);

/*=====================================================================*/

CREATE TABLE Proj (
  projid    integer  primary key,
  projname  VARCHAR(50)
);

INSERT INTO PROJ (PROJID, PROJNAME) VALUES (100, 'Online Shopping');
INSERT INTO PROJ (PROJID, PROJNAME) VALUES (200, 'Mobile Banking');
/*=====================================================================*/

CREATE TABLE ProjEmp (
  projid  integer,
  empid   integer,
  CONSTRAINT PK_PROJEMP_PROJIDEMPID PRIMARY KEY(PROJID, EMPID),
  CONSTRAINT FK_PROJEMP_PROJ_PROJID FOREIGN KEY(PROJID) REFERENCES PROJ(PROJID),
  CONSTRAINT FK_PROJEMP_EMP_EMPID FOREIGN KEY(EMPID) REFERENCES EMP(EMPID)
);

INSERT INTO PROJEMP VALUES (100, 1);
INSERT INTO PROJEMP VALUES (100, 2);
INSERT INTO PROJEMP VALUES (100, 4);
INSERT INTO PROJEMP VALUES (200, 3);
INSERT INTO PROJEMP VALUES (200, 4);
/*=====================================================================*/

DROP TABLE accountrole;
DROP TABLE account;
DROP TABLE blog;

CREATE TABLE blog (
   id          integer primary key identity,
   articleId   integer,
   nickname    varchar(20),
   retime      datetime,
   reply       varchar(500)
);
insert into blog (articleId, nickname, retime, reply) values (1, 'Crystal', '2011-05-01', '�ܤ���');
insert into blog (articleId, nickname, retime, reply) values (1, 'Babe', '2011-05-01', '�ݤ����b���ƻ�');
insert into blog (articleId, nickname, retime, reply) values (1, 'Dave', '2011-05-01', 'BullShit');

/*=====================================================================*/
CREATE TABLE account (
   accountid  varchar(20) primary key,
   password   varchar(20)
);

CREATE TABLE accountrole (
   accountid   varchar(20),
   roleid     varchar(20),
   primary key(accountid, roleid),
   foreign key (accountid) references account (accountid)
);
/*==========================================================================*/
DROP PROCEDURE proProductByPrice;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE proProductByPrice
	@param_price float AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM product WHERE price>@param_price
END
GO

/*==========================================================================*/

DROP TABLE ObjectIDs;
CREATE TABLE ObjectIDs (
   table_name varchar(30) primary key,
   id         integer     not null
);
INSERT INTO ObjectIDs (TABLE_NAME, ID) VALUES ('Item', 20);

/*==========================================================================*/

DROP TABLE Item;
CREATE TABLE Item (
   id         integer    primary key,
   username   varchar(20)   not null, 
   title      varchar(100)  not null,
   year       char(4)       not null,
   genre      varchar(20)   not null
);
INSERT INTO ITEM VALUES (1, 'jack', 'The Godfather', '1972', 'Drama');
INSERT INTO ITEM VALUES (2, 'jack', 'The Shawshank Redemption', '1994', 'Drama');
INSERT INTO ITEM VALUES (3, 'jack', 'The Godfather: Part II', '1974', 'Drama');
INSERT INTO ITEM VALUES (4, 'jack', 'The Lord of the Rings: The Return of the King', '2003', 'Fantasy');
INSERT INTO ITEM VALUES (5, 'jack', 'The Lord of the Rings: The Two Towers', '2002', 'Fantasy');
INSERT INTO ITEM VALUES (6, 'jack', 'Shindler''s List', '1998', 'Drama');
INSERT INTO ITEM VALUES (7, 'jack', 'Shichinin no samurai', '1954', 'Action');
INSERT INTO ITEM VALUES (8, 'jack', 'Casablanca', '1942', 'Drama');
INSERT INTO ITEM VALUES (9, 'jack', 'The Lord of the Rings: The Fellowship of the Ring', '2001', 'Fantasy');
INSERT INTO ITEM VALUES (10, 'jack', 'Star Wars', '1977', 'Sci-Fi');
INSERT INTO ITEM VALUES (11, 'jack', 'Citizen Kane', '1941', 'Mystery');
INSERT INTO ITEM VALUES (12, 'jack', 'One Flew Over the Cuckoo''s Nest', '1975', 'Drama');
INSERT INTO ITEM VALUES (13, 'jack', 'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb', '1964', 'Comedy');
INSERT INTO ITEM VALUES (14, 'jack', 'Rear Window', '1954', 'Thriller');
INSERT INTO ITEM VALUES (15, 'jack', 'Star Wars: Episode V - The Empire Strikes Back', '1980', 'Sci-Fi');
INSERT INTO ITEM VALUES (16, 'jack', 'Raiders of the Lost Ark', '1981', 'Action');
INSERT INTO ITEM VALUES (17, 'jack', 'The Usual Suspects', '1995', 'Mystery');
INSERT INTO ITEM VALUES (18, 'jack', 'Pulp Fiction', '1994', 'Crime');
INSERT INTO ITEM VALUES (19, 'jack', 'Memento', '2000', 'Mystery');
/*==========================================================================*/


IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('BloodBank'))
BEGIN;
    DROP TABLE [BloodBank];
END;
GO

create table BloodBank (
 id                 int IDENTITY  not null,
 pID				 int  not null,
 bType               int,
 bInfo               varchar(2000),
 bDate               date,

/*constraint BloodBank_pID_fk foreign key (pID) references pets (pID),*/
constraint BloodBank_bID_pk primary key (id),
constraint FK_bTypeb_TypeDetail UNIQUE  ([pID])

);

insert into BloodBank([pID],[bType],[bInfo],[bDate]) values (2,1,'','1981-11-17');
insert into BloodBank([pID],[bType],[bInfo],[bDate]) values (5,2,'','1981-05-01');
insert into BloodBank([pID],[bType],[bInfo],[bDate]) values (3,4,'','1981-01-09');
insert into BloodBank([pID],[bType],[bInfo],[bDate]) values (7,9,'','1981-04-02');
insert into BloodBank([pID],[bType],[bInfo],[bDate]) values (1,7,'','1981-09-28');
insert into BloodBank([pID],[bType],[bInfo],[bDate]) values (8,1,'','1981-02-24');
insert into BloodBank([pID],[bType],[bInfo],[bDate]) values (6,4,'','1981-09-28');
insert into BloodBank([pID],[bType],[bInfo],[bDate]) values (4,6,'','1981-12-03');

go

IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('BloodDetail'))
BEGIN;
    DROP TABLE [BloodDetail];
END;
GO

create table BloodDetail (
 bType               int  not null,
 typeDetail			 varchar(2000),
constraint PK_BloodDetail primary key (bType)

);

insert into BloodDetail([bType],[typeDetail]) values (0,'DEA 1�]-�^');
insert into BloodDetail([bType],[typeDetail]) values (1,'DEA 1.1');
insert into BloodDetail([bType],[typeDetail]) values (2,'DEA 1.2');
insert into BloodDetail([bType],[typeDetail]) values (3,'DEA 3');
insert into BloodDetail([bType],[typeDetail]) values (4,'DEA 4');
insert into BloodDetail([bType],[typeDetail]) values (5,'DEA 5');
insert into BloodDetail([bType],[typeDetail]) values (6,'DEA 6');
insert into BloodDetail([bType],[typeDetail]) values (7,'DEA 7');
insert into BloodDetail([bType],[typeDetail]) values (8,'DEA 8');
insert into BloodDetail([bType],[typeDetail]) values (9,'DEA 9');
insert into BloodDetail([bType],[typeDetail]) values (10,'DEA 10');
insert into BloodDetail([bType],[typeDetail]) values (11,'DEA 11');
insert into BloodDetail([bType],[typeDetail]) values (12,'DEA 12');
insert into BloodDetail([bType],[typeDetail]) values (13,'DEA 13');

/*==========================================================================*/

USE EEIT94
GO

IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('ExchangStuff'))
BEGIN;
    DROP TABLE [ExchangStuff];
END;
GO

CREATE TABLE ExchangStuff (
  [id] bigint NOT NULL IDENTITY,
  [Area_id] bigint NOT NULL,
  [Area_name] varchar(64) NOT NULL,
  [provider_id] bigint NOT NULL ,
  [title] varchar(200) NOT NULL ,
  [image_id] bigint DEFAULT '0' ,
  [deal_level] int NOT NULL ,
  [max_exchange_count] int DEFAULT NULL,
  [publish_status] int NOT NULL ,
  [inventory_amount] int NOT NULL ,
  [start_time] datetime2(0) NOT NULL ,
  [end_time] datetime2(0) DEFAULT NULL ,
  [exchange_moment] datetime2(0) DEFAULT NULL ,
  [merchant_code] varchar(15) DEFAULT NULL ,
  [create_time] datetime2(0) NOT NULL ,
  [update_time] datetime2(0) NOT NULL ,
  [category_id] bigint check ([category_id] > 0) NOT NULL ,
  PRIMARY KEY ([id]),
  CONSTRAINT [deal_sku_UNIQUE] UNIQUE  ([provider_id])
) ;



IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('ExchangDetail'))
BEGIN;
    DROP TABLE [ExchangDetail];
END;
GO

CREATE TABLE ExchangDetail (
  [id] bigint NOT NULL,
  [eID] bigint NOT NULL,
  [eInfo] varchar(8000) DEFAULT NULL,
  PRIMARY KEY ([id]),
  CONSTRAINT [exchang_detail_UNIQUE] UNIQUE  ([eID])
) ;



IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Area'))
BEGIN;
    DROP TABLE [Area];
END;
GO

CREATE TABLE Area (
  [id] bigint NOT NULL IDENTITY,
  [name] varchar(32) NOT NULL ,
  [parent_id] bigint NOT NULL,
  [common] int NOT NULL,
  [type] varchar(16) NOT NULL ,
  PRIMARY KEY ([id]),
  CONSTRAINT [Area_name_UNIQUE] UNIQUE  ([name])
) ;


IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('ImageInfo'))
BEGIN;
    DROP TABLE ImageInfo;
END;
GO

CREATE TABLE ImageInfo (
  [id] bigint NOT NULL IDENTITY ,
  [width] int DEFAULT NULL ,
  [height] int DEFAULT NULL ,
  [source_path] varchar(100) DEFAULT NULL ,
  PRIMARY KEY ([id])
) ;

IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Cart'))
BEGIN;
    DROP TABLE Cart;
END;
GO

CREATE TABLE Cart (
  [id] bigint NOT NULL IDENTITY,
  [user_id] bigint NOT NULL,
  [deal_id] bigint NOT NULL,
  [deal_sku_id] bigint NOT NULL,
  [count] int NOT NULL,
  [create_time] datetime2(0) NOT NULL ,
  [update_time] datetime2(0) NOT NULL ,
  PRIMARY KEY ([id])
) ;

GO