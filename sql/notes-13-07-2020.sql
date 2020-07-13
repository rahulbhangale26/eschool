CREATE TABLE `iti_wpsp_note_types` ( `id` INT NOT NULL AUTO_INCREMENT , `name` VARCHAR(255) NOT NULL , `description` TEXT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

INSERT INTO `iti_wpsp_note_types` (`id`, `name`, `description`) VALUES (NULL, 'Lesson', ''), (NULL, 'Practical', '');

CREATE TABLE `iti_wpsp_notes` ( `id` INT NOT NULL AUTO_INCREMENT , `note_type_id` INT NOT NULL , `instructor_id` INT NOT NULL , `note` INT NOT NULL , `created_on` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `iti_wpsp_notes` CHANGE `note` `note` TEXT NOT NULL;

ALTER TABLE `iti_wpsp_notes` CHANGE `created_on` `created_on` DATETIME NOT NULL;
