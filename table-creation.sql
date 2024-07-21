CREATE TABLE members(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
)


CREATE TABLE memberships(
   id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   member_id int NOT NULL,
   duration int,
   FOREIGN KEY(member_id) REFERENCES members(id)
)


CREATE TABLE freezes(
   id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
   no_of_days int CHECK (no_of_days<=60 AND no_of_days>=7),
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   member_id int NOT NULL,
   membership_id int NOT NULL,
   FOREIGN KEY(member_id) REFERENCES members(id),
   FOREIGN KEY(membership_id) REFERENCES memberships(id)
);
