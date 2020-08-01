ALTER TABLE `iti_wpsp_units` ADD `start_date` DATETIME NOT NULL AFTER `is_passed`;


UPDATE `iti_wpsp_units` SET `start_date` = '2018-08-05 05:35:46' WHERE `iti_wpsp_units`.`id` = 5;
UPDATE `iti_wpsp_units` SET `start_date` = '2018-08-05 05:35:46.000000' WHERE `iti_wpsp_units`.`id` = 6;

UPDATE `iti_wpsp_units` SET `start_date` = '2019-08-05 05:36:48' WHERE `iti_wpsp_units`.`id` = 4;
UPDATE `iti_wpsp_units` SET `start_date` = '2018-08-06 05:37:08' WHERE `iti_wpsp_units`.`id` = 5;
UPDATE `iti_wpsp_units` SET `start_date` = '2018-08-06 05:37:14' WHERE `iti_wpsp_units`.`id` = 6;
UPDATE `iti_wpsp_units` SET `start_date` = '2019-08-05 05:37:39' WHERE `iti_wpsp_units`.`id` = 7;

UPDATE `iti_wpsp_units` SET `start_date` = '2020-08-03 05:38:13' WHERE `iti_wpsp_units`.`id` = 8;
UPDATE `iti_wpsp_units` SET `start_date` = '2020-08-03 05:38:39' WHERE `iti_wpsp_units`.`id` = 9;
UPDATE `iti_wpsp_units` SET `start_date` = '2020-08-03 05:38:44' WHERE `iti_wpsp_units`.`id` = 10;
UPDATE `iti_wpsp_units` SET `start_date` = '2020-08-03 05:38:47' WHERE `iti_wpsp_units`.`id` = 11;