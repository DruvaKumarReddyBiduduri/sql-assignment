SELECT * FROM members;

SELECT * FROM memberships;

SELECT * FROM freezes;

-- Insering dummy data into members table and membership table
INSERT INTO members(name) VALUES('gojo');

-- Membership for 3 months
INSERT INTO memberships(start_date,end_date,member_id,duration) VALUES(CURDATE(),DATE_ADD(CURDATE(),INTERVAL 3 MONTH),1,3);

-- Data for freeze table
-- Freeze membership for 7 days
INSERT into freezes(no_of_days,start_date,end_date,member_id,membership_id) VALUES(7,CURDATE(),DATE_ADD(CURDATE(),INTERVAL 7 DAY),1,2)

-- Freeze rules

-- Checking for valid membership
SELECT * FROM memberships 
WHERE member_id=1 AND CURDATE()>=start_date AND CURDATE()<=end_date;

-- Previous Total Freeze days
SELECT * from freezes 
WHERE (SELECT SUM(no_of_days) from freezes 
        WHERE member_id=1 and membership_id=2)<=53 
