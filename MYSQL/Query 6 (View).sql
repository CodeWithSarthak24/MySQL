-- MySQL VIEW

use DB3;

create table Person(
id int not null auto_increment,
name varchar(70),
password varchar(70),
primary key (id)
);

insert into Person (name, password) values
('Sarthak', '12345'),('Thomas', '12346'),('Tim', '12347'),('Travis', '12348'),
('Alex', '12349'),('Kevin', '12350'),('Charles', '12351'),('Drake', '12352');

select * from Person;

-- MySQL CREATE VIEW

create view PersonView as  
select * from Person;

select * from PersonView;

-- With REPLACE and IF NOT EXISTS Clauses

create or replace view PersonView as  
select id from Person;

-- With WHERE Clause

create or replace view PersonView as 
select id, name from Person where name in ('Sarthak', 'Kevin'); -- select id from Person where name = 'Sarthak';

-- With Check Option

create table Company(
JobId int auto_increment,
Name varchar(70),
Role varchar(70),
Salary decimal(7,2),
primary key (JobId)
);

insert into Company (Name, Role, Salary) value 
('Sarthak', 'Full Stack', 90900.00), ('Alex', 'Agile', 75000.00),('Kevin', 'Deveops', 98700.00),
('James', 'Ai/Ml', 89000.00),('Tim', 'Apple Developer', 32100.00),('Travis', 'System Engineering', 43200.00);

select * from Company;

create view CompanyView as 
select Name, Role, Salary from Company
where Role = 'Agile'
with check option;

select * from CompanyView;

insert into CompanyView values ('Yusuf', 'Agile', 30000.00);
insert into CompanyView values ('Maasom', 'Ai', 67000.00);

-- MySQL UPDATE View Statement

-- With Check Option

create table Company(
JobId int auto_increment,
Name varchar(70),
Role varchar(70),
Salary decimal(7,2),
primary key (JobId)
);

insert into Company (Name, Role, Salary) value 
('Sarthak', 'Full Stack', 90900.00), ('Alex', 'Agile', 75000.00),('Kevin', 'Deveops', 98700.00),
('James', 'Ai/Ml', 89000.00),('Tim', 'Apple Developer', 32100.00),('Travis', 'System Engineering', 43200.00);

select * from Company;

create view CompanyView as 
select Name, Role, Salary from Company
where Role = 'Agile'
with check option;

select * from CompanyView;

insert into CompanyView values ('Yusuf', 'Agile', 30000.00);
insert into CompanyView values ('Maasom', 'Ai', 67000.00);

-- MySQL UPDATE View Statement

-- update CompanyView set Name = 'Drake' where Role = 'Agile';

-- Display the list of views using the query

SHOW FULL TABLES WHERE table_type = 'VIEW';

-- MySQL rename View Statement

rename table CompanyView to PrivateSectorView;

