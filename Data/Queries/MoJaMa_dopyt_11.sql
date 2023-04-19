/*
 * Getting the low 'filled' locations
 */
SELECT 
	location.description as 'Location', COUNT(*) as 'Contains this many documents'
FROM 
	archive
INNER JOIN document ON archive.doc_id = document.doc_id
INNER JOIN section ON archive.section_id = section.section_id 
INNER JOIN location ON section.location_id  = location.location_id 
GROUP BY location
HAVING COUNT(*) < 11;