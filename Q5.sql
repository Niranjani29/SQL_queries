-- DB Browser SQLite

-- There are two tables, "Jobs"(containing names of instructors with the subjects they can teach) and "Subjects" (Names of the subjects the instructor should teach).This is an example of implementing SET DIVISION.
-- 1. WHERE: This operation returns names of instructors who can teach any of the subjects listed in the table "Subjects". It returns multiple rows of instructor names.
-- 2. GROUP BY: In order to resolve the issue, it is necessary to group all queries by the Instructors names.
-- 3. HAVING: The WHERE condition returns names of Instructors who can teach any of the subjects. Since we want instructors who can teach all of the subjects, we count the number of subjects in the "Subjects" table and also count the number of subjects each instructor can teach. If they are equal, the Instructors name is selected.


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

select Instructor
from Jobs
where Subject in (select * from Subjects)
group by Instructor
having Count(Subject)=(select count(*) from Subjects)
;