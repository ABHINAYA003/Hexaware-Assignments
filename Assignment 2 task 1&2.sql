task 1
CREATE DATABASE SISDB;
USE SISDB;
go
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);


CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) ON DELETE SET NULL
);


CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);


CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
);

INSERT INTO Students (student_id,first_name, last_name, date_of_birth, email, phone_number) VALUES
(1,'Alice', 'Johnson', '2000-05-15', 'alice.johnson@example.com', '123-456-7890'),
(2,'Bob', 'Smith', '1999-08-22', 'bob.smith@example.com', '234-567-8901'),
(3,'Charlie', 'Brown', '2001-02-10', 'charlie.brown@example.com', '345-678-9012'),
(4,'David', 'White', '1998-11-30', 'david.white@example.com', '456-789-0123'),
(5,'Emma', 'Davis', '2002-07-19', 'emma.davis@example.com', '567-890-1234'),
(6,'Fiona', 'Moore', '2001-03-25', 'fiona.moore@example.com', '678-901-2345'),
(7,'George', 'Wilson', '1997-12-05', 'george.wilson@example.com', '789-012-3456'),
(8,'Hannah', 'Martinez', '2000-09-14', 'hannah.martinez@example.com', '890-123-4567'),
(9,'Isaac', 'Anderson', '1999-06-21', 'isaac.anderson@example.com', '901-234-5678'),
(10,'Jessica', 'Taylor', '2003-01-07', 'jessica.taylor@example.com', '012-345-6789');

INSERT INTO Teacher (teacher_id,first_name, last_name, email) VALUES
(1,'Mark', 'Anderson', 'mark.anderson@example.com'),
(2,'Laura', 'Garcia', 'laura.garcia@example.com'),
(3,'Tom', 'Roberts', 'tom.roberts@example.com'),
(4,'Emma', 'Williams', 'emma.williams@example.com'),
(5,'James', 'Brown', 'james.brown@example.com'),
(6,'Sophia', 'Miller', 'sophia.miller@example.com'),
(7,'Liam', 'Davis', 'liam.davis@example.com'),
(8,'Olivia', 'Wilson', 'olivia.wilson@example.com'),
(9,'Noah', 'Moore', 'noah.moore@example.com'),
(10,'Ava', 'Taylor', 'ava.taylor@example.com');


INSERT INTO Courses (course_id,course_name, credits, teacher_id) VALUES
(1,'Database Systems', 4, 1),
(2,'Computer Networks', 3, 2),
(3,'Operating Systems', 4, 3),
(4,'Software Engineering', 3, 1),
(5,'Machine Learning', 4, 2),
(6,'Data Structures', 3, 3),
(7,'Cyber Security', 4, 1),
(8,'Web Development', 3, 2),
(9,'Mobile App Development', 4, 3),
(10,'Artificial Intelligence', 4, 1);


INSERT INTO Enrollments (enrollment_id,student_id, course_id, enrollment_date) VALUES
(11,1, 1, '2024-01-15'),
(12,2, 2, '2024-01-16'),
(13,3, 3, '2024-01-17'),
(14,4, 4, '2024-01-18'),
(15,5, 5, '2024-01-19'),
(16,6, 6, '2024-01-20'),
(17,7, 7, '2024-01-21'),
(18,8, 8, '2024-01-22'),
(19,9, 9, '2024-01-23'),
(20,10, 10, '2024-01-24');


INSERT INTO Payments (payment_id,student_id, amount, payment_date) VALUES
(11,1, 500.00, '2024-02-01'),
(12,2, 600.00, '2024-02-02'),
(13,3, 550.00, '2024-02-03'),
(14,4, 700.00, '2024-02-04'),
(15,5, 650.00, '2024-02-05'),
(16,6, 720.00, '2024-02-06'),
(17,7, 500.00, '2024-02-07'),
(18,8, 580.00, '2024-02-08'),
(19,9, 610.00, '2024-02-09'),
(20,10, 630.00, '2024-02-10');

SELECT * FROM Courses;
select * from Enrollments;
select * from Payments;
select * from Students;
select * from Teacher;

task 2

1. INSERT INTO Students (student_id,first_name, last_name, date_of_birth, email, phone_number) 
   VALUES (11,'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

2. INSERT INTO Enrollments (enrollment_id,student_id, course_id, enrollment_date) 
VALUES (21,1,2,'2024-01-15');

3. UPDATE Teacher 
SET email = 'new.email@example.com' 
WHERE teacher_id = 3;

4. DELETE FROM Enrollments 
WHERE student_id = 2 AND course_id = 2;

5. UPDATE Courses 
SET teacher_id = 4 
WHERE course_id = 5;

6. DELETE FROM Students 
WHERE student_id = 3;

7. UPDATE Payments 
SET amount = 750.00 
WHERE payment_id = 5;