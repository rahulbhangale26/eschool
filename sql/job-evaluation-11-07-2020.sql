CREATE TABLE `iti_wpsp_job_evaluation_types` ( `id` INT NOT NULL AUTO_INCREMENT , `name` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `iti_wpsp_job_evaluation_types` CHANGE `name` `name` VARCHAR(60) NOT NULL;

INSERT INTO `iti_wpsp_job_evaluation_types` (`id`, `name`) VALUES (NULL, 'skills'), (NULL, 'grades');

INSERT INTO `iti_wpsp_job_evaluation_types` (`id`, `name`) VALUES (NULL, 'extra time deduction');

CREATE TABLE `iti_wpsp_job_marks` ( `id` INT NOT NULL AUTO_INCREMENT , `student_id` INT NOT NULL , `instructor_id` INT NOT NULL , `job_evaluation_type_id` INT NOT NULL , `job_operational_skill_id` INT NULL , `obtained_marks` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `iti_wpsp_job_marks` ADD `job_id` INT NOT NULL AFTER `id`;
