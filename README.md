# SQL_queries
Implemented a few SQL queries

1. Each student group has to reserve one of ten available rooms to work on their project. The rooms can be reserved for a block of a few hours (eg. 3 hours), with a start time and end time, eg. 3pm-6pm, 9am-2pm etc. At the end of the day, everyone goes home, so there's no possibility of rooms being booked for multiple days. The table structure you are asked to use, is this:
CREATE TABLE ProjectRoomBookings
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
endTime INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime));
There are two problems (issues) with the above. First, the start time could be incorrectly entered to be later than the end time. Second, a new entry (for a new group) could be accidentally put in to occupy a room, even before the existing group in that room is done using that room. For simplicity, you can express times in the 24h military-style format, eg. 9 for 9AM, 17 for 5PM, etc. For further simplicity, all bookings start and end 'on the hour', so, ints between 7 (7AM) and 18 (6PM) should be sufficient.
How would you redesign the table to fix both these issues? For your answer, you can either provide a textual explanation, and/or provide SQL statements. Hint - "do not be concerned with efficiency" - ANY working solution is acceptable :)

<u>Solution</u> : <a href="https://github.com/Niranjani29/SQL_queries/blob/master/Q1.sql"> Here </a>

The violation of  startTime > depDate is solved in the check_time constraint in the table creation query itself by setting the check as endTime > startTime.

The violation of overlapping time slot is solved in the check_function constraint in the table creation query by checking the value of chk_availability function is equal to zero or not.

The chk_availability function checks weather the current Arrival time is greater than the previous endTimes and the current Departure time is less than the previous startTimes, if this is not satisfied then it returns zero.

2. Given the following portion of the enrollment table, write a query to create a listing that includes class name and the number of students enrolled in the class, sorted in reverse order of enrollment (eg. to tell which were the most popular classes, at the end of the term).

<img src='https://github.com/Niranjani29/SQL_queries/blob/master/images/2.jpg'>

<u>Solution</u> : <a href="https://github.com/Niranjani29/SQL_queries/blob/master/Q2.sql"> Here </a>

I have used the group by query on the ClassName column which will group each className such as "Python" together rowwise, "Scratch" together rowwise and then I have ordered them in descending order.

3. Below is a small table that tracks work being done on the students' projects. We have a project ID column on the left, a 'step' column in the middle (0,1,2.. denote steps of the project), and a status column on the right (where 'W' denotes 'waiting', 'C' denotes 'completed'). Such a table lets project instructors get a quick status on the various aspects (steps) of their projects ("where they're at", in colloquial, ungrammatical language). Specifically, 'W' would mean that the students are stalled for whatever reason (don't understand what to do, a part broke, they have bugs they can't fix, etc) and need additional help from the instructors - students would have a way to input these (step number, status), and instructors can review the table periodically and run queries like the one you will be creating.

<img src='https://github.com/Niranjani29/SQL_queries/blob/master/images/3.jpg'>


Write a query to output the project(s) where only step 0 has been completed, ie. the project gotten started but the rest of the steps are in waiting mode. In the above table, such a query would output just 'P100'. You can assume that steps get completed in order, ie. P333 will never have C,W,C,W for example [all Cs will occur before all Ws].

<u>Solution</u> : <a href="https://github.com/Niranjani29/SQL_queries/blob/master/Q3.sql"> Here </a>

For the respective PID I haved checked whether the PID has step 0, status "C" and step 1, status "W", because once you get a "W", the next steps are going to be "W"

4. Below is a small sample of a junkmail database we own, ie. people we want to 'spam' via postal mail to get them to enroll their kids in our STEM academy [lol].

<img src='https://github.com/Niranjani29/SQL_queries/blob/master/images/4.jpg'>


Each entry consists of a name, address, ID, and whether there is a prior family member already in the db; in the last column, NULL means that entry is the first family member in our db, and a non-null value is the ID of the first family member (eg. Diego points to Alice, and Ella points to Bob).

Write a query to delete from the table, names that have 'NULL' for SameFam and another family member in the db. So in our example above, the query would delete Alice and Bob, but not Carmen and Farkhad. In other words, we want to save postage by only sending one mail per household if we have two people from a house in our db (we assume that our db contains either one person per household, or two).

<u>Solution</u> : <a href="https://github.com/Niranjani29/SQL_queries/blob/master/Q4.sql"> Here </a>

5.  We post job descriptions, to build a list of qualified instructors we can pick from. Here's an abbreviated table of possible candidates, with just their name and the subject(s) they can teach:

<img src='https://github.com/Niranjani29/SQL_queries/blob/master/images/5.jpg'>


Write a query that will pick out just the instructors who can teach every subject in the table below (this is so we can hire a small number of instructors who would be easy to manage, compared to a larger group) - we're deciding to offer just the classes listed below:
JavaScript
Scratch
Python
With the above data, the query would output
Instructor 

Dat
Emscr


<u>Solution</u> : <a href="https://github.com/Niranjani29/SQL_queries/blob/master/Q3.sql"> Here </a>


There are two tables, "Jobs"(containing names of instructors with the subjects they can teach) and "Subjects" (Names of the subjects the instructor should teach).This is an example of implementing SET DIVISION.

1. WHERE: This operation returns names of instructors who can teach any of the subjects listed in the table "Subjects". It returns multiple rows of instructor names.

2. GROUP BY: In order to resolve the issue, it is necessary to group all queries by the Instructors names.

3. HAVING: The WHERE condition returns names of Instructors who can teach any of the subjects. Since we want instructors who can teach all of the subjects, we count the number of subjects in the "Subjects" table and also count the number of subjects each instructor can teach. If they are equal, the Instructors name is selected.

