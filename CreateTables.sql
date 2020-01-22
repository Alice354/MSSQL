-- Use COMPANY Database 
Use COMPANY; 
Go

-- CREATE AN EMPLOYEE TABLE
CREATE TABLE EMPLOYEE(
FNAME varchar(15)	not null,
MINIT char,
LNAME varchar(15) not null,
SSN char(9) not null,
BDATE date,  
ADDRESS varchar(50) not null,
SEX char,
SALARY int not null,
SUPERSSN char(9) not null,
DNO tinyint not null
); 

-- CREATE A DEPARTMENT TABLE
CREATE TABLE DEPARTMENT(
DNAME varchar(15) not null,
DNUMBER tinyint not null,
MGRSSN char(9) not null,
MGRSTARTDATE date
); 

-- CREATE A DEPENDENT TABLE
CREATE TABLE DEPENDENT(
ESSN int not null,
DEPENDENT_NAME varchar(50)	not null,
SEX char NOT NULL,
BDATE date NOT NULL,  
RELATIONSHIP varchar(50)  not null
);

-- CREATE A DEPT_LOCATIONS TABLE
CREATE TABLE DEPT_LOCATIONS(
DNUMBER tinyint	not null, 
DLOCATION varchar(50)  not null
); 

-- CREATE A PROJECT TABLE
CREATE TABLE PROJECT(
PNAME varchar(50)	not null,
PNUMBER tinyint not null,
PLOCATION varchar(50)  not null,
DNUM tinyint not null
); 

-- CREATE A WORKS_ON TABLE
CREATE TABLE WORKS_ON(
ESSN int not null,
PNO tinyint	not null,
Hours decimal 
);