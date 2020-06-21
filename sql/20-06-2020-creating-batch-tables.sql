
-- adding batch.

CREATE TABLE iti_wpsp_batches ( id INT NOT NLL AUTO_INCREMENT, name VARCHAR(255) NOT NULL, PRIMARY KEY(id) );
INSERT INTO `iti_wpsp_batches` (`id`, `name`) VALUES ('1', '2018-2020'), ('2', '2019-2021');
ALTER TABLE `iti_wpsp_student` ADD `batch_id` INT NOT NULL AFTER `parent_wp_usr_id`;
UPDATE iti_wpsp_student SET batch_id = 1 WHERE class_id LIKE '%4%';
UPDATE iti_wpsp_student SET batch_id = 1 WHERE class_id LIKE '%6%';
UPDATE iti_wpsp_student SET batch_id = 2 WHERE class_id LIKE '%5%'
UPDATE iti_wpsp_student SET batch_id = 2 WHERE class_id LIKE '%7%'

