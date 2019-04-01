DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Viewsub`(`id` INT)
BEGIN
SET @strQuery = CONCAT('SELECT DISTINCT Code, Course, ArabicName , course.ID
FROM course 
WHERE course.ID IN (SELECT CourseID FROM course_semester
WHERE course_semester.SemesterID =',id,' )');

PREPARE stmt1 FROM @strQuery;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;

-- view semester subjects to the student

END$$
DELIMITER ;