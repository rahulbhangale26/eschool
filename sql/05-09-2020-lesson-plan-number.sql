ALTER TABLE `iti_wpsp_lesson_plans` ADD `number` VARCHAR(30) NOT NULL AFTER `id`;

ALTER TABLE `iti_wpsp_demostration_plans` CHANGE `file_id` `file_ids` INT(11) NOT NULL;

ALTER TABLE `iti_wpsp_demostration_plans` ADD `number` VARCHAR(30) NOT NULL AFTER `id`;
ALTER TABLE `iti_wpsp_demostration_plans` ADD `format_type` VARCHAR(10) NOT NULL AFTER `number`;
ALTER TABLE `iti_wpsp_demostration_plans` CHANGE `file_ids` `file_ids` TEXT NOT NULL;

