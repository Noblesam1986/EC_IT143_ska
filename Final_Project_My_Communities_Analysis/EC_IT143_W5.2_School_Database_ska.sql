/*****************************************************************************************************************
NAME:    5.2 Final Project: My Communities Analysis—Create Answers
PURPOSE: Creating answers for questions on the School_Database

MODIFICATION LOG:
Ver      Date        Author					Description
-----   ----------   -----------			-----------------------------------------------------------------
1.0     07/20/2024   Samuel Kofi Amissah    1. EC_IT143_W5.2_School_Database_ska


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- QUESTIONS

-- QUESTION 1 - School Database
-- Original Author of the Question: Robert Brumfield

-- Create a report card for students with StudentID's between 1 and 3. 
-- Be sure to include the SubjectID, TeacherID, and the MarkObtained for each student.

-- Answer:

 SELECT Marks.StudentID, 
		Students.FirstName + '  ' + Students.LastName AS Student_Name ,  
		Subjects.SubjectID,
		Subjects.SubjectName,
		Teachers.TeacherID,
		Marks.MarkObtained

	FROM ( Marks
				INNER JOIN Subjects ON Marks.SubjectID = Subjects.SubjectID
				INNER JOIN Teachers ON Marks.TeacherID = Teachers.TeacherID
				INNER JOIN Students ON Marks.StudentID = Students.StudentID
		) 
	
	WHERE Students.StudentID <=3

	GROUP BY Students.StudentID , 
			Marks.StudentID , 
			Students.LastName , 
			Students.FirstName , 
			Subjects.SubjectID , 
			Subjects.SubjectName ,
			Teachers.TeacherID ,
			Marks.MarkObtained


	ORDER BY Students.StudentID ASC;

	-- The report cards are generated
			
/* ************************************************************************************************************************************* */


-- QUESTION 2 - School Database
-- Original Author of the Question: Me

-- List the names of teachers and the number of students they teach.
-- Answer:


SELECT Marks.TeacherID , 

		(Teachers.LastName + ' ' + Teachers.FirstName) AS 'Teacher_Name',

		COUNT(Marks.StudentID) AS Number_of_Students
		

	FROM ( Marks
			
			INNER JOIN Teachers ON Marks.TeacherID = Teachers.TeacherID
		
		)


	GROUP BY Marks.TeacherID ,
			Teachers.LastName ,
			Teachers.FirstName

	ORDER BY Marks.TeacherID;

	-- Answer: Each teacher teaches 20 students

/* ************************************************************************************************************************************* */


-- QUESTION 3 - School Database
-- Original Author of the Question: Me

-- Which teacher had the best average mark of students' marks of students they teach?

	SELECT   Marks.TeacherID ,
		
			(Teachers.FirstName + ' ' + Teachers.LastName) AS Teacher_Name,
			
			Subjects.SubjectName,
			
			( AVG(Marks.MarkObtained) ) AS Average_Students_Mark

	FROM ( Marks
			INNER JOIN Teachers ON Marks.TeacherID = Teachers.TeacherID
			INNER JOIN Subjects ON Marks.SubjectID = Subjects.SubjectID
		)

	GROUP BY Marks.TeacherID ,
			Teachers.TeacherID,
			Teachers.FirstName,
			Teachers.LastName,
			Subjects.SubjectName

	ORDER BY AVG(Marks.MarkObtained) DESC
			;

	-- Answer: The teacher who had the best average mark of all their students is Aisha Said

/* ************************************************************************************************************************************* */



-- QUESTION 4 - School Database
-- Original Author of the Question: Me

-- What are the names of the best student and his/her teacher?

SELECT		(Students.FirstName + ' ' + Students.LastName) AS Student_Name,
			
			Subjects.SubjectName,

			Marks.MarkObtained,

			(Teachers.FirstName + ' ' + Teachers.LastName) AS Teacher_Name		

	FROM ( Marks
			INNER JOIN Teachers ON Marks.TeacherID = Teachers.TeacherID
			INNER JOIN Subjects ON Marks.SubjectID = Subjects.SubjectID
			INNER JOIN Students ON Marks.StudentID = Students.StudentID
		)

	GROUP BY Teachers.FirstName,
			 Teachers.LastName,
			 Subjects.SubjectName,
			 Students.FirstName,
			 Students.LastName,
			 Marks.MarkObtained

	ORDER BY Marks.MarkObtained DESC;


 -- Answer: Four students had the best mark. They all had 97.
 --			Their names are Abdi Nur, Daniel Girma, Robert Oduor, and Tewodros Berhanu.
 --			They are all Biology students and the name of their teacher is Aisha Said.









