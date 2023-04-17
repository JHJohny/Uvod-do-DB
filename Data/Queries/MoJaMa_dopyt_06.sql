/*
 * Getting persons that archived documents last 30 days
 */

SELECT DISTINCT 
	t.Referent
FROM 
(
	SELECT 
		CONCAT(Employee.first_name, " ", Employee.last_name) AS 'Referent',
		Archive.archivation_date AS 'Archivation date'
	FROM 
		Archive
	INNER JOIN Document ON Archive.doc_id = Document.doc_id
	INNER JOIN Employee ON Archive.referent_id = Employee.emp_id
	INNER JOIN Section ON Archive.section_id = Section.section_id
	INNER JOIN Location ON Section.location_id = Location.location_id
	WHERE DATEDIFF(NOW(),Archive.archivation_date) < 30 #'Future' date is included as well
	ORDER BY archivation_date ASC
) t