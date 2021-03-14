--drop table tickethistory;
--drop table assignment;
--drop table equipment;
--drop table inventory;
--drop table ServiceRequest;
--drop table serviceticket;
--drop table auction;
--drop table Customer;
--drop table employee;


--Create tables in database
create table CUSTOMER (
	CustomerID		int not null identity(1, 1) primary key,
	FirstName		varchar(255),
	LastName		varchar(255),
	CellPhone			varchar(15),
	WorkPhone			varchar(15),
	HomePhone			varchar(15),
	Email			varchar(255),

	MovingCB		bit,
	AuctionCB		bit,
	ConsignmentCB		Bit,
	AppraiselCb		Bit,

	ItemTransportation varchar(200),
	InitialContact	varchar(255),
	ReferralChannel	varchar(255),	
	DateContacted	varchar(20),
	DeadlineStart	varchar(20),
	DeadlineEnd		varchar(20),
	CustomerNotes	varchar (250),
	Completed		bit
);
create table EMPLOYEE (
	EmployeeID		int identity(1, 1) primary key,
	EmpFirstName	varchar(255),
	EmpLastName		varchar(255)
);

create table AUCTION (
	AuctionID	int identity(1, 1) primary key,
	AuctionDate varchar(20),
);
create table SERVICETICKET (
	ServiceTicketID	int not null identity(1, 1) primary key,
	CustomerID		int references Customer(CustomerID),
	TicketStatus	varchar(255),
	TicketOpenDate	varchar(20),
	ServiceDate		varchar(20),
	ServiceCost		float,
	CompletionDate	varchar(20),
	ServiceType		char(20),
	DestinationTime	varchar(255),
	GasExpense		float,
	MiscExpense		float,
	LookAtCB		Bit,
	LookAtDate			Date,
	LookAtTime		Time,
	ContactID		int references EMPLOYEE(EmployeeID),
	InitiatingEmp	int references Employee(EmployeeID),
	AuctionID		int references Auction(AuctionID),
	Completed		bit
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
	RequestStatus		bit,
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


---------------------------------------------
--Adding data to database--
---------------------------------------------

insert into CUSTOMER values ('Aaron', 'Walsh', '1234567822','123456789', '123456789','walsh@dukes.com',1, 0, 0,0, 'pick up' , 'phone','poster','2021-03-07', '2021-03-07','2021-03-07','notes',0 );
insert into CUSTOMER values ('Kyle', 'Ledford', '9876543221', '123456789', '123456789', 'ledford@dukes.com', 'Auction','9172 Blvd', 'Tyler', 'TX','','','','By Phone','poster', 15.45, '2021-03-17','2021-04-30','', 1);
insert into CUSTOMER values ('Stuart', 'Walker', '8045640548','123456789', '123456789', 'stuart@dukes.com', 'Both','1823 Rd','Harrisonburg', 'VA','1560 Rd','Richmond','VA','Email','news ad', 10.20, '2021-01-05','2021-02-15','', 1);
insert into CUSTOMER values ('John', 'Smith', '8045640548','123456789', '123456789', 'smith@dukes.com', 'Move','','', '','','','','Carrier Pigeon','', 0, '','','', 0);
insert into CUSTOMER values ('Jake', 'Brown', '7038459502','123456789', '123456789', 'brown@dukes.com', '','','', '','','','','','', 0, '','','', 0);
insert into CUSTOMER values ('admin', 'admin', '7038459502','123456789', '123456789', 'admin', '','','', '','','','','','', 0, '','','', 0);

insert into EQUIPMENT values ('Pickup Truck #1');
insert into EQUIPMENT values ('Pickup Truck #2');
insert into EQUIPMENT values ('Forklift');
insert into EQUIPMENT values ('Box Truck');
insert into EQUIPMENT values ('Pallet Jack');

insert into EMPLOYEE values ('Jack', 'Frost');
insert into EMPLOYEE values ('Professor','Ezell');
insert into EMPLOYEE values ('Camille', 'Wood');

insert into Auction values ('Unassigned');
insert into Auction values ('2021-02-26');
insert into Auction values ('2021-03-05');

insert into SERVICETICKET values (1, 'In Progress', '2021-01-01','2021-02-01', 15.24, '2021-02-07', 'Move', '1:30pm', 18.56, 1.80, null, 1, null, 1);
insert into SERVICETICKET values (2, 'In Progress', '2021-02-01','2021-03-01', 100.25, '2021-03-07', 'Auction', '', '', '', 2, 1, 1, 1);
insert into SERVICETICKET values (3, 'In Progress', '2021-03-01','2021-04-01', 250, '2021-05-02', 'Move', '1:30pm', 18.56, 1.80, null, 3, null, 0);

insert into SERVICEREQUEST values ('Move', '2021-06-15', 'We have a lot of things to move this day and will need plenty of help!', 0, 4);
insert into SERVICEREQUEST values ('Auction', '2021-06-30', 'We want to sell all of our bowls!', 0, 4);
insert into SERVICEREQUEST values ('Move', '2021-01-31', 'Help us!', 1, 5);

insert into INVENTORY values (1,'Bowl','Blue bowl', 500.23,  2);
insert into INVENTORY values (3,'mouse','Small bowl', 15.00,  1);
insert into INVENTORY values (2,'Lamp','Big bowl', 12.50,  2);
insert into INVENTORY values (3, 'Couch','Tiny bowl', 18.90, 1);
insert into INVENTORY values (1,'TV','Red bowl', 10000,  3);

insert into ASSIGNMENT values (1, 1);
insert into ASSIGNMENT values (1, 2);
insert into ASSIGNMENT values (2, 1);
insert into ASSIGNMENT values (2, 2);

insert into TICKETHISTORY values ('2021-01-01','Fragile','Customer says be careful with his small bowl',1,1);
insert into TICKETHISTORY values ('2021-01-03','Big Fragile','Customer also says be careful with his big bowl',1,2);
insert into TICKETHISTORY values ('2021-02-01','Phone change','Call customer at work number',2,2);
insert into TICKETHISTORY values ('2021-02-04','Call at home','Call customer at home number',3,2);