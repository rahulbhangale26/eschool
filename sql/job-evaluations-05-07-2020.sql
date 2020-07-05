CREATE TABLE 
	`iti_wpsp_jobs` ( `id` INT NOT NULL AUTO_INCREMENT , `file_id` INT NOT NULL , `instructor_id` INT NOT NULL , `title` VARCHAR(255) NOT NULL , `description` TEXT NULL , `start_date` DATETIME NOT NULL , `end_date` DATETIME NOT NULL , `time_given` INT NOT NULL , `tolerance` VARCHAR(255) NOT NULL , `material` VARCHAR(255) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;


CREATE TABLE `iti_wpsp_job_operational_skills` ( `id` INT NOT NULL AUTO_INCREMENT , `job_id` INT NOT NULL , `name` VARCHAR(255) NOT NULL , `marks` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

INSERT INTO `iti_wpsp_file_types` (`id`, `name`, `description`) VALUES (NULL, 'Job Diagram', NULL);

