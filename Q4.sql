--Oracle

-- create table Postal ( 
--     Name varchar2(20) not null, 
--     Address varchar2(1), 
--     ID number not null,
--     SameFam number,
--     Primary key(ID)
-- );

-- insert all 
--     into Postal values('Alice', 'A', 10, NULL) 
--     into Postal values('Bob', 'B', 15, NULL) 
--     into Postal values('Carmen', 'C', 22, NULL) 
--     into Postal values('Diego', 'A', 9, 10) 
--     into Postal values('Ella', 'B', 3, 15) 
--     into Postal values('Farkhad', 'D', 11, NULL) 
-- select * from dual;

-- select * from Postal;
delete
from Postal
where SameFam is NULL and ID in (
select SameFam from Postal where SameFam is not NULL);
select * from Postal;

update Postal
    set SameFam = NULL
    where SameFam is NOT NULL;