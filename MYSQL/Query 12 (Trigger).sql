-- Suppose if i add account of any particular user in account table
-- then a update trigger count total account of that particular account.
-- And if delete that particular account another delete trigger will delete its account count

use DB5;

create table UserDetail(
id int auto_increment,
name varchar(70),
salary_per_hour decimal(10,2) default 0, 
total_work_hour int default 0,
total_salary decimal(10,2) default 0,
account_count int default 0,
primary key (id)
);

insert into UserDetail (name, salary_per_hour, total_work_hour)values 
('Alice Smith', 2000.00, 9), ('Bob Jones', 1800.00, 12), ('Charlie Brown', 4500.00, 12),
('Diana Prince', 3200.00, 7), ('Evan Wright', 1500.00, 8);

select * from  UserDetail;

create table Account (
account_id int primary key,
name varchar(70),
id int,
balance decimal(10,2) default 0
);

insert into Account values
(8659, 'Diana Prince', 4, 90000.00), (8609, 'Diana Prince', 4, 64000.00);

set sql_safe_updates = 0;

delete from Account where account_id = 8659;

set sql_safe_updates = 1;

select * from Account;

delimiter //  

create trigger user_detail_trigger
before insert on  UserDetail
for each row
begin
set new.total_salary = new.salary_per_hour * new.total_work_hour;
end; //

delimiter ;

delimiter //

create trigger account_update_trigger
before insert 
on Account
for each row
begin
update UserDetail set account_count = account_count + 1 where id = new.id;
end;//
delimiter ;

-- here we dont use like:
-- update UserDetail set old.account_count = old.account_count + 1 where old.id = new.id;

-- • new and old only belong to the Account table: Triggers can only use new or old to look at the row being added or removed in the table the trigger is attached to (which is Account).
-- • UserDetail is a completely separate table: Since account_count lives inside UserDetail, the trigger cannot use new.account_count or old.account_count.

delimiter //

create trigger account_delete_trigger
before delete 
on Account
for each row
begin
update UserDetail set account_count = account_count - 1 where id = old.id;
end;//

 -- UPDATE UserDetail
-- SET account_count = account_count - 1
-- WHERE id = OLD.id
-- AND account_count > 0;
delimiter ;

-- update UserDetail set account_count = account_count - 1 where id = old.id;
-- here i use old because i already have that id so i just use it directly
