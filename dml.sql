
-- Insert data into halls table

INSERT INTO halls (hall_id, hall_name, capacity, location) VALUES (1, 'Lalon', 100, 'KUET');
INSERT INTO halls (hall_id, hall_name, capacity, location) VALUES (2, 'Bangabandhu', 150, 'KUET');
INSERT INTO halls (hall_id, hall_name, capacity, location) VALUES (3, 'Khaja', 120, 'KUET');
INSERT INTO halls (hall_id, hall_name, capacity, location) VALUES (4, 'Fozlul', 200, 'KUET');
INSERT INTO halls (hall_id, hall_name, capacity, location) VALUES (5, 'Rokeya', 80, 'KUET');
INSERT INTO halls (hall_id, hall_name, capacity, location) VALUES (6, 'Rashid', 90, 'KUET');
INSERT INTO halls (hall_id, hall_name, capacity, location) VALUES (7, 'Omar', 110, 'KUET');
-- Insert data into students table

INSERT INTO students (student_id, student_name, hall_id) VALUES (1907051, 'Proloy Karmoker', 1);
INSERT INTO students (student_id, student_name, hall_id) VALUES (1907052, 'Sakib Hasan Topu', 2);
INSERT INTO students (student_id, student_name, hall_id) VALUES (1907053, 'Dipto Saha', 4);
INSERT INTO students (student_id, student_name, hall_id) VALUES (1907054, 'Kaiserul Islam Kowshik', 4);
INSERT INTO students (student_id, student_name, hall_id) VALUES (1907055, 'Md Naeem Islam', 5);
INSERT INTO students (student_id, student_name, hall_id) VALUES (1907056, 'Md Zakaria Hossain', 6);
INSERT INTO students (student_id, student_name, hall_id) VALUES (1907057, 'Md Abu Saeed', 3);
INSERT INTO students (student_id, student_name, hall_id) VALUES (1907058, 'Utsho Anik Das', 5);
INSERT INTO students (student_id, student_name, hall_id) VALUES (1907059, 'Md Maruf Mia', 4);
INSERT INTO students (student_id, student_name, hall_id) VALUES (1907060, 'Md Tamim Islam', 1);


-- Insert data into events table
INSERT INTO events (event_id, event_name, event_date, hall_id) VALUES (1, 'Hall Feast', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 1);
INSERT INTO events (event_id, event_name, event_date, hall_id) VALUES (2, 'Cricket Tournament', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 2);
INSERT INTO events (event_id, event_name, event_date, hall_id) VALUES (3, 'Football Tournament', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 3);
INSERT INTO events (event_id, event_name, event_date, hall_id) VALUES (4, 'Indoor', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 4);
INSERT INTO events (event_id, event_name, event_date, hall_id) VALUES (5, 'Monthly Feast', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 5);
INSERT INTO events (event_id, event_name, event_date, hall_id) VALUES (6, 'Cultural Night', TO_DATE('2023-06-06', 'YYYY-MM-DD'), 6);
INSERT INTO events (event_id, event_name, event_date, hall_id) VALUES (7, 'Rag Night', TO_DATE('2023-06-07', 'YYYY-MM-DD'), 7);
INSERT INTO events (event_id, event_name, event_date, hall_id) VALUES (8, 'Event 8', TO_DATE('2023-06-08', 'YYYY-MM-DD'), 1);
INSERT INTO events (event_id, event_name, event_date, hall_id) VALUES (9, 'Event 9', TO_DATE('2023-06-09', 'YYYY-MM-DD'), 2);
INSERT INTO events (event_id, event_name, event_date, hall_id) VALUES (10, 'Event 10', TO_DATE('2023-06-10', 'YYYY-MM-DD'), 3);


-- Insert data into bookings table
 
-- Insert data into bookings table
INSERT INTO bookings (booking_id, event_id, hall_id, booking_date, user_id) VALUES (2, 1, 1, TO_DATE('2023-05-30', 'YYYY-MM-DD'), 1907051);
INSERT INTO bookings (booking_id, event_id, hall_id, booking_date, user_id) VALUES (3, 3, 3, TO_DATE('2023-05-30', 'YYYY-MM-DD'), 1907053);
INSERT INTO bookings (booking_id, event_id, hall_id, booking_date, user_id) VALUES (4, 4, 4, TO_DATE('2023-05-30', 'YYYY-MM-DD'), 1907054);
INSERT INTO bookings (booking_id, event_id, hall_id, booking_date, user_id) VALUES (5, 5, 5, TO_DATE('2023-05-30', 'YYYY-MM-DD'), 1907055);
INSERT INTO bookings (booking_id, event_id, hall_id, booking_date, user_id) VALUES (6, 6, 6, TO_DATE('2023-05-30', 'YYYY-MM-DD'), 1907056);
INSERT INTO bookings (booking_id, event_id, hall_id, booking_date, user_id) VALUES (7, 7, 7, TO_DATE('2023-05-30', 'YYYY-MM-DD'), 1907057);
INSERT INTO bookings (booking_id, event_id, hall_id, booking_date, user_id) VALUES (8, 8, 1, TO_DATE('2023-05-30', 'YYYY-MM-DD'), 1907058);
INSERT INTO bookings (booking_id, event_id, hall_id, booking_date, user_id) VALUES (9, 9, 2, TO_DATE('2023-05-30', 'YYYY-MM-DD'), 1907059);
INSERT INTO bookings (booking_id, event_id, hall_id, booking_date, user_id) VALUES (10, 10, 3, TO_DATE('2023-05-30', 'YYYY-MM-DD'), 1907060);

-- Verify the data
SELECT * FROM students;
SELECT * FROM halls;
SELECT * FROM events;
SELECT * FROM bookings;


--1.Update Query: Update the status of a hall to 'Unavailable':
UPDATE halls
SET status = 'Unavailable'
WHERE hall_id = 1;


--2.Delete Query: Delete a student from the students table:
DELETE FROM students
WHERE student_id = 1907051;

--3.Alter Table Query: Add a new column named 'phone' to the students table:

ALTER TABLE students
ADD phone VARCHAR(20);


--4.With Clause Query: Use the WITH clause to get the list of students and their respective halls:
WITH student_halls AS (
    SELECT student_name, hall_name
    FROM students
    JOIN halls ON students.hall_id = halls.hall_id
)
SELECT *
FROM student_halls;


---5.Aggregate Function (Count) Query: Count the total number of students in the students table

SELECT COUNT(*) AS total_students
FROM students;


--6.Aggregate Function (Min) Query: Find the minimum capacity among all halls:
SELECT MIN(capacity) AS min_capacity
FROM halls;


--7.Aggregate Function (Max) Query: Find the maximum capacity among all halls:
SELECT MAX(capacity) AS max_capacity
FROM halls;

--8.Aggregate Function (Avg) Query: Calculate the average capacity of halls:
SELECT AVG(capacity) AS avg_capacity
FROM halls;


---9.Union Query: Retrieve the names of students from two different halls using the UNION operator

SELECT student_name
FROM students
WHERE hall_id = 1
UNION
SELECT student_name
FROM students
WHERE hall_id = 2;


--10.Intersect Query: Retrieve the names of students who belong to both hall_id 1 and hall_id 2 using the INTERSECT operator:
SELECT student_name
FROM students
WHERE hall_id = 1
INTERSECT
SELECT student_name
FROM students
WHERE hall_id = 2;


--11.Except Query: Retrieve the names of students who belong to hall_id 1 but not hall_id 2 using the EXCEPT operator:
SELECT student_name
FROM students
WHERE hall_id = 1
EXCEPT
SELECT student_name
FROM students
WHERE hall_id = 2;
--12.Retrieve the halls that are currently unavailable:
WITH unavailable_halls AS (
    SELECT *
    FROM halls
    WHERE status = 'Unavailable'
)
SELECT *
FROM unavailable_halls;


--13.Group By Query: Retrieve the count of students in each hall:
SELECT hall_id, COUNT(*) AS student_count
FROM students
GROUP BY hall_id;

--14.Retrieve the halls that have a location in 'KUET' and a status of 'Available':
WITH halls_location_status AS (
    SELECT hall_id, location, status
    FROM halls
)
SELECT hall_id, location, status
FROM halls_location_status
WHERE location = 'KUET'
    AND status = 'Available';




--15.Distinct Query: Retrieve the distinct locations from the halls table:
SELECT DISTINCT location
FROM halls;


--16.Nested Subquery: Retrieve the halls where the event_date is greater than the maximum event_date in the events table:
SELECT *
FROM halls
WHERE hall_id IN (
    SELECT hall_id
    FROM events
    WHERE event_date > (
        SELECT MAX(event_date)
        FROM events
    )
);


--17.Set Membership (IN) Query: Retrieve the students who belong to hall_id 1, 2, or 3:
SELECT *
FROM students
WHERE hall_id IN (1, 2, 3);


--18.Set Membership (NOT IN) Query: Retrieve the students who do not belong to hall_id 4 or 5:
SELECT *
FROM students
WHERE hall_id NOT IN (4, 5);

--19.Logical Operator (AND, OR) Query: Retrieve the students who belong to hall_id 1 and have a student_id greater than 1907050, or belong to hall_id 2 and have a student_id less than 1907060:
SELECT *
FROM students
WHERE (hall_id = 1 AND student_id > 1907050)
    OR (hall_id = 2 AND student_id < 1907060);


--20.Join Query: Retrieve the event_name and hall_name for each booking:
SELECT b.booking_id, e.event_name, h.hall_name
FROM bookings b
JOIN events e ON b.event_id = e.event_id
JOIN halls h ON b.hall_id = h.hall_id;


--21.Create View: Create a view named 'hall_bookings' that retrieves the details of each booking:
drop view hall_bookings;
CREATE VIEW hall_bookings AS
SELECT b.booking_id, e.event_name, h.hall_name, b.booking_date, s.student_name
FROM bookings b
JOIN events e ON b.event_id = e.event_id
JOIN halls h ON b.hall_id = h.hall_id
JOIN students s ON b.user_id = s.student_id;

--22.Retrieve the student names where 'Islam' is replaced with 'Khan':
SELECT student_name,
       REPLACE(student_name, 'Islam', 'Khan') AS replaced_name
FROM students;

--23.Retrieve the student names that contain the letter 'a' anywhere in the name
SELECT student_name
FROM students
WHERE student_name LIKE '%a%';
--24 Retrieve the student names that start with any character, followed by 'a', and end with any character:
SELECT student_name
FROM students
WHERE student_name LIKE '_a%';

--25 Retrieve the student names that end with 'a':
SELECT student_name
FROM students
WHERE student_name LIKE '%a';

