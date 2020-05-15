-- DB Browser for SQLite

--CREATE TABLE "enrollment" (
--	"SID"	NUMERIC,
--	"ClassName"	TEXT NOT NULL,
--	"Field4"	INTEGER,
--	PRIMARY KEY("SID","ClassName")
--);

--insert into enrollment values (123, "Processing", "A")
--insert into enrollment values (123, "Python"," B")
--insert into enrollment values (123, "Scratch", "B")
--insert into enrollment values (662, "Java", "B")
--insert into enrollment values (662, "Python", "A")
--insert into enrollment values (662, "JavaScript", "A")
--insert into enrollment values (662, "Scratch", "B")
--insert into enrollment values (345, "Scratch", "A")
--insert into enrollment values (345, "JavaScript", "B")
--insert into enrollment values (345, "Python", "A")
--insert into enrollment values (555, "Python", "B")
--insert into enrollment values (555, "JavaScript", "B");

select ClassName, count(SID) as Total
from enrollment
group by ClassName
order by Total DESC;