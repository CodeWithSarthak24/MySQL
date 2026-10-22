use Db1;

-- MySQL Create Table

create table Tb2(
Id int,
Name varchar(40),
Salary decimal(7,2)
);

insert into TB2 values (2378,'Sarthak sen', 50000.00);

select * from TB2;

-- MySQL Show Tables

show tables;

-- MySQL TRUNCATE Table

truncate table TB1;

-- MySQL Describe Table

desc TB1;

-- MySQL DROP Table

drop table if exists TB1;

-- MySQL Rename Table

rename table TB2 TO TBX;

-- MySQL ALTER Table

-- a) Dropping a Column

alter table TBX drop  Id;

-- b) Adding a Column

alter table TBX add Id int;

-- c) Repositioning a Column:  If we want a column to be placed at a specific position within the table, 

-- Here, we are removing the ID column from the table and then adding it back, 
-- positioning it after the NAME column using the AFTER col_name keyword.

alter table TBX drop Id;
alter table TBX add Id int after Name;

alter table TBX drop Salary;
alter table TBX add Salary decimal(7,2) first;

-- d) Altering a Column Definition or a Name

alter table TBX modify Id char(5);

-- e) Altering a Column's Default Value

alter table TBX ALTER Salary set default 10000.00;

-- ALTER TABLE table_name ALTER COLUMN column_name DROP DEFAULT;

-- f) Remove the default constraint

alter table TBX  alter Salary drop default;

-- g) Altering (Renaming) a Table

alter table TBX  rename to TB2;

-- -- MySQL Rename Column

alter table TB2 RENAME COLUMN Id to JobId;

-- -- MySQL Show Columns

show columns from TB2;

-- -- MySQL Add/Delete Column

alter table TB2 add column Experience varchar(50);

alter table TB2 add column Experience varchar(50),
add column Address varchar(50);

alter table TB2 drop column Experience, 
drop Address;

-- MySQL Temporary Table

create temporary table Temp1(
Id int,
JobRole varchar(70)
);

insert into Temp1 values (58697, 'DevOps');

drop temporary table if exists Temp1;

-- MySQL Copy Table

create table copy(
select Id, JobRole from Temp1
);

-- Another way
-- CREATE TABLE new_table_name  
-- SELECT column1, column2, column3   
-- FROM existing_table_name  

-- Another way
-- CREATE TABLE IF NOT EXISTS duplicate_table   
-- SELECT * FROM original_table;  

-- Another way
-- CREATE TABLE IF NOT EXISTS duplicate_table   
-- SELECT * FROM original_table WHERE Year = '2016';  
-- WHERE condition;  

-- change column and data type at same time
alter table table_name change column old_column_name new_column_name new_data_type;

-- Add auto_increment
ALTER TABLE users 
MODIFY COLUMN id INT NOT NULL AUTO_INCREMENT;

-- show all constraint (retrive the exact data definition languages)

show create table Table_name;
