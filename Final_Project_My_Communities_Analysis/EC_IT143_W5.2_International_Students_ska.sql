/*****************************************************************************************************************
NAME:    5.2 Final Project: My Communities Analysis—Create Answers
PURPOSE: Creating answers for questions on the database, International_Students

MODIFICATION LOG:
Ver      Date        Author					Description
-----   ----------   -----------			-----------------------------------------------------------------
1.0     07/20/2024   Samuel Kofi Amissah    1. EC_IT143_W5.2_My_Community_ska


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- QUESTIONS

-- Question 5 - International Students
-- Original Author of the Question: Robert Brumfield

-- Make a list of students from anywhere in Africa. 
-- Be sure to include their level of schooling (Graduate), Which region they're from, and How satisfied they were.

SELECT InternationalStudentsUniversityofIdaho.LevelOfStudy , 
		
		InternationalStudentsUniversityofIdaho.HomeRegion ,

		InternationalStudentsUniversityofIdaho.MentalHealthStatus,

		InternationalStudentsUniversityofIdaho.FinancialStressFrequency,

		InternationalStudentsUniversityofIdaho.FinancialWorriesImpact,

		InternationalStudentsUniversityofIdaho.FinancialSupportSatisfaction,

		InternationalStudentsUniversityofIdaho.AcademicExperienceRating


		FROM InternationalStudentsUniversityofIdaho

		WHERE InternationalStudentsUniversityofIdaho.HomeRegion LIKE '%Africa%';

		-- Answer: There are five students from Africa area. 
		--			Three of them are from Sub-Saharan Africa and the other two are from North Africa (Including Middle East)


/******************************************************************************************************************* */


-- Question 6 - International Students
-- Original Author of the Question: Me

-- How many graduates from South Asia  had CGPA within 3.50 - 4.00?

SELECT InternationalStudentsUniversityofIdaho.LevelOfStudy ,
		InternationalStudentsUniversityofIdaho.HomeRegion,
		InternationalStudentsUniversityofIdaho.CGPA

		FROM InternationalStudentsUniversityofIdaho

		WHERE HomeRegion = 'South Asia' AND LevelOfStudy = 'Graduate' AND CGPA = '3.50 - 4.00';	

		-- Answer: Ten

/************************************************************************************************************************* */

-- Question 7 - International Students
-- Original Author of the Question: Me

-- How many sub-saharan Africa have stayed in the school for less than 6 months and have scholarships?

SELECT InternationalStudentsUniversityofIdaho.StudyDurationUI ,

		InternationalStudentsUniversityofIdaho.HomeRegion , 

		InternationalStudentsUniversityofIdaho.FundingSource

		FROM InternationalStudentsUniversityofIdaho

		WHERE HomeRegion = 'Sub-Saharan Africa' AND StudyDurationUI = 'Less than 6 months' AND FundingSource LIKE '%Scholarship%' ;


		-- Answer is NONE.

/*************************************************************************************************************************** */

-- Question 8 - International Students
-- Original Author of the Question: Me

-- Which home region has the highest family support?

SELECT InternationalStudentsUniversityofIdaho.HomeRegion , 
		
		COUNT(InternationalStudentsUniversityofIdaho.FundingSource) AS Number_of_Students

		FROM InternationalStudentsUniversityofIdaho

		WHERE FundingSource = 'Family support'

		GROUP BY HomeRegion

		ORDER BY COUNT(InternationalStudentsUniversityofIdaho.FundingSource) DESC;

		-- Answer: South Asia



