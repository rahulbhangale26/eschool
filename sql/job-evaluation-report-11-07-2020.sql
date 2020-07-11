INSERT INTO `iti_wpsp_job_evaluation_types` (`id`, `name`) VALUES (NULL, 'remark');

ALTER TABLE `iti_wpsp_job_marks` ADD `remark` VARCHAR(255) NOT NULL AFTER `obtained_marks`;
