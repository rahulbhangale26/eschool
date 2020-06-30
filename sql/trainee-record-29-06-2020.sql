CREATE TABLE `nutaniti`.`iti_wpsp_attendance_types` ( `id` INT NOT NULL , `name` VARCHAR(30) NOT NULL , `code` VARCHAR(3) NOT NULL , `description` VARCHAR(255) NOT NULL ) ENGINE = InnoDB;

INSERT INTO `iti_wpsp_attendance_types` (`id`, `name`, `code`, `description`) VALUES ('1', 'Present', 'P', ''), ('2', 'Absent', 'A', '');

INSERT INTO `iti_wpsp_attendance_types` (`id`, `name`, `code`, `description`) VALUES ('2', 'Sick Leave', 'SL', ''), ('3', 'Casual Leave', 'CL', '');

INSERT INTO `iti_wpsp_attendance_types` (`id`, `name`, `code`, `description`) VALUES ('5', 'Special Leave', 'SPL', '');

UPDATE iti_wpsp_attendance_types SET id = 4 WHERE code='CL'

UPDATE iti_wpsp_attendance_types SET id = 3 WHERE code='SL'

ALTER TABLE `iti_wpsp_attendance_types` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT, add PRIMARY KEY (`id`);
/*
ALTER TABLE `iti_wpsp_subject_instructors` ADD `batch_id` INT NOT NULL AFTER `trade_id`;

UPDATE
	iti_wpsp_subject_instructors
SET
	batch_id = 1
WHERE
	( unit_id = 4 AND trade_id = 1 )
    OR 
    ( unit_id = 7 AND trade_id = 2);
	
UPDATE
	iti_wpsp_subject_instructors
SET
	batch_id = 2
WHERE
	( unit_id = 5 AND trade_id = 1 )
    OR 
    ( unit_id = 6 AND trade_id = 2);
	

*/

ALTER TABLE `iti_wpsp_units` ADD `batch_id` INT NOT NULL AFTER `id`;

/* setting manually batch_id */

CREATE TABLE `nutaniti`.`iti_wpsp_attendances` ( `id` INT NOT NULL AUTO_INCREMENT , `student_id` INT NOT NULL , `attendance_type_id` INT NOT NULL , `instructor_id` INT NOT NULL , `attendance_date` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;


RENAME TABLE `nutaniti`.`iti_wpsp_attendances` TO `nutaniti`.`iti_wpsp_trainee_attendances`;
ALTER TABLE `iti_wpsp_trainee_attendances` ADD `reason` TEXT NOT NULL AFTER `instructor_id`;

ALTER TABLE `iti_wpsp_trainee_attendances` CHANGE `attendance_date` `attendance_date` INT(11) NULL;

ALTER TABLE `iti_wpsp_trainee_attendances` CHANGE `reason` `reason` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL;

ALTER TABLE `iti_wpsp_trainee_attendances` CHANGE `attendance_date` `attendance_date` INT(11) NOT NULL;

ALTER TABLE `iti_wpsp_trainee_attendances` CHANGE `attendance_date` `attendance_date` DATETIME NOT NULL;

