\COPY (SELECT row_to_json(results) FROM (SELECT student_id, name, surname, date_of_birth, primary_skill, created_datetime, updated_datetime, (SELECT array_to_json(array_agg(s)) FROM (SELECT t.subject_id, t.subject_name, t.tutor, t.amount_of_hours, (SELECT array_to_json(array_agg(e)) FROM (SELECT exam_id, mark FROM exam_results er WHERE er.student_id = student.student_id and t.subject_id = er.subject_id) e) AS exams FROM (select subject.subject_id, subject_name, tutor, amount_of_hours from subject join exam_results on subject.subject_id = exam_results.subject_id and student.student_id = exam_results.student_id) as t) s) AS subjects, (SELECT array_to_json(array_agg(p)) FROM (SELECT phone_number, phone_number_id FROM phone_numbers WHERE phone_numbers.student_id = student.student_id) p)               AS phoneNumbers FROM student) results) TO '/data.json' WITH (FORMAT text, HEADER FALSE);

\COPY (SELECT row_to_json(results)
      FROM (SELECT student_id,
                   name,
                   surname,
                   date_of_birth,
                   primary_skill,
                   created_datetime,
                   updated_datetime,
                   (SELECT array_to_json(array_agg(s))
                    FROM (SELECT t.subject_id,
                                 t.subject_name,
                                 t.tutor,
                                 t.amount_of_hours,
                                 (SELECT array_to_json(array_agg(e))
                                  FROM (SELECT exam_id, mark
                                        FROM exam_results er
                                        WHERE er.student_id = student.student_id
                                          and t.subject_id = er.subject_id) e) AS exams
                          FROM (select subject.subject_id, subject_name, tutor, amount_of_hours
                                from subject
                                         join exam_results on subject.subject_id = exam_results.subject_id and
                                                              student.student_id =
                                                              exam_results.student_id) as t) s) AS subjects,
                   (SELECT array_to_json(array_agg(p))
                    FROM (SELECT phone_number, phone_number_id
                          FROM phone_numbers
                          WHERE phone_numbers.student_id = student.student_id) p)               AS phoneNumbers
            FROM student) results) TO '/data.json' WITH (FORMAT text, HEADER FALSE);

mongoimport --uri mongodb://localhost:27017/mydatabase --collection student --jsonArray C:\data.json
