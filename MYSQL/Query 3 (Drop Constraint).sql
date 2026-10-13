-- Add And Drop Constraint

use DB2;

CREATE TABLE TB4 (
    id INT,
    name VARCHAR(40),
    email VARCHAR(60) not null unique,
    age int not null check (age > 10),
    address VARCHAR(70) default 'Jaipur',
	primary key (id),
    fk_id int,
    foreign key(fk_id) references TB3(id)
);

-- Note: The ADD CONSTRAINT clause is only used for table-level constraints 
-- (like UNIQUE, CHECK, PRIMARY KEY, or FOREIGN KEY).

-- Drop not null constraint

alter table TB4 modify column email varchar(60) null;
alter table TB4 modify column age int null;

-- Drop primary key constraint

alter table TB4 drop primary key; -- because we have only one primary key we dont need name

-- Drop foreign key constraint

alter table TB4 drop constraint tb4_ibfk_1;

-- Drop unique constraint

alter table TB4 drop index email;

-- Drop default constraint

alter table TB4 alter column address drop default;

-- Drop check constraint

alter table TB4 drop constraint tb4_chk_1;

-- Structure and Adding Column

describe TB4;

show index from TB4;

drop table TB4;

show create table TB4; -- only reads information from the database;

select * from TB4;


CREATE TABLE TB5 (
    id INT,
    name VARCHAR(40),
    email VARCHAR(60) not null unique,
    age int not null check (age > 10),
    address VARCHAR(70) default 'Jaipur',
	primary key (id),
    fk_id int,
    foreign key(fk_id) references TB3(id)
);

-- Drop not null constraint

alter table TB5 modify column email varchar(60) null;

-- Drop primary key constraint

alter table TB5 drop primary key;

-- Drop foreign key constraint

alter table TB5 drop constraint tb5_ibfk_1;

-- Drop unique constraint

alter table TB5 drop constraint email;

-- Drop default constraint

alter table TB5 alter column address drop default;

-- Drop check constraint

alter table TB5 drop constraint  tb5_chk_1;

-- Structure and Adding Column

describe TB5;

show index from TB5;

drop table TB5;

show create table TB5; 

select * from TB5;
