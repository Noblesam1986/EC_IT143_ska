-- Step 4. Create an after-update trigger

/*****************************************************************************************************************
NAME:    My Script Name
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author						Description
-----   ----------   -------------------				-------------------------------------------------------------------------------
1.0     07/25/2024   Samuel Kofi Amissah		1. Built this script for EC_IT143_6.3


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

CREATE TRIGGER trg_hello_world_last_mod ON dbo.t_hello_world

AFTER UPDATE

AS


UPDATE dbo.t_hello_world

	SET 
			last_modified_date = GETDATE()

			WHERE my_message IN
			(
			SELECT DISTINCT
				my_message
				
				FROM inserted
			);










