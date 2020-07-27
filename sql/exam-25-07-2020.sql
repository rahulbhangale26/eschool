UPDATE `iti_wpsp_units` SET `unit_name` = 'Unit 1 - First Year' WHERE `iti_wpsp_units`.`id` = 4;
UPDATE `iti_wpsp_units` SET `unit_name` = 'Unit 1 - First Year' WHERE `iti_wpsp_units`.`id` = 7;
UPDATE `iti_wpsp_units` SET `unit_name` = 'Unit 2 - Second Year' WHERE `iti_wpsp_units`.`id` = 5;
UPDATE `iti_wpsp_units` SET `unit_name` = 'Unit 2 - Second Year' WHERE `iti_wpsp_units`.`id` = 6;


ALTER TABLE `iti_wpsp_jobs` ADD `unit_id` INT NOT NULL AFTER `instructor_id`;
UPDATE iti_wpsp_jobs SET unit_id = 5 WHERE instructor_id = 12
UPDATE iti_wpsp_jobs SET unit_id = 4 WHERE instructor_id = 13


DROP TABLE `iti_wpsp_exam`

CREATE TABLE `iti_wpsp_exams` ( `id` INT NOT NULL AUTO_INCREMENT , `unit_id` INT NOT NULL , `instructor_id` INT NOT NULL , `name` VARCHAR(255) NOT NULL , `start_date` DATETIME NOT NULL , `end_date` DATETIME NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
