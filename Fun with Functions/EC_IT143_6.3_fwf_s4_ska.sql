-- Step 4. Research and test a solution

-- A: Well, here is your problem...
-- CustomerName = Alejandra Camino -> Alejandra

SELECT t.ContactName
		
		, LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') -1) AS first_name

	FROM dbo.t_w3_schools_customers AS t

	ORDER BY 1;