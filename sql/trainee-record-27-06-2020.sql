CREATE TABLE iti_wpsp_trainee_record_type` ( `id` INT NOT NULL AUTO_INCREMENT , `name` VARCHAR(30) NOT NULL , `description` VARCHAR(255) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;


CREATE TABLE `iti_wpsp_trainee_records` ( `id` INT NOT NULL AUTO_INCREMENT , `student_id` INT NOT NULL , `trainee_record_type_id` INT NOT NULL , `is_checked` BOOLEAN NOT NULL , `checked_for` DATETIME NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;


INSERT INTO `iti_wpsp_trainee_record_type` (`id`, `name`, `description`) VALUES ('1', 'Daily Diary', 'This type of record stores daily activity details'), ('2', 'Drafting Book', '');

INSERT INTO `iti_wpsp_trainee_record_type` (`id`, `name`, `description`) VALUES ('3', 'Theory File', ''), ('4', 'Job Sheetbook', '');

INSERT INTO `iti_wpsp_trainee_record_type` (`id`, `name`, `description`) VALUES ('5', 'Assignment Book', ''), ('6', 'Practical Book', '');


ALTER TABLE `iti_wpsp_trainee_records` CHANGE `checked_for` `checked_on` DATETIME NOT NULL;
