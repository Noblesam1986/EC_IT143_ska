/*****************************************************************************************************************
NAME:    6.3 User Defined Functions and Triggers
PURPOSE: Create a user-defined scalar function

MODIFICATION LOG:
Ver      Date        Author						Description
-----   ----------   -----------				-------------------------------------------------------------------------------
1.0     07/24/2024   Samuel Kofi Amissah		1. Built this script for EC_IT143


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

--Step 5. Create a user-defined scalar function


CREATE FUNCTION [dbo].[udf_parse_first_name]

	( @v_combined_name AS VARCHAR(500) )

	RETURNS VARCHAR(100)


BEGIN

	DECLARE @v_first_name AS VARCHAR(100);
	
	SET @v_first_name = LEFT(@v_combined_name, CHARINDEX(' ', @v_combined_name + ' ') -1);

	RETURN @v_first_name;

END;

GO