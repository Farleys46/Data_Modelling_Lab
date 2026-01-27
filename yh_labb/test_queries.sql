-- Set the search path to the right schema. 
SET search_path TO skol_info;


-- TEST QUERIES FOR YH_LABB DATABASE

-- Query 1: List all students born after January 1, 1990
SELECT
student_id,
first_name,
last_name,
personnummer FROM "Student"
WHERE personnummer > '19900101-0000'
ORDER BY personnummer;


-- Query 2: Get class details for class 'SEC24' including an attempt for window function. 
SELECT
c.class_id,
c.class,
p.program_name,
el.edu_leader_firstname,
el.edu_leader_lastname,
COUNT(co.course_id) OVER (PARTITION BY c.class_id) AS Total_Course_Count,
co.course_name
FROM "Class" c
JOIN "Program" p ON c.program_id = p.program_id
JOIN "Education_leader" el ON c.edu_leader_id = el.edu_leader_id
JOIN "Course_Class_list" ccl ON c.class_id = ccl.class_id
JOIN "Course" co ON ccl.course_id = co.course_id
WHERE c.class = 'SEC24';


-- Query 3:

SELECT 
cons.company AS Consultant_Company,
t.teacher_firstname || ' ' || t.teacher_lastname AS Consultant_Name,
cons.hourly_rate AS Cost_Per_Hour,
co.course_name
FROM "Consultant" cons
JOIN "Teacher" t ON cons.teacher_id = t.teacher_id
JOIN "Course" co ON t.teacher_id = co.teacher_id
ORDER BY cons.hourly_rate DESC;