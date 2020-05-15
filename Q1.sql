-- PostgreSQL

create or replace function chk_availability(Room in integer, Arrival in integer, Departure in integer)
returns integer as $temp$
declare temp integer;
begin
    select count(*) into temp
    from ProjectRoomBookings
    where roomNum = Room and 
 ((Arrival < endTime) or (Departure > startTime));
    return temp;
end;
$temp$ LANGUAGE plpgsql;

create table ProjectRoomBookings (
    roomNum integer not null,
    startTime integer not null,
    endTime integer not null,
    groupName varchar(30) not null,
    primary key (roomNum, startTime),
    constraint check_time check(endTime > startTime),
    constraint check_function check(chk_availability(roomNum, startTime, endTime) = 0)
);


-- Correct insertions
insert into ProjectRoomBookings(roomNum, startTime, endTime, groupName) values (123, 9,12, 'A');
insert into ProjectRoomBookings(roomNum, startTime, endTime, groupName) values (123, 12, 15, 'B');
-- Incorrect (violates startTime > depDate)
insert into ProjectRoomBookings(roomNum, startTime, endTime, groupName) values (201, 6, 3, 'C');
-- Incorrect (violates overlapping time)
insert into ProjectRoomBookingss(roomNum, startTime, endTime, groupName) values (123, 10, 14, 'B');

select *
from ProjectRoomBookings;



-- The violation of  startTime > depDate is solved in the check_time constraint in the table creation query itself by setting the check as endTime > startTime.
-- The violation of overlapping time slot is solved in the check_function constraint in the table creation query by checking the value of chk_availability function is equal to zero or not.
-- The chk_availability function checks weather the current Arrival time is greater than the previous endTimes and the current Departure time is less than the previous startTimes, if this is not satisfied then it returns zero.