drop table warehouse;
drop table address;
drop table tickethistory;
drop table assignment;
drop table equipment;
drop table inventory;
drop table ServiceRequest;
drop table serviceticket;
drop table auction;
drop table Customer;
drop table employee;



--Create tables in database
create table EMPLOYEE (
	EmployeeID		int identity(1, 1) primary key,
	EmpFirstName	varchar(255),
	EmpLastName		varchar(255)
);

create table CUSTOMER (
	CustomerID		int not null identity(1, 1) primary key,
	FirstName		varchar(255),
	LastName		varchar(255),
	CellPhone			varchar(15),
	WorkPhone			varchar(15),
	HomePhone			varchar(15),
	Email			varchar(255),
	ItemsForSale		varchar(200),
	WhatDoYouSell		varchar(200),
	Downsizing		varchar(10),
	SettlingEstate		varchar(10),
	MovingCB		varchar(10),
	AuctionCB		varchar(10),
	ConsignmentCB		varchar(10),
	AppraisalCb		varchar(10),
	ItemTransportation varchar(200),
	PreferredContact	varchar(255),
	ReferralChannel	varchar(255),	
	DateContacted	varchar(20),
	DeadlineStart	varchar(20),
	DeadlineEnd		varchar(20),
	CompletedByEmp	int references EMPLOYEE(EmployeeID),
	CustomerNotes	varchar (250),
	Completed		varchar(10)
);


create table AUCTION (
	AuctionID	int identity(1, 1) primary key,
	AuctionDate varchar(20),
);
create table SERVICETICKET (
	ServiceTicketID	int not null identity(1, 1) primary key,
	CustomerID		int references Customer(CustomerID),
	TicketOpenDate	varchar(20),
	PotentialDate	varchar(50),
	PotentialTime	varchar(50),
	ServiceDate		varchar(20),
	CompletionDate	varchar(20),
	ServiceType		char(20),
	DestinationTime	varchar(255),
	LookAtCB		varchar(10),
	LookAtDate		varchar(50),
	LookAtTime		varchar(50),
	InitiatingEmp	int references EMPLOYEE(EmployeeID),
	AuctionID		int references Auction(AuctionID),
	Status_Service	int,
	StorageCB		varchar(10),
	CleaningCB		varchar(10),
	TrashCB			varchar(10),
	Completed		varchar(10)
);

Create table Address(
AddressID int identity (1, 1) Primary Key,
ServiceTicketID		int references SERVICETICKET (ServiceTicketID),
CustomerID		int references Customer(CustomerID),
Street	varchar(255),
City		varchar(255),
State		varchar(255),
Zip		varchar(20),
Description		varchar(200)
)







create table SERVICEREQUEST	(
	ServiceRequestID    int not null identity(1, 1) primary key,
	ServiceType		    char(20),
	ServiceDate		    varchar(20),
	RequestDescription  varchar(500),
	RequestStatus		varchar(10),
	CustomerID		int references Customer(CustomerID)
);

create table INVENTORY (
	ItemID			int not null identity(1, 1) primary key,
	ServiceTicketID	int references SERVICETICKET(ServiceTicketID),
	ItemName varchar(50),
	ItemDescription	varchar(255),
	ItemCost		float,
	Quantity int
);

create table EQUIPMENT (
	EquipmentID		int not null identity(1, 1) primary key,
	EquipmentType	varchar(255)
);

create table ASSIGNMENT (
	EquipmentID		int references Equipment(EquipmentID),
	ServiceTicketID	int references SERVICETICKET(ServiceTicketID),
	primary key (ServiceTicketID, EquipmentID)
);


create table TICKETHISTORY (
	TicketHistoryID	int not null identity(1, 1) primary key,
	TicketChangeDate	varchar(20),
	NoteTitle		varchar(255),
	NoteDetails		varchar(500),
	ServiceTicketID int references SERVICETICKET(ServiceTicketID),
	EmployeeID	int references Employee(EmployeeID)
);

CREATE TABLE WAREHOUSE (
	[WarehouseID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Date] [date] NULL,
	[Lot] [varchar](50) NULL,
	[Control] [nvarchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Quantity] [int] NULL,
	[ItemID] [int] NULL,
	[CustomerID] [int] NULL,
	);

Create Table AUCTIONINVENTORY(
	AuctionInventoryID int not null identity(1, 1) primary key,
	ItemTransportationType varchar(20),
	Name				varchar(20),
	CellPhone			varchar(15),
	WorkPhone			varchar(15),
	HomePhone			varchar(15),
	StreetAddress		varchar(100),
	City				varchar(50),
	State				varchar(50),
	ZipCode				varchar(20),
);

---------------------------------------------
--Adding data to database--
---------------------------------------------

insert into EMPLOYEE values ('Jack', 'Frost');
insert into EMPLOYEE values ('Professor','Ezell');
insert into EMPLOYEE values ('Camille', 'Wood');

insert into CUSTOMER values ('Aaron', 'Walsh', '1234567822','123456789', '123456789','walsh@dukes.com',  'Item', 'What'   ,'true','false','true', 'false', 'false','false', 'pick up' , 'phone','poster','2021-03-07', '2021-03-07','2021-03-07',1,'notes','false' );
insert into CUSTOMER values ('Jared', 'Clatterbuck', '1234567890','', '','Clat@dukes.com',  '40', 'Collectibles and furniture','true','false','true', 'true', 'false','false', 'drop-off', 'email','advert','2021-03-13', '2021-04-21','2021-04-30', 2, 'They have a pretty long driveway','false' );
insert into CUSTOMER values ('Stu', 'Guy', '','', '1234567890','Guy@dukes.com',  '400', 'juiceboxes','true','true','true', 'true', 'false','false', 'drop-off', 'smokesignals','poster','2021-03-13', '2021-04-21','2021-04-30',1,'Really annoying to speak with','false' );

insert into EQUIPMENT values ('Pickup Truck #1');
insert into EQUIPMENT values ('Pickup Truck #2');
insert into EQUIPMENT values ('Forklift');
insert into EQUIPMENT values ('Box Truck');
insert into EQUIPMENT values ('Pallet Jack');

insert into Auction values ('Unassigned');
insert into Auction values ('2021-02-26');
insert into Auction values ('2021-03-05');

insert into SERVICETICKET values (1, '2021-01-01','2021-02-25','4:00pm','2021-02-01', '2021-02-07', 'Move', '1:30pm', 'true', '2021-06-30', '2:30pm', 1, 1, 25,'true','true','true', 0);
insert into SERVICETICKET values (2, '2021-01-01','2021-02-25','4:00pm','2021-02-01', '2021-02-07', 'Auction', '1:30pm', 'true', '2021-06-30', '2:30pm', 2, 1, 50,'true','false','true', 0);
insert into SERVICETICKET values (3, '2021-01-01','2021-02-25','4:00pm','2021-02-01', '2021-02-07', 'Move', '1:30pm', 'true', '2021-06-30', '2:30pm', 3, 1, 75,'true','false','false', 0);


insert into SERVICEREQUEST values ('Move', '2021-06-15', 'We have a lot of things to move this day and will need plenty of help!','Active', 1);
insert into SERVICEREQUEST values ('Auction', '2021-06-30', 'We want to sell all of our bowls!', 'Active', 1);
insert into SERVICEREQUEST values ('Move', '2021-01-31', 'Help us!', 'Active', 1);


insert into Address values (null, 1, 'street', 'city','state ', '123', 'description');
insert into Address values (null, 2, 'street', 'city','state ', '123', 'description');
insert into Address values (3, 3, 'street', 'city','state ', '123', 'description');


insert into INVENTORY values (1,'Bowl','Blue bowl', 500.23,  2);
insert into INVENTORY values (3,'mouse','Small bowl', 15.00,  1);
insert into INVENTORY values (2,'Lamp','Big bowl', 12.50,  2);
insert into INVENTORY values (3, 'Couch','Tiny bowl', 18.90, 1);
insert into INVENTORY values (1,'TV','Red bowl', 10000,  3);

insert into ASSIGNMENT values (1, 1);
insert into ASSIGNMENT values (1, 2);
insert into ASSIGNMENT values (2, 1);
insert into ASSIGNMENT values (2, 3);
insert into ASSIGNMENT values (3, 1);

insert into TICKETHISTORY values ('2021-01-01','Fragile','Customer says be careful with his small bowl',1,1);
insert into TICKETHISTORY values ('2021-01-03','Big Fragile','Customer also says be careful with his big bowl',1,2);
insert into TICKETHISTORY values ('2021-02-01','Phone change','Call customer at work number',2,2);
insert into TICKETHISTORY values ('2021-02-04','Call at home','Call customer at home number',3,2);