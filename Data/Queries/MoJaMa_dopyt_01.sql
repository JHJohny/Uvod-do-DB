/*
 * Getting last 20 Archive inventory from the newest to oldest archivation
 */
SELECT 
	document.doc_name AS 'Document name',
	archive.comment AS 'Document comment',
	CONCAT(employee.first_name, " ", employee.last_name) AS 'Referent',
	CONCAT(location.description, ", ", section.description) AS 'Document location',
	archive.archivation_date AS 'Archivation date',
	access_level.access_requirements AS 'Access requirements',
	CASE
		WHEN archive_code.archive_code_expiration < DATE(NOW()) THEN 'No'
		ELSE 'Yes'
	END AS 'Is code valid'
FROM
	archive
INNER JOIN document ON archive.doc_id = document.doc_id
INNER JOIN employee ON archive.referent_id = employee.emp_id
INNER JOIN section ON archive.section_id = section.section_id
INNER JOIN location ON section.location_id = location.location_id
INNER JOIN access_level ON location.security_level_access = access_level.access_level
INNER JOIN archive_code ON archive.arch_code = archive_code.archive_code
ORDER BY archivation_date DESC
LIMIT 20;