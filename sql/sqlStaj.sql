CREATE DATABASE dbtest1

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    [name] VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

CREATE TABLE StudentCourses (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Student VALUES
(1, 'Ana Petrova', 'ana.petrova@email.com'),
(2, 'Boris Ivanov', 'boris.ivanov@email.com'),
(3, 'Elena Stojanova', 'elena.stojanova@email.com'),
(4, 'Marko Dimitrov', 'marko.dimitrov@email.com'),
(5, 'Sara Nikolova', 'sara.nikolova@email.com'),
(6, 'Ivan Kostov', 'ivan.kostov@email.com'),
(7, 'Marija Angelova', 'marija.angelova@email.com'),
(8, 'Petar Georgiev', 'petar.georgiev@email.com'),
(9, 'Katerina Ilieva', 'katerina.ilieva@email.com'),
(10, 'Stefan Trajkov', 'stefan.trajkov@email.com');

INSERT INTO Course VALUES
(1, 'Databases'),
(2, 'Programming 1'),
(3, 'Programming 2'),
(4, 'Web Development'),
(5, 'Data Structures'),
(6, 'Algorithms'),
(7, 'Operating Systems'),
(8, 'Computer Networks'),
(9, 'Software Engineering'),
(10, 'Artificial Intelligence');

INSERT INTO StudentCourses VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8);

--inner join
SELECT [name],title
FROM Student s 
JOIN StudentCourses sc
ON s.student_id=sc.student_id
JOIN Course c
ON c.course_id=sc.course_id
ORDER BY 1

--left (outer) join (pokazva vs studenti dori tezi bez kurs)
SELECT s.*, title
FROM Student s 
LEFT JOIN StudentCourses sc
ON s.student_id=sc.student_id
LEFT JOIN Course c
ON c.course_id=sc.course_id
ORDER BY s.[name]

--right (outer) join (pokazva vs kursove dori tezi bez studenti)
SELECT title, [name]
FROM Student s
RIGHT JOIN StudentCourses sc
ON s.student_id=sc.student_id
RIGHT JOIN Course c
ON c.course_id=sc.course_id
ORDER BY title

--full (outer) join
SELECT s.*,c.*
FROM Student s
FULL JOIN StudentCourses sc
ON s.student_id=sc.student_id
FULL JOIN Course c
ON c.course_id=sc.course_id
ORDER BY s.[name]

--moje da imame where, having(sled group by), group by, order by v join
SELECT email, [name], COUNT(sc.course_id) AS CoursesCount
FROM Student s
JOIN StudentCourses sc
ON s.student_id=sc.student_id
JOIN Course c
ON c.course_id=sc.course_id
WHERE email LIKE '%@email.com'
GROUP BY email,[name]
HAVING COUNT(sc.course_id)>=2
ORDER BY COUNT(sc.course_id) DESC, [name] ASC

--union
SELECT s.[name]
FROM Student s
JOIN StudentCourses sc
    ON s.student_id = sc.student_id
UNION
SELECT [name]
FROM Student
WHERE email LIKE '%@email.com';

--intersect
SELECT [name]
FROM Student
WHERE email LIKE '%@email.com'
INTERSECT
SELECT [name]
FROM Student
WHERE [name] LIKE 'A%';

--except
SELECT [name]
FROM Student
WHERE email LIKE '%@email.com'
EXCEPT
SELECT [name]
FROM Student
WHERE [name] LIKE 'A%';

--triggers
CREATE TRIGGER trg_InsertMsg
ON StudentCourses
AFTER INSERT
AS
BEGIN
    PRINT 'New student added to courses!';
END;

INSERT INTO StudentCourses
VALUES(10,10)

--alter
ALTER TRIGGER trg_InsertMsg
ON StudentCourses
AFTER INSERT
AS
BEGIN
    PRINT 'New student added to course!';
END;

--disable
DISABLE TRIGGER trg_InsertMsg
ON StudentCourses;

--enable
ENABLE TRIGGER trg_InsertMsg
ON StudentCourses;

--drop trigger trg_InsertMsg


--CURSOR
DECLARE @studentName VARCHAR(50);
DECLARE @courseCount INT;

-- Декларираме курсора
DECLARE student_cursor CURSOR FOR
SELECT s.[name], COUNT(sc.course_id) AS CoursesCount
FROM Student s
LEFT JOIN StudentCourses sc
    ON s.student_id = sc.student_id
GROUP BY s.[name];

-- Отваряме курсора
OPEN student_cursor;

-- Вземаме първия ред
FETCH NEXT FROM student_cursor INTO @studentName, @courseCount;

-- Обхождаме редовете
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Student: ' + @studentName + ', Count courses: ' + CAST(@courseCount AS VARCHAR(10));

    -- Следващ ред
    FETCH NEXT FROM student_cursor INTO @studentName, @courseCount;
END;

-- Затваряме и изтриваме курсора
CLOSE student_cursor;
DEALLOCATE student_cursor;