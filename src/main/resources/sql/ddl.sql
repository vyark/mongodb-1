drop table if exists student cascade;
drop table if exists subject cascade;
drop table if exists exam_results cascade;
drop table if exists phone_numbers cascade;

create table student
(
    student_id       numeric primary key,
    name             varchar(250),
    surname          varchar(200),
    date_of_birth    date,
    primary_skill    varchar(250),
    created_datetime date,
    updated_datetime date
);
create table subject
(
    subject_id      numeric primary key,
    subject_name    varchar,
    tutor           varchar,
    amount_of_hours numeric
);
create table exam_results
(
    exam_id    numeric primary key,
    student_id numeric references student (student_id) NOT NULL,
    subject_id numeric references subject (subject_id) NOT NULL,
    mark       numeric
);
create table phone_numbers
(
    phone_number_id numeric primary key,
    phone_number    varchar(14),
    student_id      numeric references student (student_id) NOT NULL
);