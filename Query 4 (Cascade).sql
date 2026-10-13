-- Cascade in SQL

use DB2;

-- A)  on update cascade

create table TB6 (
id int,
name varchar(60),
primary key(Id)
);

show create table TB6;

insert into TB6 values (1, 'xyz'), (2, 'abc');

select * from TB6;

create table TB7(
orderId int,
quantity int,
id int,
primary key(id),
foreign key(id) references TB6(id)
on update cascade
);

show create table TB7;

insert into TB7 values (112, 78, 1), (122, 18, 2);

select * from TB7;

update TB6 set id = 89 where id = 1;

-- B) on delete cascade

create table TB8 (
id int,
name varchar(60),
primary key(Id)
);

show create table TB8;

insert into TB8 values (1, 'xyz'), (2, 'abc');

select * from TB8;

create table TB9(
orderId int,
quantity int,
id int,
primary key(id),
foreign key(id) references TB8(id)
on delete cascade
);

show create table TB9;

insert into TB9 values (112, 78, 1), (122, 18, 2);

delete from TB8 where id = 2;

select * from TB9;

-- C) on delete set null
--    on delete set null 

create table TB10 (
id int,
name varchar(60),
primary key(Id)
);

show create table TB10;

insert into TB10 values (1, 'xyz'), (2, 'abc');

select * from TB10;

create table TB11(
orderId int AUTO_INCREMENT PRIMARY KEY,
quantity int,
id int,
foreign key(id) references TB10(id)
on delete set null
on update set null
);

show create table TB11;

insert into TB11 values (112, 78, 1), (122, 18, 2);

delete from TB10 where id = 1;

select * from TB11;

-- D) ON UPDATE RESTRICT
--    ON DELETE RESTRICT

--  your query is terminated, it will not be executed against the database, and you will get a strict error message.

create table TB12 (
id int,
name varchar(60),
primary key(Id)
);

show create table TB12;

insert into TB12 values (1, 'xyz'), (2, 'abc');

select * from TB12;

create table TB13(
orderId int AUTO_INCREMENT PRIMARY KEY,
quantity int,
id int,
foreign key(id) references TB12(id)
on delete restrict
on update restrict
);

show create table TB13;

insert into TB13 values (112, 78, 1), (122, 18, 2);

delete from TB12 where id = 1;

select * from TB13;

-- E) ON DELETE NO ACTION
--  The database blocks your delete query and throws an error.