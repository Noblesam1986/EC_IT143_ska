-- Step 6. Ask the next question

DELETE FROM dbo.t_hello_world
	
	WHERE my_message IN('Hello World2', 'Hello World3', 'Hello World4');

	-- Load test rows
	INSERT INTO dbo.t_hello_world(my_message , current_date_time)
	VALUES	('Hello World2', GETDATE()) , 
			('Hello World3', GETDATE());

	-- See if the trigger worked
	SELECT t.*
		FROM dbo.t_hello_world AS t;

	-- Try it again
	UPDATE  dbo.t_hello_world SET my_message = 'Hello World4'
		WHERE my_message = 'Hello World3';

	-- See if the trigger worked
	SELECT t.*
		FROM dbo.t_hello_world AS t;

-- Q: How to keep track of who last modified a record?
-- A: This works for server user and the initial INSERT ...

ALTER TABLE dbo.t_hello_world
ADD last_modified_by VARCHAR(50) DEFAULT SUSER_NAME();
