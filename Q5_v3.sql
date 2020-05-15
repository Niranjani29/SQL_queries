-- DB Browser SQLite

-- There are two tables, "Jobs"(containing names of instructor with the subjects they can teach ) and "Subjects" (Names of the subjects they should teach ).
-- The innermost query selects those rows from the "Jobs" table that can teach any of the required subjects. However this has multiple instructor name duplicates. The query outside uses a "not exist" operator which leads to selecting those subjects that are not in the inner query. The outer query selects distinct instructors which successfully give the instructor's names that can teach the subjects since it uses another not exists and deselects the subjects.


-- create table Jobs (  
--     Instructor varchar2(100) not null,  
--     Subject varchar2(100) not null,
--     primary key(Instructor, Subject)
-- );
-- create table Subjects (  
--     Subject varchar2(100) not null primary key  
-- );

-- insert into Jobs values('Aleph','Scratch')  
-- insert into Jobs values('Aleph','Java') 
-- insert into Jobs values('Aleph','Processing')
-- insert into Jobs values('Bit','Python') 
-- insert into Jobs values('Bit','JavaScript') 
-- insert into Jobs values('Bit','Java') 
-- insert into Jobs values('CRC','Python')
-- insert into Jobs values('CRC','JavaScript') 
-- insert into Jobs values('Dat','Scratch')  
-- insert into Jobs values('Dat','Python')  
-- insert into Jobs values('Dat','JavaScript')
-- insert into Jobs values('Emscr','Scratch')
-- insert into Jobs values('Emscr','Processing')
-- insert into Jobs values('Emscr','JavaScript')
-- insert into Jobs values('Emscr','Python') 
-- select * from dual;

-- insert into Subjects values ('Javascript') 
-- insert into Subjects values ('Scratch')
-- insert into Subjects values ('Python') 
-- select * from dual;

-- select * from Jobs;
-- select * from Subjects;

select distinct x.Instructor
from Jobs x
where not exists (
select *
from Subjects y
where not exists (
select *
from Jobs z
where (z.Instructor=x.Instructor)
and (z.Subject=y.Subject)));