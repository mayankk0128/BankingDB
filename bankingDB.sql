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
and table_name = 'loans';

-- this is only for check table 




