-- Batches 

CREATE TABLE `nutaniti`.`iti_wpsp_trades` ( `id` INT NOT NULL AUTO_INCREMENT , `name` VARCHAR(255) NOT NULL , `created_by` INT NOT NULL , `created_on` DATETIME NOT NULL , `published_on` DATETIME NOT NULL , `deleted_by` INT NOT NULL , `deleted_on` DATETIME NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `iti_wpsp_class` ADD `trade_id` INT NOT NULL AFTER `cid`;
ALTER TABLE `iti_wpsp_student` ADD `trade_id` INT NOT NULL AFTER `batch_id`;
ALTER TABLE `iti_wpsp_student` ADD `current_class_id` INT NOT NULL AFTER `trade_id`;


DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 12;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 13;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 14;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 15;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 16;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 17;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 18;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 19;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 20;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 21;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 22;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 23;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 24;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 25;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 26;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 27;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 28;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 29;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 30;
DELETE FROM `iti_wpsp_subject` WHERE `iti_wpsp_subject`.`id` = 31;

ALTER TABLE `iti_wpsp_subject` ADD `trade_id` INT NOT NULL AFTER `class_id`;
ALTER TABLE `iti_wpsp_trades` CHANGE `deleted_by` `deleted_by` INT(11) NULL;
ALTER TABLE `iti_wpsp_trades` CHANGE `deleted_on` `deleted_on` DATETIME NULL;
ALTER TABLE `iti_wpsp_trades` CHANGE `published_on` `published_on` DATETIME NULL;



INSERT INTO `iti_wpsp_trades` (`id`, `name`, `created_by`, `created_on`, `published_on`, `deleted_by`, `deleted_on`) VALUES (1, 'Fitter', 1, NOW(), NOW(), NULL, NULL), (2, 'Electrician', 1, NOW(), NOW(), NULL, NULL );

-- Setting a trade id for classes
UPDATE iti_wpsp_class SET trade_id = 1 WHERE cid IN ( 4, 5 );
UPDATE iti_wpsp_class SET trade_id = 2 WHERE cid IN ( 6, 7 );

UPDATE `iti_wpsp_class` SET `c_name` = 'Fitter 1' WHERE `iti_wpsp_class`.`cid` = 4;
UPDATE `iti_wpsp_class` SET `c_name` = 'Fitter 2' WHERE `iti_wpsp_class`.`cid` = 5;
UPDATE `iti_wpsp_class` SET `c_name` = 'Electrician 2' WHERE `iti_wpsp_class`.`cid` = 6;
UPDATE `iti_wpsp_class` SET `c_name` = 'Electrician 1' WHERE `iti_wpsp_class`.`cid` = 7;

UPDATE iti_wpsp_student SET trade_id = 1 WHERE class_id = 'a:1:{i:0;s:1:"4";}';
UPDATE iti_wpsp_student SET trade_id = 1 WHERE class_id = 'a:1:{i:0;s:1:"5";}';
UPDATE iti_wpsp_student SET trade_id = 2 WHERE class_id = 'a:1:{i:0;s:1:"6";}';
UPDATE iti_wpsp_student SET trade_id = 2 WHERE class_id = 'a:1:{i:0;s:1:"7";}';

CREATE TABLE iti_wpsp_teacher_batches ( id INT NOT NULL AUTO_INCREMENT , batch_id INT NOT NULL , teacher_id INT NOT NULL , PRIMARY KEY ( id ) ) ENGINE = InnoDB;

ALTER TABLE iti_wpsp_trades ADD number_of_years SMALLINT NOT NULL AFTER name;

ALTER TABLE iti_wpsp_class ADD batch_id INT NOT NULL AFTER trade_id;

UPDATE `iti_wpsp_class` SET `batch_id` = '2' WHERE `iti_wpsp_class`.`cid` = 4;
UPDATE `iti_wpsp_class` SET `batch_id` = '1' WHERE `iti_wpsp_class`.`cid` = 5;
UPDATE `iti_wpsp_class` SET `batch_id` = '2' WHERE `iti_wpsp_class`.`cid` = 6;
UPDATE `iti_wpsp_class` SET `batch_id` = '1' WHERE `iti_wpsp_class`.`cid` = 7;

ALTER TABLE `iti_wpsp_trades` CHANGE `number_of_years` `duration` SMALLINT(6) NOT NULL;
ALTER TABLE `iti_wpsp_trades` ADD `trade_pattern` VARCHAR(10) NOT NULL AFTER `duration`;

UPDATE `iti_wpsp_trades` SET `trade_pattern` = 'year';

ALTER TABLE `iti_wpsp_subject` ADD `year_or_semester_no` INT NOT NULL AFTER `trade_id`;

CREATE TABLE `nutaniti`.`iti_wpsp_units` ( `id` INT NOT NULL AUTO_INCREMENT , `trade_id` INT NOT NULL , `year_or_semester_no` INT NOT NULL , `instructor_user_id` INT NOT NULL , `Unit Name` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `iti_wpsp_units` CHANGE `Unit Name` `unit_name` VARCHAR(30) NOT NULL;

CREATE TABLE `nutaniti`.`subject_instructor` ( `id` INT NOT NULL AUTO_INCREMENT , `subject_id` INT NOT NULL , `instructor_id` INT NOT NULL , `unit_id` INT NOT NULL , `trade_id` INT NOT NULL , `year_or_semester_no` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

RENAME TABLE `nutaniti`.`subject_instructor` TO `nutaniti`.`iti_wpsp_subject_instructors`;

ALTER TABLE `iti_wpsp_student` CHANGE `current_class_id` `current_unit_id` INT(11) NOT NULL;


UPDATE
	iti_wpsp_student 
SET
	current_unit_id = 4 
WHERE 
	batch_id = 2 
    AND trade_id = 1;

UPDATE iti_wpsp_student SET current_unit_id = 5 WHERE batch_id = 1 AND trade_id = 1
UPDATE iti_wpsp_student SET current_unit_id = 6 WHERE batch_id = 1 AND trade_id = 2
UPDATE iti_wpsp_student SET current_unit_id = 7 WHERE batch_id = 2 AND trade_id = 2


ALTER TABLE `iti_wpsp_units` CHANGE `instructor_user_id` `instructor_id` INT(11) NOT NULL;













