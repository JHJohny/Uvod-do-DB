/*
 * Getting all paychecks
 */
SELECT 
	document.doc_name AS 'Document name',
	archive.comment AS 'Document comment',
	CONCAT(employee.first_name, " ", employee.last_name) AS 'Referent',
	CONCAT(location.description, ", ", section.description) AS 'Document location',
	archive.archivation_date AS 'Archivation date'
FROM 
	archive
INNER JOIN document ON archive.doc_id = document.doc_id
INNER JOIN employee ON archive.referent_id = employee.emp_id
INNER JOIN section ON archive.section_id = section.section_id
INNER JOIN location ON section.location_id = location.location_id
WHERE document.doc_name LIKE ('paychecks%');