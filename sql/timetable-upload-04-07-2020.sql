INSERT INTO `iti_wpsp_file_types` (`id`, `name`, `description`) VALUES (NULL, 'Timetable', 'This file shows the time table.');

CREATE TABLE `iti_wpsp_lesson_plans` ( `id` INT NOT NULL , `file_id` INT NOT NULL , `instrunctor_id` INT NOT NULL , `name` VARCHAR(255) NOT NULL , `created_on` DATETIME NOT NULL ) ENGINE = InnoDB;

INSERT INTO `iti_wpsp_file_types` (`id`, `name`, `description`) VALUES (NULL, 'Lesson Plan', NULL);

ALTER TABLE `iti_wpsp_lesson_plans` CHANGE `instrunctor_id` `instructor_id` INT(11) NOT NULL;

ALTER TABLE `iti_wpsp_lesson_plans` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT, add PRIMARY KEY (`id`);

CREATE TABLE `iti_wpsp_demostration_plans` ( `id` INT NOT NULL , `file_id` INT NOT NULL , `instructor_id` INT NOT NULL , `name` VARCHAR(255) NOT NULL , `created_on` DATETIME NOT NULL ) ENGINE = InnoDB;

ALTER TABLE `iti_wpsp_demostration_plans` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT, add PRIMARY KEY (`id`);

INSERT INTO `iti_wpsp_file_types` (`id`, `name`, `description`) VALUES (NULL, 'Demonstration Plan', NULL);