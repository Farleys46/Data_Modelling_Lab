CREATE SCHEMA IF NOT EXISTS skol_info;
SET search_path TO skol_info;

CREATE TABLE "Student" (
    "student_id" integer PRIMARY KEY,
    "first_name" text NOT NULL,
    "last_name" text NOT NULL,
    "personnummer" text NOT NULL,
    "email" text NOT NULL,
    "points_completed" integer
);

CREATE TABLE "Class" (
    "class_id" integer PRIMARY KEY,
    "class" text,
    "program_id" integer,
    "edu_leader_id" integer,
    "class_start_date" date,
    "class_end_date" date,
    "school_id" integer
);

CREATE TABLE "Teacher" (
    "teacher_id" integer PRIMARY KEY,
    "teacher_email" text,
    "teacher_firstname" text,
    "teacher_lastname" text
);

CREATE TABLE "Program" (
    "program_id" integer PRIMARY KEY,
    "program_desc" text,
    "program_name" varchar
);

CREATE TABLE "Course" (
    "course_id" integer PRIMARY KEY,
    "course_name" varchar,
    "teacher_id" integer
);

CREATE TABLE "School" (
    "school_id" integer PRIMARY KEY,
    "adress" text
);

CREATE TABLE "Consultant" (
    "teacher_id" integer PRIMARY KEY,
    "company" text,
    "organization_nr" integer,
    "f_skatt" bool,
    "adress" text,
    "hourly_rate" decimal
);

CREATE TABLE "Education_leader" (
    "edu_leader_id" integer PRIMARY KEY,
    "edu_leader_firstname" text,
    "edu_leader_lastname" text,
    "edu_leader_email" text
);

CREATE TABLE "Student_Class_list" (
    "student_id" integer,
    "class_id" integer
);

CREATE TABLE "Course_Class_list" (
    "class_id" integer,
    "course_id" integer,
    "points" integer
);

ALTER TABLE "Student_Class_list" ADD FOREIGN KEY ("student_id") REFERENCES "Student" ("student_id");

ALTER TABLE "Student_Class_list" ADD FOREIGN KEY ("class_id") REFERENCES "Class" ("class_id");

ALTER TABLE "Course_Class_list" ADD FOREIGN KEY ("class_id") REFERENCES "Class" ("class_id");

ALTER TABLE "Course_Class_list" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id");

ALTER TABLE "Consultant" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("teacher_id");

ALTER TABLE "Course" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("teacher_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("edu_leader_id") REFERENCES "Education_leader" ("edu_leader_id");
