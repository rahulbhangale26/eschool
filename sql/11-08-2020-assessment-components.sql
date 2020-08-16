CREATE TABLE `iti_wpsp_assessments` ( `id` INT NOT NULL AUTO_INCREMENT , `assessment_id` INT NOT NULL , `name` INT NOT NULL , `description` INT NOT NULL , `maximum_marks` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;


ALTER TABLE `iti_wpsp_assessments` CHANGE `name` `name` VARCHAR(30) NOT NULL;

ALTER TABLE `iti_wpsp_assessments` CHANGE `description` `description` TEXT NOT NULL;

CREATE TABLE `iti_wpsp_student_assessments` ( `id` INT NOT NULL AUTO_INCREMENT , `student_id` INT NOT NULL , `assessment_id` INT NOT NULL , `obtained_marks` INT(2) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
