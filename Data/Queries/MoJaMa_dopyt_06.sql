/*
 * Getting persons that archived documents last 30 days
 */
SELECT DISTINCT 
	t.Referent
FROM 
(
	SELECT 
		CONCAT(employee.first_name, " ", employee.last_name) AS 'Referent',
		archive.archivation_date AS 'Archivation date'
	FROM 
		archive
	INNER JOIN document ON archive.doc_id = document.doc_id
	INNER JOIN employee ON archive.referent_id = employee.emp_id
	INNER JOIN section ON archive.section_id = section.section_id
	INNER JOIN location ON section.location_id = location.location_id
	WHERE DATEDIFF(NOW(),archive.archivation_date) < 30 #'Future' date is included as well
	ORDER BY archivation_date ASC
) t