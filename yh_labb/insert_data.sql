-- LLM Generated SQL Insert Script
-- Added Star Wars themed data to keep it fun for me. :D

SET search_path TO skol_info; 


INSERT INTO "School" (school_id, adress) VALUES
(1, 'Liljeholmen Campus'),
(2, 'Kista Science City'),
(3, 'Distans (Remote)');

-- -------------------------------------------------------------
-- 2. PROGRAMS (Expanded to 5 Real YH Programs)
-- -------------------------------------------------------------
INSERT INTO "Program" (program_id, program_name, program_desc) VALUES
(101, 'Data Engineer', 'Learn SQL, Python, and Cloud Architecture'),
(102, 'DevOps Engineer', 'Learn Docker, Kubernetes, and CI/CD Pipelines'),
(103, 'AI Developer', 'Learn Machine Learning and Neural Networks'),
(104, 'Cybersecurity Specialist', 'Network Security, Pentesting and Forensics'),
(105, 'IoT Developer', 'Embedded Systems, C++, and Sensors');

-- -------------------------------------------------------------
-- 3. EDUCATION LEADERS (The Admins)
-- -------------------------------------------------------------
INSERT INTO "Education_leader" (edu_leader_id, edu_leader_firstname, edu_leader_lastname, edu_leader_email) VALUES
(1, 'Anna', 'Andersson', 'anna.andersson@school.se'),  -- The nice one
(2, 'Lars', 'Larsson', 'lars.larsson@school.se'),      -- The strict one
(3, 'Sheev', 'Palpatine', 'senate@republic.gov'),       -- The "Senate" (Head of Admin)
(4, 'Padmé', 'Amidala', 'padme@naboo.edu');             -- Student Welfare Officer

-- -------------------------------------------------------------
-- 4. TEACHERS & CONSULTANTS
-- -------------------------------------------------------------
INSERT INTO "Teacher" (teacher_id, teacher_firstname, teacher_lastname, teacher_email) VALUES
(1, 'Obi-Wan', 'Kenobi', 'obiwan@jedi.edu'),      -- Python
(2, 'Yoda', 'Minch', 'yoda@jedi.edu'),            -- SQL
(3, 'Mace', 'Windu', 'mace@jedi.edu'),            -- Ethics
(4, 'Boba', 'Fett', 'boba@freelance.net'),        -- Cloud (Consultant)
(5, 'Ahsoka', 'Tano', 'ahsoka@fulcrum.net'),      -- UX/UI
(6, 'Qui-Gon', 'Jinn', 'quigon@livingforce.org'), -- Java
(7, 'Darth', 'Maul', 'maul@sith.net'),            -- Pentesting (Red Team)
(8, 'Count', 'Dooku', 'dooku@serenno.com');       -- C++ / Embedded

-- Consultants (Linked to Teachers)
INSERT INTO "Consultant" (teacher_id, company, organization_nr, f_skatt, hourly_rate) VALUES
(4, 'Mandalorian Solutions AB', 556677, true, 1800.00),
(7, 'Crimson Dawn Security', 666999, true, 2500.00); -- Maul is also a consultant!

-- -------------------------------------------------------------
-- 5. COURSES (Real Subjects)
-- -------------------------------------------------------------
INSERT INTO "Course" (course_id, course_name, teacher_id) VALUES
(501, 'Python Fundamentals', 1),    -- Obi-Wan
(502, 'Advanced SQL', 2),           -- Yoda
(503, 'Data Ethics & GDPR', 3),     -- Mace Windu
(504, 'Cloud Infrastructure', 4),   -- Boba Fett
(505, 'UX/UI Design Principles', 5),-- Ahsoka
(506, 'Java for Enterprise', 6),    -- Qui-Gon
(507, 'Network Penetration Testing', 7), -- Maul
(508, 'Embedded C++ Programming', 8);    -- Dooku

-- -------------------------------------------------------------
-- 6. CLASSES (Real Class Codes)
-- -------------------------------------------------------------
INSERT INTO "Class" (class_id, class, program_id, school_id, edu_leader_id, class_start_date, class_end_date) VALUES
(23, 'DE23', 101, 1, 1, '2023-08-15', '2025-06-01'), -- Data Eng 23 (Liljeholmen)
(24, 'DE24', 101, 1, 1, '2024-08-15', '2026-06-01'), -- Data Eng 24 (Liljeholmen)
(99, 'AI24', 103, 3, 2, '2024-09-01', '2026-06-01'), -- AI Remote
(45, 'SEC24', 104, 2, 3, '2024-08-20', '2026-06-01'),-- Cybersec (Kista) - Run by Palpatine
(55, 'IOT24', 105, 2, 4, '2024-08-20', '2026-06-01');-- IoT (Kista) - Run by Padmé

-- -------------------------------------------------------------
-- 7. COURSE CONTENT (Curriculum per Class)
-- -------------------------------------------------------------
INSERT INTO "Course_Class_list" (class_id, course_id, points) VALUES
-- DE23 (Older class)
(23, 501, 25), (23, 502, 30),
-- DE24 (Newer class)
(24, 501, 20), (24, 504, 40),
-- AI24 (Remote)
(99, 503, 50), (99, 501, 25),
-- SEC24 (Cybersecurity)
(45, 507, 60), (45, 504, 30), -- Pentesting + Cloud
-- IOT24 (IoT)
(55, 508, 50), (55, 506, 30); -- C++ + Java

-- -------------------------------------------------------------
-- 8. STUDENTS (The Massive Star Wars Cast)
-- -------------------------------------------------------------
INSERT INTO "Student" (student_id, first_name, last_name, personnummer, email, points_completed) VALUES
-- The Original Trio
(1, 'Luke', 'Skywalker', '19900504-0001', 'luke@rebellion.com', 50),
(2, 'Leia', 'Organa', '19900504-0002', 'leia@senate.gov', 100),
(3, 'Han', 'Solo', '19850101-0003', 'han@falcon.net', 10),

-- The Villains / Complex Characters
(4, 'Anakin', 'Skywalker', '19800101-6666', 'vader@empire.com', 200),
(6, 'Kylo', 'Ren', '19950101-5678', 'kylo@firstorder.com', 40),

-- The Sequels
(5, 'Rey', 'Palpatine', '20000101-1234', 'rey@jakku.net', 0),
(7, 'Finn', 'FN-2187', '19980303-1111', 'finn@resistance.org', 20),
(8, 'Poe', 'Dameron', '19951212-2222', 'poe@xwing.com', 45),

-- Rogue One Crew (Cybersecurity Students)
(9, 'Jyn', 'Erso', '19960101-9999', 'jyn@stardust.com', 60),
(10, 'Cassian', 'Andor', '19940505-8888', 'cassian@intel.rebel', 65),
(11, 'Bodhi', 'Rook', '19930707-7777', 'bodhi@pilot.imp', 30),

-- The Others
(12, 'Lando', 'Calrissian', '19820202-3333', 'lando@cloudcity.com', 80),
(13, 'Chewbacca', 'Wookiee', '19000101-4444', 'chewie@kashyyyk.net', 15),
(14, 'Grogu', 'Mandalorian', '20191111-5555', 'baby@yoda.com', 5);

-- -------------------------------------------------------------
-- 9. ENROLLMENTS (Who studies what?)
-- -------------------------------------------------------------
INSERT INTO "Student_Class_list" (student_id, class_id) VALUES
-- DE23 (Seniors)
(1, 23), (2, 23), (3, 23), (13, 23), -- Luke, Leia, Han, Chewie

-- DE24 (Juniors)
(5, 24), (7, 24), (8, 24), -- Rey, Finn, Poe

-- AI24 (Remote)
(6, 99), (4, 99), -- Kylo & Vader (Studying AI/Sith logic)

-- SEC24 (Cybersecurity - perfect for spies)
(9, 45), (10, 45), (11, 45), -- Jyn, Cassian, Bodhi

-- IOT24 (Hardware/Engineering)
(12, 55), (14, 55); -- Lando & Grogu

-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- TEST: THE FAILING INSERT (Required for Lab Report)
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- The "Stormtrooper" test. This should FAIL.
INSERT INTO "Student" (student_id, first_name, last_name, personnummer, email)
VALUES (999, 'FN', '0000', '20000101-0000', NULL); 

