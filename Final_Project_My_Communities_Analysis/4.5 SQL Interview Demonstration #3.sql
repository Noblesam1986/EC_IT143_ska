
-- SELECTING THE COLUMS OF THE TABLE

-- 1st Column - 
SELECT [EC_IT143_DA].[dbo].[gpa_history-1].[student_id] AS Student_ID,
	
-- Converting the Integer Values of the GPAs into Decimal Numbers
-- Using CAST

-- Finding the Average of the Required GPA for each Student
-- Sum of the required GPAs of the student and dividing that by the total number of GPAs selected

-- 2nd Column - GPA_Average
	CAST(  ( SUM( CAST( [EC_IT143_DA].[dbo].[gpa_history-1].gpa  AS DECIMAL(10,4)) ) )/COUNT([gpa_history-1].[gpa]) AS DECIMAL(2,1)) AS GPA_Average,

-- 3rd Column - Status_of_Student
	IIF(   CAST(  ( SUM( CAST( [EC_IT143_DA].[dbo].[gpa_history-1].gpa  AS DECIMAL(10,4)) ) )/COUNT([gpa_history-1].[gpa]) AS DECIMAL(2,1))   >= 3.5 , 'Qualified' , 'Not Qualified') AS Status_of_Student

-- Selecting the Values from the Table gpa_history-1	
	FROM [EC_IT143_DA].[dbo].[gpa_history-1]

-- Condition - Select the GPA where 'is_required'= 1
		WHERE [EC_IT143_DA].[dbo].[gpa_history-1].[is_required] = 1

-- Group the Selection According to 'student_id'
		GROUP BY  [EC_IT143_DA].[dbo].[gpa_history-1].student_id

-- Arrange the Result on the Table in the Order of the 'student_id'
		ORDER BY [EC_IT143_DA].[dbo].[gpa_history-1].student_id;