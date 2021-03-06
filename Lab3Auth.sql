--drop table Pass;
--drop table Person;

CREATE TABLE Person(
UserID int IDENTITY (1,1) NOT NULL,
FirstName varchar(20) NOT NULL,
LastName varchar(30) NOT NULL,
Username varchar (20) NOT NULL,
PersonType varchar(30) NOT NULL,
PRIMARY KEY (UserID));

CREATE TABLE Pass(
UserID int FOREIGN KEY references Person(UserID) NOT NULL,
Username varchar(30) NOT NULL,
PasswordHash varchar(256) NOT NULL,
PRIMARY KEY (UserID));


--Add Values To Person Table
Insert into Person values ('Stuart', 'Walker', 'Walker@dukes.com', 'Customer');
Insert into Person values ('Aaron', 'Walsh', 'Walsh@dukes.com', 'Customer');
Insert into Person values ('Kyle', 'Ledford', 'Ledford@dukes.com', 'Customer');
Insert into Person values ('John', 'Smith', 'Smith@dukes.com', 'Customer');
Insert into Person values ('Jake', 'Brown', 'Brown@dukes.com', 'Customer');
Insert into Person values ('Prof', 'Ezell', 'Ezell@dukes.com', 'Employee');
Insert into Person values ('Jack', 'Frost', 'Frost@dukes.com', 'Employee');
Insert into Person values ('Admin', 'Admin', 'admin', 'Customer');


--Add Values To Pass Table
Insert into Pass values (1, 'Walker@dukes.com', '1000:JfF+8X2bGiIzLJLgOnJU3ITDh5Iw/utM:gkVkHdwvEMRf00ODb6oCpDel6Pw='); --Hash is for 'password'
Insert into Pass values (2, 'Walsh@dukes.com', '1000:JfF+8X2bGiIzLJLgOnJU3ITDh5Iw/utM:gkVkHdwvEMRf00ODb6oCpDel6Pw='); --Hash is for 'password'
Insert into Pass values (3, 'Ledford@dukes.com', '1000:JfF+8X2bGiIzLJLgOnJU3ITDh5Iw/utM:gkVkHdwvEMRf00ODb6oCpDel6Pw='); --Hash is for 'password'
Insert into Pass values (4, 'Ezell@dukes.com', '1000:JfF+8X2bGiIzLJLgOnJU3ITDh5Iw/utM:gkVkHdwvEMRf00ODb6oCpDel6Pw='); --Hash is for 'password'
Insert into Pass values (5, 'Frost@dukes.com', '1000:JfF+8X2bGiIzLJLgOnJU3ITDh5Iw/utM:gkVkHdwvEMRf00ODb6oCpDel6Pw='); --Hash is for 'password'
Insert into Pass values (8, 'admin', '1000:JfF+8X2bGiIzLJLgOnJU3ITDh5Iw/utM:gkVkHdwvEMRf00ODb6oCpDel6Pw='); --Hash is for 'password'
