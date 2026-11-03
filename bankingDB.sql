SHOW databases;

create database bankingDB;
use bankingDB;

create table customers(
customerID int,
firstname varchar(50),
lastname varchar(50),
email varchar(100),
phone varchar(10)
);

alter table customers
add constraint PK_CustomerID primary key (customerID);

alter table customers
add DateofBirth date;

desc customers;

select * from customers; 

ALTER table customers
ADD AccountCreationDate Date;

create table Accounts(
AccountID int,
AccountType varchar(20),
balance decimal(10,2)
);
alter table accounts
add constraint PK_AccountId primary key (AccountID);

alter table accounts
add constraint Chk_MinBalance
check (balance >= 1000);

alter table accounts
add CustomerID int;

alter table accounts
add constraint FK_Account_Customers
foreign key (customerID)
references customers(customerID);

alter table accounts
add BranchID int;

alter table accounts
add constraint FK_Account_Branches
foreign key (BranchID)
references branches(BranchID);

desc accounts;

create table transactions(
TransactionID int,
TransactionDate date,
Ammount decimal(10,2),
TransationType varchar(20)
);
alter table transactions
add constraint PK_TransactionID primary key (TransactionID);

alter table transactions
add AccountID int;

alter table transactions
add constraint FK_Transaction_Account
foreign key (AccountID)
references accounts(accountid);

desc transactions;

create table Branches(
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(10)
);
alter table Branches
add constraint PK_BranchID primary key (branchID);

create table AccountBranches(
AssigmentDate date
);

drop table accountbranches;


    desc accountbranches;
    
select * from branches;

create table Loans(
LoanID int,
LoanAmount decimal(10,2),
InterestRate decimal(5,2),
Startdate date,
Enddate date
);
alter table loans
add constraint PK_LoanID primary key (LoanID);

alter table loans
add CustomerID int;

alter table loans
add constraint FK_Loans_Customers
foreign key (CustomerID)
references customers(customerID);

desc loans;

alter table loans
change Enddtae EndDate date;

alter table customers
modify phone varchar(20);

alter table customers
modify firstname varchar(50) NOT null;

desc customers;

alter table customers
add constraint UN_Email unique (Email);

alter table customers
alter column lastname set default "NA";

desc transactions;

select * from accounts;

create table KYC(
KYC_ID int primary key,
Adhar_num varchar(15),
Pan_num varchar(15),
customerID int,
foreign key (customerID) references customers(customerID)
);

desc kyc;

alter table kyc
modify Adhar_num varchar(15) not null;

alter table kyc
modify Pan_num varchar(10) not null;

show create table Accounts;

select
constraint_name,
constraint_type
from information_schema.table_constraints
where table_schema = 'bankingdb'
and table_name = 'accounts';

-- this is only for check table

insert into customers
values(101,'Amit','Sharma','amit@gmail.com','9876543210','2024-01-15','1998-05-10');

select * from customers;

insert into customers(customerID,Firstname,Lastname,Email,Phone,accountcreationdate,dateofbirth)
values(102,'Priya','Patil','priya@gmail.com','9876543211','2024-02-01','1999-08-22');

insert into customers(phone,email,lastname,firstname,accountcreationdate,dateofbirth,customerID)
values('9876543212','rahul@gmail.com','Verma','Rahul','2024-03-12','1997-11-14',103);
INSERT INTO Customers
VALUES
(104,'Sneha','Joshi','sneha@gmail.com','9876543213','2024-04-18','2000-01-05'),
(105,'Karan','Mehta','karan@gmail.com','9876543214','2024-05-25','1996-12-30');

alter table branches
modify BranchPhone varchar(15);

INSERT INTO Branches
VALUES
(1,'Nagpur Branch','Sitabuldi, Nagpur','0712-123456'),
(2,'Pune Branch','Shivaji Nagar, Pune','020-223344'),
(3,'Mumbai Branch','Andheri, Mumbai','022-334455');

select * from branches;

INSERT INTO Accounts
VALUES
(1001,'Savings',25000,101,1),
(1002,'Current',45000,102,2),
(1003,'Savings',18000,103,1),
(1004,'Current',72000,104,3),
(1005,'Savings',15000,105,2);

INSERT INTO Transactions
VALUES
(1,'2025-01-10',5000,'Deposit',1001),
(2,'2025-01-12',2000,'Withdrawal',1001),
(3,'2025-01-13',7000,'Deposit',1002),
(4,'2025-01-15',3000,'Withdrawal',1003),
(5,'2025-01-16',10000,'Deposit',1004);

select * from transactions;

INSERT INTO Loans
VALUES
(501,500000,8.5,'2024-01-01','2029-01-01',101),
(502,250000,9.0,'2024-03-15','2028-03-15',103),
(503,700000,7.8,'2024-06-20','2031-06-20',104);

select * from loans;

update customers
set email = 'amit2026@gmail.com'
where customerID = 101;

update customers
set lastname = 'Joshi'
where customerID =102;

 select * from customers;
 
 update branches
 set branchaddress = 'Civil Lines, Nagpur',
 branchphone = '0712-562692'
 where branchid = 1;
 
 select * from KYC;
 
 insert into KYC
 values(701,'2753-6326-2678','HNF3678578',101),
 (702,'2738-6372-8356','HFDF749639',102),
 (703,'3648-6283-7363','HJJ739679',103);
 
alter table KYC
modify Pan_num varchar(15);

delete from KYC where KYC_ID = 702;

delete from kyc;