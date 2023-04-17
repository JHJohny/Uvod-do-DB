/*
 * Reporting - how many documents each department archived 
 */
SELECT 
	t.Department, COUNT(*) as 'Number of archived documents totally'
FROM (
SELECT 
	Document.doc_name AS 'Document',
	CONCAT(Employee.first_name, " ", Employee.last_name) AS 'Referent',
	Department.department_name AS 'Department'
FROM 
	Archive
INNER JOIN Document ON Archive.doc_id = Document.doc_id
INNER JOIN Employee ON Archive.referent_id = Employee.emp_id
INNER JOIN Department ON Employee.department = Department.department_id 
INNER JOIN Section ON Archive.section_id = Section.section_id
INNER JOIN Location ON Section.location_id = Location.location_id
) t
GROUP BY Department