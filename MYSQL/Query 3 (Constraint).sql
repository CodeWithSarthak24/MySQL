-- MySQL Queries

-- MYSQL CONSTRAINT

create database if not exists DB2;
use DB2;

create table User(
userId int primary key auto_increment,
name varchar(60) not null,
emailId varchar(50) unique,
address varchar(60) default 'Pune',
phoneNumber char(10) check(phoneNumber regexp '^[0-9]{10}$')
);

insert into User (name, emailId, address, phoneNumber) values 
('Sarthak', 'xyz@gmail.com', 'L.A', '9898908980'),
('Thomas', 'abc@gmail.com', 'L.A', '9898908990'),
('Alex', 'pqr@gmail.com', 'L.A', '9898908970'),
('John', 'klm@gmail.com', 'L.A', '9898908960');

select * from User;

create table Orders(
orderId int primary key auto_increment,
name varchar(60) not null,
quantity int not null,
userId int,
foreign key(userId) references User(userId)
);

insert into Orders (name, quantity, userId) values 
('PS-6', 2, 1),
('PS-6', 2, 2),
('PS-6', 2, 3);

select * from Orders;
