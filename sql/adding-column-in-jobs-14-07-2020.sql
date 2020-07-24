ALTER TABLE `iti_wpsp_jobs` ADD `number` INT NOT NULL AFTER `instructor_id`;

UPDATE iti_wpsp_jobs SET number = id WHERE instructor_id = 12

UPDATE `iti_wpsp_jobs` SET `number` = '17' WHERE `iti_wpsp_jobs`.`id` = 60;

UPDATE iti_wpsp_jobs SET number = id%16 WHERE instructor_id = 13

UPDATE iti_wpsp_jobs SET number = (id - 16 ) %41 WHERE instructor_id = 13
UPDATE `iti_wpsp_jobs` SET `number` = '41' WHERE `iti_wpsp_jobs`.`id` = 57;
UPDATE `iti_wpsp_jobs` SET `number` = '42' WHERE `iti_wpsp_jobs`.`id` = 58;
UPDATE `iti_wpsp_jobs` SET `number` = '43' WHERE `iti_wpsp_jobs`.`id` = 59;
