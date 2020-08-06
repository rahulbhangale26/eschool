CREATE TABLE `iti_wpsp_exam_timetable` ( `id` INT NOT NULL AUTO_INCREMENT , `exam_id` INT NOT NULL , `subject_id` INT NOT NULL , `start_datetime` DATETIME NOT NULL , `end_datetime` DATETIME NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

RENAME TABLE `iti_wpsp_exam_timetable` TO `iti_wpsp_exam_subjects`;


ALTER TABLE `iti_wpsp_exam_subjects` ADD `total_marks` INT NOT NULL AFTER `end_datetime`;

CREATE TABLE `iti_wpsp_exam_results` ( `id` INT NOT NULL AUTO_INCREMENT , `exam_id` INT NOT NULL , `subject_id` INT NOT NULL , `student_id` INT NOT NULL , `obtained_marks` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

