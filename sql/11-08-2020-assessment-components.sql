CREATE TABLE `iti_wpsp_assessments` ( `id` INT NOT NULL AUTO_INCREMENT , `assessment_id` INT NOT NULL , `name` INT NOT NULL , `description` INT NOT NULL , `maximum_marks` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;


ALTER TABLE `iti_wpsp_assessments` CHANGE `name` `name` VARCHAR(30) NOT NULL;

ALTER TABLE `iti_wpsp_assessments` CHANGE `description` `description` TEXT NOT NULL;

CREATE TABLE `iti_wpsp_student_assessments` ( `id` INT NOT NULL AUTO_INCREMENT , `student_id` INT NOT NULL , `assessment_id` INT NOT NULL , `obtained_marks` INT(2) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `iti_wpsp_assessments` CHANGE `name` `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;

INSERT INTO `iti_wpsp_assessments` (`id`, `assessment_id`, `name`, `description`, `maximum_marks`) VALUES
(1, 0, 'Saftey Conciousness', '', 10),
(2, 1, 'Dress Code', '', 2),
(3, 0, 'Workplace Hygiene', '', 10),
(4, 1, 'Use PPI', '', 3),
(5, 1, 'Apply/Practice Saftey', '', 5),
(6, 3, 'Maintain Personal Cleanliness', '', 2),
(7, 3, 'Maintain Workplace Cleanliness', '', 5),
(8, 3, 'Dispose scrap as per standard practice', '', 3),
(9, 0, 'Attitude', '', 10),
(10, 9, 'Initiative', '', 3),
(11, 9, 'Accountability', '', 3),
(12, 9, 'Participative in work', '', 4),
(13, 0, 'Team Work/Work Independently', '', 10),
(14, 13, 'Communication with others', '', 3),
(15, 13, 'Cooperation in work', '', 3),
(16, 13, 'Coordination with others', '', 4),
(17, 0, 'Ability to follow manuals/Write instrunctions', '', 5),
(18, 17, 'Select right manual', '', 1),
(19, 17, 'Search for appropriate topic', '', 2),
(20, 17, 'Read and interpret the manual', '', 2),
(21, 0, 'Application of knowledge', '', 10),
(22, 21, 'Plan the work', '', 4),
(23, 21, 'Select appropriate tool and equipment', '', 3),
(24, 21, 'Review the work', '', 3),
(25, 0, 'Skill to handle tools and equipments', '', 10),
(26, 25, 'Handle and use tool and equipments', '', 4),
(27, 25, 'Maintain safety in handling', '', 3),
(28, 25, 'Care and maintain', '', 3),
(29, 0, 'Economical use of materials', '', 5),
(30, 29, 'Identify material defects', '', 1),
(31, 29, 'Select appropriate material', '', 2),
(32, 29, 'Minimize wastage in work', '', 2),
(33, 0, 'Speed in doing work', '', 10),
(34, 33, 'Properly Sequence a work', '', 2),
(35, 33, 'Use appropriate technique', '', 5),
(36, 33, 'Review the work during execution', '', 3),
(37, 0, 'Quality in workmanship', '', 10),
(38, 37, 'Achieve work with high accuracy', '', 4),
(39, 37, 'Confirm to requirement', '', 3),
(40, 37, 'Satisfy the purpose', '', 3);