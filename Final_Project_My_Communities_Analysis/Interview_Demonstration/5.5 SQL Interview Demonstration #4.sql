/****************************************************************************************** */

-- QUESTION:
-- Write an SQL select statement to find the top three employees who have the highest salary in each department. 

-- ANSWER:
SELECT employee_salary.employee_name , 
		employee_salary.department_id,
		employee_salary.employee_salary

	FROM employee_salary

	GROUP BY employee_salary.department_id, 
			employee_salary.employee_salary,
			employee_salary.employee_name

	ORDER BY employee_salary.department_id,
			employee_salary.employee_salary DESC;



-- ALTERNATIVE ANSWER:

SELECT TOP(3) employee_salary.employee_name , 
			employee_salary.department_id,
			employee_salary.employee_salary
	
			FROM employee_salary

			WHERE employee_salary.department_id = 1


UNION ALL


SELECT TOP(3) employee_salary.employee_name , 
			employee_salary.department_id,
			employee_salary.employee_salary
	
			FROM employee_salary
	
			WHERE employee_salary.department_id = 2

		
		ORDER BY department_id, employee_salary DESC;





