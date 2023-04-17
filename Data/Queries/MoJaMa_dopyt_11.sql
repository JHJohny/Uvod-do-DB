/*
 * Getting the low 'filled' locations
 */

SELECT 
	Location.description as 'Location', COUNT(*) as 'Contains this many documents'
FROM 
	Archive
INNER JOIN Document ON Archive.doc_id = Document.doc_id
INNER JOIN Section ON Archive.section_id = Section.section_id 
INNER JOIN Location ON Section.location_id  = Location.location_id 
GROUP BY Location
HAVING COUNT(*) < 11;