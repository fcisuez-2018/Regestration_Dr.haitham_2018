DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_addSub`(`courseid` INT, `semesterid` INT, `id` INT)
BEGIN
SET @strQuery = CONCAT('insert into registration(Course_semesterID,StudentID) VALUES
  ((select S.ID from course_semester S where S.CourseID=',courseid,' and 
S.SemesterID=',semesterid,'),',id,')');

PREPARE stmt1 FROM @strQuery;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;


-- add subject into registration table

END$$
DELIMITER ;