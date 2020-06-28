ALTER TABLE `iti_wpsp_trainee_records` ADD `instructor_id` INT NOT NULL AFTER `trainee_record_type_id`;
ALTER TABLE `iti_wpsp_trainee_records` ADD `progress` VARCHAR(30) NOT NULL AFTER `is_checked`;


INSERT INTO `iti_wpsp_trainee_record_type` (`id`, `name`, `description`) VALUES (NULL, 'Drawing Book', ''), (NULL, 'WSC Notebook', '');

INSERT INTO `iti_wpsp_trainee_record_type` (`id`, `name`, `description`) VALUES (NULL, 'WSC Assignment', '');

INSERT INTO `iti_wpsp_trainee_record_type` (`id`, `name`, `description`) VALUES (NULL, 'Progress', '@SelectBox');

SELECT 
	tr.checked_on, 
    tr.instructor_id,
    
FROM
	iti_wpsp_trainee_records tr
    JOIN iti_wpsp_trainee_record_type trt ON trt.id = tr.trainee_record_type_id
GROUP BY
	tr.checked_on, tr.instructor_id
