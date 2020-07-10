CREATE TABLE 
	`iti_wpsp_question_banks` 
		( `id` INT NOT NULL AUTO_INCREMENT , `file_id` INT NOT NULL , `instructor_id` INT NOT NULL , `name` VARCHAR(255) NOT NULL , `description` TEXT NOT NULL , `created_on` DATETIME NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `iti_wpsp_question_banks` ADD `trade_id` INT NOT NULL AFTER `id`;

INSERT INTO `iti_wpsp_file_types` (`id`, `name`, `description`) VALUES (NULL, 'Question Banks', 'This type of file stores the question banks.');