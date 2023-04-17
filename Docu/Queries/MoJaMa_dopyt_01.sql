/*
 * Getting last 20 Archive inventory from the newest to oldest archivation
 */
SELECT 
	Document.doc_name AS 'Document name',
	Archive.comment AS 'Document comment',
	CONCAT(Employee.first_name, " ", Employee.last_name) AS 'Referent',
	CONCAT(Location.description, ", ", Section.description) AS 'Document location',
	Archive.archivation_date AS 'Archivation date'
FROM 
	Archive
INNER JOIN Document ON Archive.doc_id = Document.doc_id
INNER JOIN Employee ON Archive.referent_id = Employee.emp_id
INNER JOIN Section ON Archive.section_id = Section.section_id
INNER JOIN Location ON Section.location_id = Location.location_id
ORDER BY archivation_date DESC
LIMIT 20;