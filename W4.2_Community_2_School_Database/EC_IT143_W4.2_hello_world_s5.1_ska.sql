/*****************************************************************************************************************
NAME:    ASSIGNMENT 2 - Turn the view into a table
PURPOSE: Hello World - Load user stored procedure

MODIFICATION LOG:
Ver      Date        Author                    Description
-----   ----------   -----------               ----------------------------------------------------------------
1.0     07/12/2024   SAMUEL KOFI AMISSAH       1. EC_IT143_W4.2


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

 -- DROP VIEW IF EXISTS dbo.v_01_Number_of_Students_with_Marks_Above_79;

-- GO

--	CREATE VIEW dbo.v_01_Number_of_Students_with_Marks_Above_79
	
--	AS

--		 SELECT COUNT([dbo].[Marks].[MarkObtained]) AS Number_of_Students_with_Marks_Above_79

--			FROM [School_Database_Comprehensive_Educational_Data].[dbo].[Marks]

--			WHERE [MarkObtained] > 79;

/*_________________________________________________________________________*/

-- Step 5: Turn the view into a table

-- Turn the view, dbo.v_01_International_Students_University_of_Idaho_Form_Responses_1 into a new table 
--   called, dbo.t_01_International_Students_University_of_Idaho_Form_Responses_1

-- Select 
-- [The Database].[dbo].[The Specific Table in the Database].[The Specific Column]

-- When 
-- [The Database].[dbo].[The Specific Table in the Database], the database View table is represented with 'v'

-- Then we have
-- Select [v].[The Specific Column on the View Table]
 SELECT [v].[Number_of_Students_with_Marks_Above_79]

 -- Insect the Column [Number_of_Students_with_Marks_Above_79] of the View table into 
 -- a newly created Table [t_01_Number_of_Students_with_Marks_Above_79] - The New table does not exist already, but will be created 
 INTO [dbo].[t_01_Number_of_Students_with_Marks_Above_79]

 -- From the View table [v_01_Number_of_Students_with_Marks_Above_79]
 FROM [School_Database_Comprehensive_Educational_Data].[dbo].[v_01_Number_of_Students_with_Marks_Above_79] AS v;


-- Previewing the Table, dbo.t_01_International_Students_University_of_Idaho_Form_Responses_1 just Created

 SELECT TOP (100) Number_of_Students_with_Marks_Above_79
     
 FROM [School_Database_Comprehensive_Educational_Data].[dbo].[t_01_Number_of_Students_with_Marks_Above_79];
