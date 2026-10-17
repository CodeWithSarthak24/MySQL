-- MySQL INDEXES

use DB3;

create table Employees(
id int auto_increment,
name varchar(60),
dob date,
salary decimal(7,2),
department enum('Ai/Ml', 'Saleforce', 'Full Stack'),
primary key (id)
);

insert into Employees (name, dob, salary, department) values 
('abx','2001-02-11', 20000.00, 'Ai/Ml'), ('rtr','1999-10-09', 76980.00, 'Full Stack'), ('bnd','1901-02-11', 20900.00, 'Saleforce'),
('uiy','2009-12-19', 87000.00, 'Saleforce'),('wer','2012-09-11', 34000.00, 'Saleforce'),('awh','1901-02-11', 76000.00, 'Ai/Ml');


select id from Employees where department = 'Saleforce';

-- MySQL Create Index

create index emp_index
on Employees(department);

-- show index

show index from Employees;

-- drop index

drop index emp_index on Employees;

-- The MySQL ALTER... DROP Statement

alter table Employees drop index emp1_index;
 
 -- ALTER... ADD Command
 
alter table Employees add index emp1_index (dob);

-- alter table Employees add unique index emp2_index (dob);

 -- alter table Employees add unique index emp3_index (id, name);
 
  -- alter table Employees add index emp4_index (id, name);
 
 -- Unique Index
 
alter table Employees add unique index emp2_index (name);
  
-- Composite Indexes
  
alter table Employees add index emp3_index (id, name);