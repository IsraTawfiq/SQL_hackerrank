--Revising the Select Query I
select * 
FROM CITY
WHERE CountryCode= 'usa' AND POPULATION>100000;
--Revising the Select Query II
select Name
FROM CITY
WHERE CountryCode= 'usa' AND POPULATION>120000;
--Weather Observation Station 5
--2 Query approch--
select TOP 1 (CITY), LEN(CITY)
FROM STATION
ORDER BY LEN(CITY),CITY 

select TOP 1 (CITY), LEN(CITY)
FROM STATION
ORDER BY LEN(CITY) DESC,CITY 
--Ranking+CTE--
WITH ranking as (
    select CITY, LEN(CITY) AS leng, --alias is a must
    ROW_NUMBER () OVER(ORDER BY LEN(CITY),CITY) AS RN_ASD,
    ROW_NUMBER () OVER(ORDER BY LEN(CITY) DESC, CITY) AS RN_DES
    FROM STATION
)
SELECT CITY,leng
FROM ranking 
where RN_ASD=1 OR RN_DES=1

--Weather Observation Station 11
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[^AEIOU]%' OR CITY LIKE '%[^aeiou]'
--Weather Observation Station 12
SELECT DISTINCT CITY
FROM STATION
WHERE CITY  LIKE '[^AEIOU]%' AND CITY LIKE '%[^aeiou]'
--Higher Than 75 Marks
SELECT NAME
FROM STUDENTS
WHERE Marks >75 
ORDER BY substring(Name,-3),ID 
--Employee Names
SELECT  name
from Employee 
order by name 
--Employee Salaries
SELECT  name
from Employee
where salary>2000
and months<10
order by employee_id
