-- Oracle

-- CREATE TABLE Project(  
--     PID varchar2(4) not null,  
--     Step number(1) not null, 
--     Status varchar2(1) not null,
--     PRIMARY KEY (PID, Step, Status) 
-- );

-- insert all 
-- into Project values('P100', 0, 'C') 
-- into Project values('P100', 1, 'W') 
-- into Project values('P100', 2, 'W') 
-- into Project values('P201', 0, 'C') 
-- into Project values('P201', 1, 'C') 
-- into Project values('P333', 0, 'W') 
-- into Project values('P333', 1, 'W') 
-- into Project values('P333', 2, 'W') 
-- into Project values('P333', 3, 'W') 
-- select * from dual;

-- select * from Project;

select distinct p.PID
from Project p, Project pp
where p.Step = 0 and p.Status like 'C'
and pp.step = 1 and pp.status like 'W'
and p.PID = pp.PID;