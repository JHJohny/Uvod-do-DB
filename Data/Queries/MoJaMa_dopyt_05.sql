/*
 * Getting all archived documents, from particular locations (multiple locations)
 */
SELECT 
	Document.doc_name AS 'Document name',
	Archive.comment AS 'Document comment',
	CONCAT(Location.description, ", ", Section.description) AS 'Document location',
	Archive.archivation_date AS 'Archivation date'
FROM 
	Archive
INNER JOIN Document ON Archive.doc_id = Document.doc_id
INNER JOIN Employee ON Archive.referent_id = Employee.emp_id
INNER JOIN Section ON Archive.section_id = Section.section_id
INNER JOIN Location ON Section.location_id = Location.location_id
WHERE Archive.section_id IN (1, 30);