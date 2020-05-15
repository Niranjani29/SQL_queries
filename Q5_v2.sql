-- DB Browser SQLite

-- There are two tables, "Jobs"(containing names of instructor with the subjects they can teach ) and "Subjects" (Names of the subjects they should teach ).
-- We implement this using the 'except' operator. The idea is to select all instructors from the "Jobs" table and remove the instructors that do not teach the subjects. The innermost query makes a product of the instructor column from "Jobs" and the "Subjects" table. This gives all possible combinations of instructor and the subjects required. We then, find the difference between this newly produced table and the main "Jobs" table which gives a list of instructors and the required subjects they cannot teach. From this, we select only the names of instructors (These are the instructors that do not satisfy the criteria of teaching all the subjects) and subtract it from all the instructor's names in the "Jobs" table.

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

SELECT Instructor FROM Jobs
EXCEPT
SELECT Instructor FROM (
SELECT *
FROM (select Instructor FROM Jobs), Subjects
EXCEPT
SELECT * FROM Jobs);