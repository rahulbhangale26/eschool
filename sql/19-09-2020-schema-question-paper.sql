-- Question Paper designer.

CREATE TABLE `nutaniti`.`iti_wpsp_question_types` ( `id` INT NOT NULL AUTO_INCREMENT , `name` VARCHAR(50) NOT NULL , `description` VARCHAR(500) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

INSERT INTO `iti_wpsp_question_types` (`id`, `name`, `description`) VALUES (NULL, 'Multiple Choice Questions', 'This type of question has multiple choices to choose from.'), (NULL, 'Theory Question', 'These type of questions has a summarized answer.');

CREATE TABLE `nutaniti`.`iti_wpsp_questions` ( `id` INT NOT NULL AUTO_INCREMENT , `question_bank_id` INT NOT NULL , `question_type_id` INT NOT NULL , `question` TEXT NOT NULL , `created_by` INT NOT NULL , `created_on` DATETIME NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `iti_wpsp_question_banks` ADD `format_type` VARCHAR(10) NOT NULL AFTER `subject_id`;

UPDATE iti_wpsp_question_banks SET format_type = 'file'

ALTER TABLE `iti_wpsp_questions` ADD `marks` INT NOT NULL AFTER `question`;

CREATE TABLE `nutaniti`.`iti_wpsp_question_answers` ( `id` INT NOT NULL AUTO_INCREMENT , `question_id` INT NOT NULL , `answer` TEXT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
