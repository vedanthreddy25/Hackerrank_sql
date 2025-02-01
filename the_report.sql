with t1 as(select 
    name,
    case
        when (marks>=0 and marks<=9) then 1
        when marks>=10 and marks<=19 then 2
        when marks>=20 and marks<=29 then 3
        when marks>=30 and marks<=39 then 4
        when marks>=40 and marks<=49 then 5
        when marks>=50 and marks<=59 then 6
        when marks>=60 and marks<=69 then 7
        when marks>=70 and marks<=79 then 8
        when marks>=80 and marks<=89 then 9
        when marks>=90 and marks<=100 then 10
    end as grade,
    marks
from 
    students)
    
    
select
    case
        when grade >=8 then name
        else  'NULL'
    end as name,
    grade,
    marks
from
    t1
order by 
    grade desc,
    CASE 
        WHEN grade >= 8 THEN name
        ELSE NULL
    END ASC,
    CASE 
        WHEN grade < 8 THEN marks
        ELSE NULL
    END ASC;

"""
You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.



Grades contains the following data:



Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.

Sample Input



Sample Output

Maria 10 99
Jane 9 81
Julia 9 88 
Scarlet 8 78
NULL 7 63
NULL 7 68

Note

Print "NULL"  as the name if the grade is less than 8.

Explanation

Consider the following table with the grades assigned to the students:



So, the following students got 8, 9 or 10 grades:

Maria (grade 10)
Jane (grade 9)
Julia (grade 9)
Scarlet (grade 8)
"""   
