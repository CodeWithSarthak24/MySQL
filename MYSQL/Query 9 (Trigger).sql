 use DB4;
 
 -- MySQL - Before After Trigger

 create table Student(
 id int auto_increment,
 name varchar(70),
 dob date,
 primary key(id)
 );
 
 insert into Student (name, dob) values
 ('Amit Sharma', '2004-08-15'), ('Neha Verma', '2005-01-22'), ('Ravi Kumar', '2004-03-10'),
 ('Sonal Gupta', '2005-07-05'), ('Karan Singh', '2003-12-30');
 
 select *  from Student;
 
  insert into Student (name, dob) values
 ('Sharma', '2004-08-15'), ('Verma', '2005-01-22'), ('Kumar', '2004-03-10'),
 ('Gupta', '2005-07-05'), ('Singh', '2003-12-30');
 
-- MySQL - After After Trigger
 
 CREATE TABLE USERS(
   ID INT AUTO_INCREMENT,
   NAME VARCHAR(100) NOT NULL,
   AGE INT NOT NULL,
   BIRTH_DATE VARCHAR(100),
   PRIMARY KEY(ID)
);
 
 CREATE TABLE PUSH_NOTIFICATIONS(
   ID INT AUTO_INCREMENT,
   BIRTH_DATE VARCHAR(100),
   NOTIFICATIONS VARCHAR(255) NOT NULL,
   PRIMARY KEY(ID)
);

INSERT INTO USERS (NAME, AGE, BIRTH_DATE) VALUES 
('Sasha', 23, 'December'),('Alex', 21, 'April'),('arz', 28, 'April');

select * from USERS;

SELECT * FROM PUSH_NOTIFICATIONS;

-- MySQL Before Update Trigger

-- 1. Turn the safety restriction off 

SET SQL_SAFE_UPDATES = 0;

update USERS set AGE = -1 where name = 'arz';

-- 3. Turn the safety restriction back on 

SET SQL_SAFE_UPDATES = 1;

-- MySQL - Before Delete Trigger

 CREATE TABLE USERS_COPY(
   ID INT AUTO_INCREMENT,
   NAME VARCHAR(100) NOT NULL,
   AGE INT NOT NULL,
   BIRTH_DATE VARCHAR(100),
   PRIMARY KEY(ID)
);

DELETE FROM USERS WHERE ID = 2;

select * from USERS_COPY;