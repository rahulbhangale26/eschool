ALTER TABLE `iti_wpsp_exam_subjects` CHANGE `end_datetime` `end_datetime` DATETIME NULL;
ALTER TABLE `iti_wpsp_exam_subjects` CHANGE `end_datetime` `start_datetime` DATETIME NULL;

ALTER TABLE `iti_wpsp_lesson_plans` ADD `content` TEXT NULL AFTER `name`;
ALTER TABLE `iti_wpsp_lesson_plans` CHANGE `file_id` `file_id` INT(11) NULL DEFAULT NULL;

ALTER TABLE `iti_wpsp_lesson_plans` DROP `content`;

ALTER TABLE `iti_wpsp_lesson_plans` CHANGE `file_id` `file_ids` TEXT NULL DEFAULT NULL;

ALTER TABLE `iti_wpsp_lesson_plans` ADD `format_type` VARCHAR(10) NOT NULL AFTER `id`;
