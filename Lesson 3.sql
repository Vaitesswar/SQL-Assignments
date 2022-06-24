# CRUD (Create-Read-Update-Delete) operations

# Create database
CREATE DATABASE test;

# Use database
USE test;

# Create tables (Primary key must be unique)
CREATE TABLE test1 (ID INT PRIMARY KEY, Val INT);
CREATE TABLE test2 (ID INT PRIMARY KEY, Val INT);

# Insert data into tables
INSERT INTO test1 (ID,Val) 
			VALUES (1,1), (2,1), (3,0), (4,1), (5,2);
INSERT INTO test2 (ID,Val) 
			VALUES (1,0), (2,1), (3,1), (4,0), (5,1);

# Join operation		
# 11 records for inner join (3*3 + 2*1 = 11)
select test2.ID as test2, test1.ID as test1, test1.Val,test2.Val
from test1
inner join
test2 on test1.Val = test2.Val;

# 12 records for inner join (3*3 + 2*1 + 1 (Val = 2 from test1) = 12)
select  test2.ID as test2, test1.ID as test1, test1.Val,test2.Val
from test1
left outer join
test2 on test1.Val = test2.Val;

# 11 records for inner join (3*3 + 2*1 = 11)
select test2.ID as test2, test1.ID as test1, test1.Val,test2.Val
from test1
right outer join
test2 on test1.Val = test2.Val;

# Update values in table
UPDATE test1 SET
	Val = 0
where ID = 5;

# Delete values in table
DELETE from test1 
where ID = 4;

# View table
Table test1;

# Limiting query results
select * from test1
LIMIT 0,2;

# Delete tables and database
DROP TABLE test1;
DROP TABLE test2;
DROP DATABASE test;