CREATE DATABASE School;
USE School;

TRUNCATE TABLE Student1;


SELECT * FROM Student1;

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE Student1
CHANGE  name  full_name VARCHAR(20);

DELETE FROM Student1
WHERE marks<80;

ALTER TABLE Student1
DROP COLUMN grade;


-- INNER JOIN --

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    student_id INT
);


INSERT INTO students (student_id, student_name, age) VALUES
(1, 'John Doe', 20),
(2, 'Jane Smith', 22),
(3, 'Alice Johnson', 21);


INSERT INTO courses (course_id, course_name, student_id) VALUES
(101, 'Mathematics', 1),
(102, 'Physics', 2),
(103, 'Chemistry', 3);


SELECT *FROM courses;
SELECT *FROM students;

SELECT *
FROM students
INNER JOIN courses ON students.student_id = courses.student_id;


 -- LEFT JOIN --

SELECT *
FROM students
LEFT JOIN courses ON students.student_id = courses.student_id;



 -- RIGHT  JOIN --

SELECT *
FROM students
RIGHT  JOIN courses ON students.student_id = courses.student_id;

 -- FULL JOIN --
SELECT *
FROM students
LEFT JOIN courses ON students.student_id = courses.student_id
UNION 
SELECT *
FROM students
RIGHT  JOIN courses ON students.student_id = courses.student_id;


 -- SELF JOIN --

CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT);

INSERT INTO employee (id,name,manager_id)
VALUES
(101,"adam",103),
(102,"bob",104),
(103,"casey",NULL),
(104,"donald",103);


SELECT * FROM employee;

SELECT a.name  as manager_name ,b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

  -- UNION --
SELECT name FROM employee
UNION 
SELECT name FROM employee;


 -- UNION ALL --
 
 
SELECT name FROM employee
UNION ALL
SELECT name FROM employee;


 -- Sub Query --


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



SELECT name,marks FROM Student1
WHERE marks>( SELECT AVG(marks) FROM Student1);


SELECT name, rollno FROM Student1
WHERE rollno IN(
SELECT rollno
 FROM Student1
 WHERE rollno %2 =0);
 
 
 SELECT MAX(marks) FROM (SELECT * FROM Student1 WHERE city ="Delhi")as temp;
