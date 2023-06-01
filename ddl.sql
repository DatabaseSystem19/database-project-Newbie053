DROP TABLE  bookings;
DROP TABLE  students;
DROP TABLE  events;
DROP TABLE halls;

CREATE TABLE halls (
    hall_id INT PRIMARY KEY,
    hall_name VARCHAR(100) NOT NULL,
    capacity INT ,
    location VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'Available'
);

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE,
    hall_id INT,
    CONSTRAINT fk_hall_event FOREIGN KEY (hall_id) REFERENCES halls(hall_id) ON DELETE CASCADE
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    hall_id INT,
    FOREIGN KEY (hall_id) REFERENCES halls(hall_id)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    event_id INT,
    hall_id INT,
    booking_date DATE NOT NULL,
    
    user_id INT NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (hall_id) REFERENCES halls(hall_id),
    CONSTRAINT fk_user_booking FOREIGN KEY (user_id) REFERENCES students(student_id) ON DELETE CASCADE
);
