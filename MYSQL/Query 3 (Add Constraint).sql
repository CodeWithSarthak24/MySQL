-- Add And Drop Constraint

use DB2;

CREATE TABLE TB3 (
    id INT,
    name VARCHAR(40),
    email VARCHAR(60),
    address VARCHAR(70)
);

-- Note: The ADD CONSTRAINT clause is only used for table-level constraints 
-- (like UNIQUE, CHECK, PRIMARY KEY, or FOREIGN KEY).

-- Add not null constraint

alter table TB3 modify column age int not null;

alter table TB3 modify column email VARCHAR(60) not null;

-- Add primary key constraint

alter table TB3 add constraint pk_tb3 primary key (id);

-- Add foreign key constraint

alter table TB3 add constraint fk_tb3 foreign key(fk_id) references TB3(id);

-- Add unique constraint

alter table TB3 add constraint unique_const unique (email);

-- Add default constraint

alter table TB3 alter column address set default 'Jaipur';

-- Add check constraint

alter table TB3 add constraint check_const check (age > 10);

-- Structure and Adding Column

describe TB3;

alter table Tb3 add column age int;
alter table Tb3 add column fk_id int;

select * from TB3;

insert into TB3 (id, name, email, age, fk_id) value 
(178, 'xyz', 'xyz@gmail.com', 12, null);

update TB3 set fk_id = 178 where id = 178;