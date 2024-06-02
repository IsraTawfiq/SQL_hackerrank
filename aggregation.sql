--Revising Aggregations - The Count Function
SELECT COUNT(ID) AS #cities
from CITY 
WHERE  POPULATION>100000
--Revising Aggregations - The Sum Function
SELECT SUM(POPULATION) AS Totalpopulation
from CITY 
WHERE  DISTRICT ='California'
--Revising Aggregations - Averages
SELECT AVG (POPULATION) AS AVGpopulation
from CITY 
WHERE  DISTRICT ='California'
--Average Population --ROUND OR FLOOR
SELECT FLOOR(AVG (POPULATION)) AS ROUNDER_Population
from CITY 
--Japan Population
SELECT SUM(POPULATION) AS SUMPopulation
from CITY 
WHERE COUNTRYCODE='JPN'
--Population Density Difference
SELECT MAX(POPULATION) -MIN(POPULATION) AS difference
from CITY 
--The Blunder

SELECT cast(Round(AVG(cast(SALARY as float)) - ROUND(AVG(cast(REPLACE(cast(SALARY as char),'0','') as int)),0),0) as int) FROM EMPLOYEES
--Top Earners
WITH TotalEarnings AS (
    SELECT 
        employee_id,
        (months * salary) AS total_earnings
    FROM 
        Employee
)
SELECT 
    MAX(total_earnings) AS max_total_earnings,
    COUNT(employee_id) AS num_employees
FROM 
    TotalEarnings
WHERE  total_earnings = (SELECT MAX(total_earnings) FROM TotalEarnings)
--Weather Observation Station 13
SELECT ROUND(SUM(LAT_N),4) FROM STATION WHERE LAT_N > 38.7880 AND LAT_N < 137.2345
--Weather Observation Station 14
SELECT ROUND(MAX(LAT_N), 4)
FROM station
WHERE LAT_N < 137.2345;

--Weather Observation Station 15
SELECT ROUND(LONG_W,4) FROM STATION WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);
--Weather Observation Station 16
SELECT ROUND(MIN (LAT_N),4) FROM STATION 
WHERE LAT_N > 38.7780;
--Weather Observation Station 17
SELECT ROUND(LONG_W,4) FROM STATION 
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780);

--Weather Observation Station 18
select round(max(lat_n)-min(lat_n) + max(long_w)-min(long_w),4) from station;

--Weather Observation Station 19
select round(power(power(max(lat_n)-min(lat_n),2) + power(max(long_w)-min(long_w),2),0.5),4) from station;

--20
 SELECT ROUND(S1.LAT_N, 4) 
    FROM STATION AS S1 
    WHERE (SELECT ROUND(COUNT(S1.ID)/2) - 1 
           FROM STATION) = 
          (SELECT COUNT(S2.ID) 
           FROM STATION AS S2 
           WHERE S2.LAT_N > S1.LAT_N);
