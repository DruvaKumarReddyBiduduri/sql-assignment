SELECT * FROM members;

SELECT * FROM memberships;

SELECT * FROM freezes;

INSERT INTO members(name) VALUES('gojo');

INSERT INTO memberships(start_date,end_date,member_id,duration) VALUES('2024-7-19',DATE_ADD(CURDATE(),INTERVAL 3 MONTH),1,3);

SELECT * FROM memberships 
WHERE member_id=1 AND CURDATE()>=start_date AND CURDATE()<=end_date;


INSERT into freezes(no_of_days,start_date,end_date,member_id,membership_id) VALUES(7,CURDATE(),DATE_ADD(CURDATE(),INTERVAL 7 DAY),1,2)


SELECT * from freezes 
WHERE (SELECT SUM(no_of_days) from freezes 
        WHERE member_id=1 and membership_id=2)<=53 
