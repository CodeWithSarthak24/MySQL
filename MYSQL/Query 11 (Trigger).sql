create database DB5;
use DB5;

create table Users(
id int auto_increment,
name varchar(70),
salary_per_hour decimal(10,2) default 0, 
total_work_hour int default 0,
total_salary decimal(10,2) default 0,
primary key (id)
);

insert into Users (name, salary_per_hour, total_work_hour) values
('Alice Smith', 2000.00, 6), ('Bob Jones', 1800.75, 3), ('Charlie Brown', 4500.00, 12),
('Diana Prince', 3200.00, 4), ('Evan Wright', 2000.00, 8);

insert into Users (name, salary_per_hour, total_work_hour) values
('Oggy', 200.00, 6), ('Jack', 180.75, 3), ('Jerry', 500.00, 12);

update Users set salary_per_hour = 10000, total_work_hour = 5 where id = 5;

-- 1. Turn the safety restriction off 

set sql_safe_updates = 0;

delete from Users where name = 'Evan Wright';

-- 3. Turn the safety restriction back on 

SET sql_safe_updates = 1;

select * from Users;

delimiter //  

create trigger users_trigger
before insert on Users
for each row
begin
set new.total_salary = new.salary_per_hour * new.total_work_hour;
end; //

delimiter ;

delimiter //  

create trigger users_update_trigger
before update on Users
for each row
begin
set new.total_salary = new.salary_per_hour * new.total_work_hour;
end; //

delimiter ;

delimiter //  

create trigger users_delete_trigger
before delete on Users
for each row
begin
if old.total_salary > 15000 then
signal sqlstate '45000'
set message_text = 'Cannot delete this employee';
end if;
end; //

delimiter ;

create table audit(
id int auto_increment,
name varchar(70),
message varchar(80),
primary key (id)
);

delete from Users where name = 'Bob Jones';

delete from Users where name = 'Jerry';

select * from audit;

delimiter //  

create trigger users_audit_trigger
after delete on Users
for each row
begin
insert into audit (id, name, message) values 
(old.id, old.name, 'Delete successed!');
end; //

delimiter ;


-- using concat here
/*
insert into audit (id, name, message) values 
(old.id, old.name, concat('Message : '));

insert into audit (id, name, message) values 
(old.id, old.name, concat('Message : ', OLD.name, ' deleted successfully!'));
*/
