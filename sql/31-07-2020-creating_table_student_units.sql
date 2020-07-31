CREATE TABLE 
	`iti_wpsp_student_units` ( `id` INT NOT NULL AUTO_INCREMENT , `student_id` INT NOT NULL , `unit_id` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;


INSERT INTO iti_wpsp_student_units( student_id, unit_id ) SELECT sid, current_unit_id FROM iti_wpsp_student

ALTER TABLE `iti_wpsp_units` ADD `is_passed` BOOLEAN NOT NULL AFTER `unit_name`;

UPDATE iti_wpsp_units SET is_passed = true WHERE id IN ( 4, 5, 6, 7 );