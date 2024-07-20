/*****************************************************************************************************************
NAME:    Create an ad hoc SQL query
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
SELECT COUNT(dbo.[International_Students_University_of_Idaho_Form_Responses_1].[_3_50_4_00]) AS Number_of_Students_CGPA_3_50_4_00
	FROM dbo.International_Students_University_of_Idaho_Form_Responses_1
	WHERE [_3_50_4_00] = '3.50 - 4.00';
