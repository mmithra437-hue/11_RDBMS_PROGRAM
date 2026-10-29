CREATE DATABASE CollegeDB;
USE CollegeDB;
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(30)
);

INSERT INTO Department VALUES
(101, 'Computer Science'),
(102, 'Mathematics');

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(20),
    Department_ID INT
);

INSERT INTO Student VALUES
(1001, 'Arun', 101),
(1002, 'Divya', 102);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(30),
    Department_ID INT
);

INSERT INTO Course VALUES
(201, 'DBMS', 101),
(202, 'Mathematics', 102);

CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT
);

INSERT INTO Enrollment VALUES
(1, 1001, 201),
(2, 1002, 202);

CREATE VIEW StudentDetails AS
SELECT S.Student_Name,
       C.Course_Name,
       D.Department_Name
FROM Student S
JOIN Enrollment E
    ON S.Student_ID = E.Student_ID
JOIN Course C
    ON E.Course_ID = C.Course_ID
JOIN Department D
    ON S.Department_ID = D.Department_ID;

SELECT * FROM StudentDetails;
