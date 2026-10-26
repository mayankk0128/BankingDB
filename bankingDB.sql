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

desc customers;

select * from customers; 

ALTER table customers
ADD AccountCreationDate Date;

create table Accounts(
AccountID int,
AccountType varchar(20),
balance decimal(10,2)
);

create table transactions(
TransactionID int,
TransactionDate date,
Ammount decimal(10,2),
TransationType varchar(20)
);
desc Accounts;