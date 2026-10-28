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

create table transactions(
TransactionID int,
TransactionDate date,
Ammount decimal(10,2),
TransationType varchar(20)
);
alter table transactions
add constraint PK_TransactionID primary key (TransactionID);

desc Accounts;

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

desc loans;

alter table loans
change Enddtae EndDate date;



