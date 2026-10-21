-- Practice Sheets
-- Ques 1:

use DB5;

create table BackendTeams(
emp_id int not null auto_increment,
name varchar(90) not null,
salary decimal(10,2) not null,
primary key(emp_id)
);

insert into BackendTeams (name, salary) values
('Aarav Sharma', 95000.00),('Priya Verma', 110000.50),
('Sarthak sen', 275000.00);

create table CompanyBackupData(
emp_id int not null auto_increment,
name varchar(90) not null,
old_salary decimal(10,2) not null,
updated_salary decimal(10,2) not null,
message varchar(90) default 'not updated!',
primary key(emp_id)
);

-- Trigger

delimiter //

create trigger Rag_private_limited_tmc
before update
on BackendTeams
for each row
begin

if old.salary <> new.salary then
insert into CompanyBackupData (name, old_salary, updated_salary, message) values
(old.name, old.salary, new.salary, 
concat('your new salary has been recorded successfully !'));
end if;

end; //

delimiter ;

set sql_safe_updates = 0;

update BackendTeams set salary = 795000.00  where name = 'Sarthak sen';

set sql_safe_updates = 1;

select * from BackendTeams;

select * from CompanyBackupData;