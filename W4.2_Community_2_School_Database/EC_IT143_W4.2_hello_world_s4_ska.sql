/*****************************************************************************************************************
NAME:    ASSIGNMENT 2 - Create an ad hoc SQL query
PURPOSE: Hello World - Load user stored procedure

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   JJAUSSI       1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- PREVIOUS PROCESSES OR REFERENCES
/*_________________________________________________________________________*/

-- Step 1: Start with a question:
-- Question: Find the number of students who obtained marks above 79?

/*_________________________________________________________________________*/

-- Step 2: Begin creating an answer
-- Answer: Let's ask SQL server and find out ...

/*_________________________________________________________________________*/

-- Step 3: Create an ad hoc SQL query:

-- SELECT COUNT([dbo].[Marks].[MarkObtained]) AS Number_of_Students_with_Marks_Above_79

--	FROM [School_Database_Comprehensive_Educational_Data].[dbo].[Marks]

--	WHERE [MarkObtained] > 79;

/*_________________________________________________________________________*/

-- Step 4: Turn the ad hoc SQL query into a view.
-- DROP a table means delete the table

 DROP VIEW IF EXISTS dbo.v_01_Number_of_Students_with_Marks_Above_79;

 GO

	CREATE VIEW dbo.v_01_Number_of_Students_with_Marks_Above_79
	
	AS

		 SELECT COUNT([dbo].[Marks].[MarkObtained]) AS Number_of_Students_with_Marks_Above_79

			FROM [School_Database_Comprehensive_Educational_Data].[dbo].[Marks]

			WHERE [MarkObtained] > 79;