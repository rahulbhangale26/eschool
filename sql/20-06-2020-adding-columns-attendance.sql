ALTER TABLE `iti_wpsp_attendance` ADD `sick_leave` TEXT NOT NULL AFTER `absents`, ADD `casual_leave` TEXT NOT NULL AFTER `sick_leave`, ADD `special_leave` TEXT NOT NULL AFTER `casual_leave`;
