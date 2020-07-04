CREATE TABLE 
	`files` ( `id` INT NOT NULL AUTO_INCREMENT , `file_type_id` INT NOT NULL , `file_name` TEXT NOT NULL , `file_path` TEXT NOT NULL , `uploaded_on` DATETIME NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;


ALTER TABLE `files` ADD `is_active` BOOLEAN NOT NULL AFTER `file_path`, ADD `uploaded_by` INT NOT NULL AFTER `is_active`;

RENAME TABLE `files` TO `iti_wpsp_files`;

CREATE TABLE `iti_wpsp_file_types` ( `id` INT NOT NULL AUTO_INCREMENT , `name` INT NOT NULL , `description` INT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `iti_wpsp_file_types` CHANGE `name` `name` VARCHAR(255) NOT NULL;

ALTER TABLE `iti_wpsp_file_types` CHANGE `description` `description` TEXT NULL DEFAULT NULL;

INSERT INTO `iti_wpsp_file_types` (`id`, `name`, `description`) VALUES (NULL, 'Syllabus', 'This type of files stores the syllabus details.');

CREATE TABLE `iti_wpsp_syllabus` ( `id` INT NOT NULL AUTO_INCREMENT , `file_id` INT NOT NULL , `trade_id` INT NOT NULL , `name` VARCHAR(255) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

