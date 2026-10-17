-- MySQL Trigger

use DB4;

delimiter //

create trigger student_trigger
before insert on Admission
for each row
begin
if new.age < 0 then
set new.age = 0;
end if;
end//

delimiter ;

-- Viewing Triggers

show triggers;

-- Dropping a Trigger

drop trigger student_trigger;

-- MySQL - Before Insert Trigger

delimiter //

create trigger student_trigger2
before insert on Student
for each row
begin
if new.dob < '2004-10-15' then
set new.dob = '2026-10-16';
else set new.dob = '3200-10-16';
end if;
end//

delimiter ;

-- MySQL - After After Trigger

delimiter //

create trigger student_trigger3
before insert on USERS
for each row
begin
  IF NEW.BIRTH_DATE = 'December' THEN
insert into PUSH_NOTIFICATIONS values 
(new.ID, new.BIRTH_DATE, CONCAT('Happy Birthday ,', NEW.NAME, '!'));
end if;
end//

delimiter ;

-- MySQL Before Update Trigger

delimiter //

create trigger student_trigger4
before update on USERS
for each row
begin
  IF NEW.AGE < 1 THEN
signal sqlstate '50900'
set message_text = 'Age Cannot be Negative';
end if;
end//

delimiter ;

-- MySQL - Before Delete Trigger


delimiter //

create trigger student_trigger5
before delete on USERS
for each row
begin
insert into USERS_COPY values (old.id, old.name, old.age, old.birth_date);
end//

delimiter ;

-- OLD is a MySQL keyword that represents the row's data before it is deleted or updated.
-- end if;: You have an end if; statement, but there is no if condition in your trigger. It should be completely removed.