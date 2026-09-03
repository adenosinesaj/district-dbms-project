-- =================================================================
-- LEVEL 1: Basic Selection & Filtering
-- =================================================================

-- Q1: High Education Percentage Districts
SELECT District_Name, Education_Percentage
FROM District
WHERE Education_Percentage > 75;

-- Q2: Famous Food in Chattogram
SELECT Food_Name, Description
FROM Famous_Food
WHERE District_Name = 'Chattogram';

-- Q3: High Population Districts
SELECT District_Name, Population
FROM District
WHERE Population > 5000000;

-- =================================================================
-- LEVEL 2: Joins, Subqueries & Aggregations
-- =================================================================

-- Q1: Famous Persons and Professions
SELECT d.District_Name, dfp.FULL_NAME, dfp.PROFESSION
FROM District d
INNER JOIN District_Famous_Person dfp ON d.District_Name = dfp.DISTRICT_NAME;

-- Q2: Routes Above Average Fare
SELECT tr.Route_ID, tr.Start_Point, tr.End_Point, tr.Fare
FROM Transport_Route tr
WHERE tr.Fare > (SELECT AVG(Fare) FROM Transport_Route);

-- Q3: Average Education Rate by Division
SELECT d.Division_ID, AVG(d.Education_Percentage) AS Avg_Education
FROM District d
GROUP BY d.Division_ID
ORDER BY Avg_Education ASC;

-- =================================================================
-- LEVEL 3: Complex Aggregations & Group Filtering
-- =================================================================

-- Q1: Divisions with Average Population > 3M
SELECT d.Division_ID, AVG(d.Population) AS Avg_Population
FROM District d
GROUP BY d.Division_ID
HAVING AVG(d.Population) > 3000000
ORDER BY Avg_Population DESC;

-- Q2: Divisions with More Than 3 Famous Foods
SELECT d.Division_ID, COUNT(ff.Food_ID) AS Total_Foods
FROM District d
INNER JOIN Famous_Food ff ON d.District_Name = ff.District_Name
GROUP BY d.Division_ID
HAVING COUNT(ff.Food_ID) > 3
ORDER BY Total_Foods DESC;

-- Q3: Transport Route Count by Type
SELECT tt.Transport_Type_Name, COUNT(tr.Route_ID) AS Route_Count
FROM Transport_Type tt
INNER JOIN Transport_Route tr ON tt.Transport_Type_ID = tr.Transport_Type_ID
GROUP BY tt.Transport_Type_Name;