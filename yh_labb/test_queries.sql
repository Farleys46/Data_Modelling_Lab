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


--SELECT 
--    s.first_name || ' ' || s.last_name AS Student,
--    p.program_name AS Program,
--    c.class AS Class_Code,
--    sc.adress AS Campus_Location
--FROM "Student" s
--JOIN "Student_Class_list" scl ON s.student_id = scl.student_id
--JOIN "Class" c ON scl.class_id = c.class_id
--JOIN "Program" p ON c.program_id = p.program_id
--JOIN "School" sc ON c.school_id = sc.school_id
--ORDER BY c.class, s.last_name;


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
WHERE c.class = 'SEC24'