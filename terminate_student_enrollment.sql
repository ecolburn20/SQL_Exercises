CREATE PROCEDURE `terminate_student_enrollment` (
course_code_in varchar(45), 
section_in varchar(45), 
student_id_in varchar(45), 
eff_date_in date)
BEGIN
UPDATE classparticipant
SET EndDate = eff_date_in
WHERE ID_Student = student_id_in
AND
ID_Class =
(
	SELECT ID_Class
    FROM class c
    INNER JOIN Course co 
    ON c.ID_Course = co.ID_Course
    WHERE co.CourseCode = course_code_in
    AND c.Section = section_id_in
);

END
