with t1 as
(select
    h.hacker_id,h.name,count(*) as cnt,
    max(count(*)) over() as maxi,
    count(*) over ( partition by count(*))as freq
from 
    hackers h
join 
    challenges c
on 
    h.hacker_id=c.hacker_id
group by 
   h.hacker_id,h.name)
    
select 
    hacker_id,name,cnt
from
    t1
where 
    cnt=maxi or freq=1
order by 
    cnt desc,hacker_id


/*Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

Input Format

The following tables contain challenge data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 

Challenges: The challenge_id is the id of the challenge, and hacker_id is the id of the student who created the challenge. 

Sample Input 0

Hackers Table:  Challenges Table: 

Sample Output 0

21283 Angela 6
88255 Patrick 5
96196 Lisa 1
Sample Input 1

Hackers Table:  Challenges Table: 

Sample Output 1

12299 Rose 6
34856 Angela 6
79345 Frank 4
80491 Patrick 3
81041 Lisa 1
Explanation

For Sample Case 0, we can get the following details:

Students  and  both created  challenges, but the maximum number of challenges created is  so these students are excluded from the result.

For Sample Case 1, we can get the following details:

Students  and  both created  challenges. Because  is the maximum number of challenges created, these students are included in the result.*/
