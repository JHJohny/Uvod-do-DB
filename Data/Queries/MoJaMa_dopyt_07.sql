/*
 * Who can access which location (only still employed employees)
 */
SELECT 
	t.Location,
	t.Referent
FROM 
(
SELECT 
	location.description AS 'Location',
	CONCAT(employee.first_name, " ", employee.last_name) AS 'Referent'
FROM 
	location, employee
WHERE employee.access_obtained = location.security_level_access 
AND 
	employee.emp_id NOT IN (
		SELECT 
			employee.emp_id 
		FROM 
			employee
		WHERE employee.work_to IS NOT NULL
	)
	
) t