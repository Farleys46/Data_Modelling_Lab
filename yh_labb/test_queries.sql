SET search_path TO skol_info;

SELECT
student_id,
first_name,
last_name,
personnummer FROM "Student"
WHERE personnummer > '19900101-0000'
ORDER BY personnummer;
