/*****************************************************************************************************************
NAME:    Turn the view into a table
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

SELECT [v].[Number_of_Students_CGPA_3_50_4_00]
INTO [dbo].[t_01_International_Students_University_of_Idaho_Form_Responses_1]
FROM [International_Students].[dbo].[v_01_International_Students_University_of_Idaho_Form_Responses_1] AS v;

-- Previewing the Table, dbo.t_01_International_Students_University_of_Idaho_Form_Responses_1 just Created
SELECT TOP (100) Number_of_Students_CGPA_3_50_4_00
     
FROM [International_Students].[dbo].[t_01_International_Students_University_of_Idaho_Form_Responses_1];
