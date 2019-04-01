DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Delete`(`courseid` INT, `semesterid` INT, `id` INT)
BEGIN
SET @strQuery = CONCAT('delete from registration
					  where registration.Course_semesterID = (SELECT course_semester.ID from course_semester 
                      where course_semester.CourseID=',courseid,'
					  and course_semester.SemesterID=',semesterid,')

		  and registration.StudentID=',id);
          
PREPARE stmt1 FROM @strQuery;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;

-- Delete subject from  registration table

END$$
DELIMITER ;