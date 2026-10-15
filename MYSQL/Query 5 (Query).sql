-- MySQL Queries

create database DB3;
use DB3;

-- MySQL - Insert Query

create table TB1(
id int not null,
name varchar(70),
primary key (id, name)
);

insert into TB1 values (1, 'xyz'), (2, 'abc'),(3, 'pqr'),(4, 'rst');

select * from TB1;

-- Using INSERT... SELECT

create table CopyTable(
id int not null,
name varchar(70),
primary key (id, name)
);

insert into CopyTable select * from TB1;

select * from CopyTable;

-- MySQL Select Statement

select 56*10;

-- Aliasing a Column in SELECT Statement

select name as Student_Name from CopyTable where id = 2;

-- MySQL UPDATE Statement

update TB1 set id = 10 where id = 2 and name = 'abc';

-- MySQL DELETE Statement

delete from TB1 where id = 1;

-- MySQL REPLACE Statement

create table TB2(
id int not null,
name varchar(70),
gender char(1), 
primary key (id, name)
);

insert into TB2 values (12, 'xyz', 'm'), (72, 'pqr', 'f'), (56, 'abc', 'm');

replace into TB2 values (60, 'def', 'm'); -- insert

replace into TB2 values (60, 'alex', 'm'); -- replace

select * from TB2;

-- MySQL Insert Ignore Statement

alter table TB2 add column email varchar(50);
alter table TB2 add constraint constraint_unique unique (email);

insert into TB2 values (128, 'sarthak', 'm', 'xyz@gmail.com');
insert ignore into TB2 values (160, 'Thomas', 'm', 'xyz@gmail.com');

--  MySQL Insert on Duplicate Key Update Statement

insert ignore into TB2 values (128, 'Thomas', 'm', 'xyz@gmail.com')
on duplicate key update 
name = 'Thomas', gender = 'm', email = 'xyz@gmail.com'


