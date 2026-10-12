create database Db1;
use Db1;

show databases;
select database();

create table Tb1(
Id int,
Name varchar(40)
);

insert into Tb1 values (123, 'Sarthak sen'),
(178, 'Sachin dubey');

select * from  Tb1;

show tables;

describe Tb1;
