-- New Batch and Unit creation

INSERT INTO iti_wpsp_batches( name ) VALUES ( '2020-2021' );

INSERT INTO iti_wpsp_units( batch_id, trade_id, year_or_semester_no, instructor_id, unit_name )
VALUES( '3', '1', '1', '12', 'Unit 2 - First Year' );

INSERT INTO iti_wpsp_units( batch_id, trade_id, year_or_semester_no, instructor_id, unit_name ) VALUES( '3', '2', '1', '14', 'Unit 2 - First Year' );


INSERT INTO iti_wpsp_units( batch_id, trade_id, year_or_semester_no, instructor_id, unit_name ) 
VALUES ( 2, 1, 2, 13, 'Unit 1 - Second Year' );

INSERT INTO iti_wpsp_units( batch_id, trade_id, year_or_semester_no, instructor_id, unit_name ) 
VALUES ( 2, 2, 2, 15, 'Unit 1 - Second Year' );

INSERT INTO iti_wpsp_student_units( student_id, unit_id ) SELECT sid, 10 FROM iti_wpsp_student WHERE batch_id = 2 AND trade_id = 1;
INSERT INTO iti_wpsp_student_units( student_id, unit_id ) SELECT sid, 11 FROM iti_wpsp_student WHERE batch_id = 2 AND trade_id = 2;


INSERT INTO iti_wpsp_subject_instructors( subject_id, instructor_id, unit_id, trade_id, year_or_semester_no )
SELECT subject_id, instructor_id, 10 AS unit_id ,trade_id, 2 AS year_or_semester_no FROM iti_wpsp_subject_instructors WHERE trade_id = 1 AND year_or_semester_no = 1;

INSERT INTO iti_wpsp_subject_instructors( subject_id, instructor_id, unit_id, trade_id, year_or_semester_no ) 
SELECT subject_id, instructor_id, 11 AS unit_id ,trade_id, 2 AS year_or_semester_no FROM iti_wpsp_subject_instructors WHERE trade_id = 2 AND year_or_semester_no = 1;

/** These SQL addes duplicate records, We manually deleted those. */
INSERT INTO iti_wpsp_subject_instructors( subject_id, instructor_id, unit_id, trade_id, year_or_semester_no ) 
SELECT subject_id, instructor_id, 8 AS unit_id ,trade_id, 1 AS year_or_semester_no FROM iti_wpsp_subject_instructors WHERE trade_id = 1 AND year_or_semester_no = 2;

INSERT INTO iti_wpsp_subject_instructors( subject_id, instructor_id, unit_id, trade_id, year_or_semester_no ) 
SELECT subject_id, instructor_id, 9 AS unit_id ,trade_id, 1 AS year_or_semester_no FROM iti_wpsp_subject_instructors WHERE trade_id = 2 AND year_or_semester_no = 2;


