/*
 * Who can access which location (only still employed employees)
 */
SELECT 
	t.Location,
	t.Referent
FROM 
(
SELECT 
	Location.description AS 'Location',
	CONCAT(Employee.first_name, " ", Employee.last_name) AS 'Referent'
FROM 
	Location, Employee
WHERE Employee.access_obtained = Location.security_level_access 
AND 
	Employee.emp_id NOT IN (
		SELECT 
			Employee.emp_id 
		FROM 
			Employee
		WHERE Employee.work_to IS NOT NULL
	)
	
) t