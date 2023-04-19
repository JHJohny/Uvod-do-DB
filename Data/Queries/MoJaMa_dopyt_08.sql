/*
 * Reporting - how many documents each department archived 
 */
SELECT 
	t.Department, COUNT(*) as 'Number of archived documents totally'
FROM (
SELECT 
	document.doc_name AS 'Document',
	CONCAT(employee.first_name, " ", employee.last_name) AS 'Referent',
	department.department_name AS 'Department'
FROM 
	archive
INNER JOIN document ON archive.doc_id = document.doc_id
INNER JOIN employee ON archive.referent_id = employee.emp_id
INNER JOIN department ON employee.department = department.department_id 
INNER JOIN section ON archive.section_id = section.section_id
INNER JOIN location ON section.location_id = location.location_id
) t
GROUP BY Department