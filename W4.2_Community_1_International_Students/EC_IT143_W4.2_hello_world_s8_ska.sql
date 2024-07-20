/*****************************************************************************************************************
NAME:    Call the stored procedure
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
-- Question: Find the number of students whose CGPA is in the interval 3.50-4.00?

/*_________________________________________________________________________*/

-- Step 2: Begin creating an answer
-- Answer: Let's ask SQL server and find out ...

/*_________________________________________________________________________*/

-- Step 3: Create an ad hoc SQL query:
-- SELECT COUNT(dbo.[International_Students_University_of_Idaho_Form_Responses_1].[_3_50_4_00]) AS Number_of_Students_CGPA_3_50_4_00
--	FROM dbo.International_Students_University_of_Idaho_Form_Responses_1
--	WHERE [_3_50_4_00] = '3.50 - 4.00';

/*_________________________________________________________________________*/

-- Step 4: Turn the ad hoc SQL query into a view.

-- DROP VIEW IF EXISTS dbo.v_01_International_Students_University_of_Idaho_Form_Responses_1;

-- GO

--	CREATE VIEW dbo.v_01_International_Students_University_of_Idaho_Form_Responses_1
-- AS

--	SELECT COUNT(dbo.[International_Students_University_of_Idaho_Form_Responses_1].[_3_50_4_00]) AS Number_of_Students_CGPA_3_50_4_00
--	FROM dbo.International_Students_University_of_Idaho_Form_Responses_1
--	WHERE [_3_50_4_00] = '3.50 - 4.00';

/*_________________________________________________________________________*/

-- Step 5: Turn the view into a table

-- Turn the view, dbo.v_01_International_Students_University_of_Idaho_Form_Responses_1 into a new table 
--   called, dbo.t_01_International_Students_University_of_Idaho_Form_Responses_1

-- SELECT [v].[Number_of_Students_CGPA_3_50_4_00]
-- INTO [dbo].[t_01_International_Students_University_of_Idaho_Form_Responses_1]
-- FROM [International_Students].[dbo].[v_01_International_Students_University_of_Idaho_Form_Responses_1] AS v;

-- Previewing the Table, dbo.t_01_International_Students_University_of_Idaho_Form_Responses_1 just Created
-- SELECT TOP (100) Number_of_Students_CGPA_3_50_4_00
     
-- FROM [International_Students].[dbo].[t_01_International_Students_University_of_Idaho_Form_Responses_1];

/*_________________________________________________________________________*/

-- Step 6: Load(Reload) the table from the view using an ad hoc SQL script

-- 1) Reload data
-- TRUNCATE a table deletes the data inside a table

-- TRUNCATE TABLE [International_Students].[dbo].[t_01_International_Students_University_of_Idaho_Form_Responses_1];

-- The view table, v_hello_world_load is represented as a letter "v"

--  INSERT INTO [International_Students].[dbo].[t_01_International_Students_University_of_Idaho_Form_Responses_1]

-- 	 SELECT v.Number_of_Students_CGPA_3_50_4_00
		
-- 			FROM [International_Students].[dbo].[v_01_International_Students_University_of_Idaho_Form_Responses_1] AS v;

-- 2) Review results
-- The table t_hello_world is represented as a letter "t"

-- Select all the columns in table t_hello_world

--  SELECT t.*
 
 -- FROM [International_Students].[dbo].[t_01_International_Students_University_of_Idaho_Form_Responses_1] AS t;

 /*_________________________________________________________________________*/

 -- Step 7: Turn the ad hoc SQL script into a stored procedure


-- NOTE: AT EACH STEP, SELECT THE DATABASE, IN THIS ASSIGNMENT, EC_IT143_DA IN THE DATABASE SEARCH BAR AT THE TOP LEFT CORNER 
--       BEFORE EXECUTING THE CODES

 -- CREATE PROCEDURE dbo.usp_01_International_Students_University_of_Idaho_Form_Responses_1
 -- AS

--	BEGIN

		-- 1) Reload data
		-- TRUNCATE a table deletes the data inside a table

--		 TRUNCATE TABLE [International_Students].[dbo].[t_01_International_Students_University_of_Idaho_Form_Responses_1];

		-- The view table, [v_01_International_Students_University_of_Idaho_Form_Responses_1] is represented as a letter "v"

--		  INSERT INTO [International_Students].[dbo].[t_01_International_Students_University_of_Idaho_Form_Responses_1]

--		 	 SELECT v.Number_of_Students_CGPA_3_50_4_00
		
--		 			FROM [International_Students].[dbo].[v_01_International_Students_University_of_Idaho_Form_Responses_1] AS v;

		-- 2) Review results
		-- The table [t_01_International_Students_University_of_Idaho_Form_Responses_1] is represented as a letter "t"

		-- Select all the columns in table t_hello_world

--		  SELECT t.*
 
--		  FROM [International_Students].[dbo].[t_01_International_Students_University_of_Idaho_Form_Responses_1] AS t;

--	END;

-- GO

/*_________________________________________________________________________*/

-- Step 8: Call the stored procedure
EXEC [International_Students].[dbo].[usp_01_International_Students_University_of_Idaho_Form_Responses_1];
