--Type of Triangle
select  
Case WHEN A+B>C  AND A+C> B AND B+C>A THEN
      CASE
      WHEN A=B and B=C THEN 'Equilateral'
      WHEN A=B OR A=C OR B=C THEN 'Isosceles'
      else  'Scalene'
      END
ELSE 'Not A Triangle'
END as types
FROM TRIANGLES
--The PADS
select CONCAT (Name,  '(' , LEFT(Occupation,1) , ')' )
FROM OCCUPATIONS
order by Name

SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(Occupation), Occupation
--Occupations
Select Doctor, Professor, Singer, Actor from (
 SELECT  name, 
               occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS rn
      FROM OCCUPATIONS
)subq
PIVOT (
    MAX(name)
    FOR [Occupation] IN ([Doctor],  [Professor],
                       [Singer],  [Actor])
)pvt
ORDER BY rn
--Binary Tree Nodes
SELECT N, 
CASE 
   WHEN P IS NULL THEN 'Root' 
   WHEN N IN (SELECT DISTINCT(P) FROM BST WHERE P IS NOT NULL) 
       THEN 'Inner' 
   ELSE 'Leaf' 
END 
FROM BST 
ORDER BY N
