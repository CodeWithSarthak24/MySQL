-- MySQL Trigger

create database DB4;
use DB4;

create table Admission(
id int auto_increment,
name varchar(70),
age int,
primary key(id)
);

insert into Admission (name, age) values
('avc', 19), ('gfd', 16), ('yuc', 23), ('aqw', -10);

select * from Admission;

insert into Admission (name, age) values
('pqr', -10);