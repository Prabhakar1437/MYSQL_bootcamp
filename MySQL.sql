CREATE DATABASE collage;
USE collage;
CREATE TABLE Student (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

INSERT INTO Student VALUES(1,"Lovlu",21);
INSERT INTO Student VALUES(2,"Vats",22);
SELECT *FROM Student; /*Select all the columns
of all the records
in the Customers table:*/

SHOW DATABASES; 
SHOW TABLES;
-- SELECT * FROM Customers;

CREATE TABLE Student1(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20));

INSERT INTO Student1
(rollno,name,marks,grade,city)
VALUES
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetna",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi");

SELECT* FROM Student1;
SELECT name,marks FROM Student1;
SELECT city FROM Student1;
SELECT DISTINCT city FROM Student1;

SELECT* FROM Student1 WHERE marks >80;
SELECT* FROM Student1 WHERE city ="Mumbai";
SELECT* FROM Student1 WHERE marks+10  >100;

SELECT marks FROM Student1;
SELECT count(marks) FROM Student1;
SELECT MAX(marks) FROM Student1;
SELECT min(marks) FROM Student1;
SELECT sum(marks) FROM Student1;
SELECT avg(marks) FROM Student1;

SELECT city,count(rollno) FROM Student1 GROUP BY city;
SELECT city,avg(marks) FROM Student1 GROUP BY city ORDER BY CITY ;
SELECT grade ,count(rollno) FROM Student1 GROUP BY grade ORDER BY grade;

SELECT city,count(rollno) FROM Student1
 GROUP By city HAVING MAX(marks)>90;
 
 
 SELECT city FROM Student1 
 WHERE grade ="A" GROUP BY city
 HAVING MAX(marks)>90
 ORDER By city ASC;
 
 UPDATE Student1
 SET grade = "O"
 WHERE grade = "A";
 SELECT * FROM Student1;
SET SQL_SAFE_UPDATES =0;
UPDATE Student1
 SET marks = 12
 WHERE rollno = 105;
SELECT * FROM Student1;


DELETE FROM Student1
WHERE marks<33;
SELECT * FROM Student1;
UPDATE Student1
 SET grade = "A"
 WHERE rollno = 105;
SELECT * FROM Student1;
CREATE TABLE Payment(
customber_id INT PRIMARY KEY,
customber VARCHAR(50),
mode VARCHAR(50),
city VARCHAR(50));


INSERT INTO Payment
(customber_id,customber,mode,city)
VALUES
(101,"Olivia Barrett","Netbanking","Portland"),
(102,"Ethan Sinclair","Credit Card","Miami"),
(103,"Maya Hernandez","Credit Card","Seattle"),
(104,"Liam Donovan","Netbanking","Denver"),
(105,"Sophia Nguyen","Credit Card","New Orleans"),
(106,"Caleb Foster","Debit Card","Minneapolis"),
(107,"Ava Patel","Debit Card","Phoenix"),
(108,"Lucas Carter","Netbanking","Boston"),
(109,"Isabella Martinez","Netbanking","Nashville"),
(110,"Jackson Brooks","Credit Card","Boston");

SELECT mode,count(customber) FROM Payment GROUP BY mode;




CREATE TABLE dept(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO dept VALUES(1,"HINDI");
INSERT INTO dept VALUES(2,"ENGLISH");
INSERT INTO dept VALUES(3,"MATH"); 

UPDATE dept
SET id = 5
WHERE id = 3;

SELECT * FROM dept;


CREATE TABLE teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE );

INSERT INTO teacher(id, name,dept_id) VALUES
(101,"Mohan",1),
(102,"Sohan",2),
(103,"Vats",1),
(104,"Lovlu",3),
(105,"Uttam",2);

SELECT *FROM teacher;
