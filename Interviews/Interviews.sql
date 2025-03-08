SELECT 
    ct.contest_id,
    ct.hacker_id,
    ct.name, 
    SUM(b.total_submissions) AS total_submissions, 
    SUM(b.total_accepted_submissions) AS total_accepted_submissions, 
    SUM(a.total_views) AS total_views, 
    SUM(a.total_unique_views) AS total_unique_views 
FROM Contests ct
JOIN Colleges cl 
    ON cl.contest_id = ct.contest_id
JOIN Challenges chh 
    ON chh.college_id = cl.college_id
LEFT JOIN (
    SELECT 
        ch.challenge_id,
        SUM(ISNULL(vs.total_views,0)) AS total_views, 
        SUM(ISNULL(vs.total_unique_views,0)) AS total_unique_views 
    FROM Challenges ch 
    JOIN View_Stats vs 
        ON vs.challenge_id = ch.challenge_id 
    GROUP BY ch.challenge_id
) AS a 
    ON chh.challenge_id = a.challenge_id
LEFT JOIN (
    SELECT 
        ch.challenge_id, 
        SUM(Total_submissions) AS Total_submissions, 
        SUM(Total_accepted_submissions) AS Total_accepted_submissions 
    FROM Challenges ch 
    JOIN Submission_Stats ss 
        ON ch.challenge_id = ss.challenge_id 
    GROUP BY ch.challenge_id
) AS b 
    ON chh.challenge_id = b.challenge_id
GROUP BY 
    ct.contest_id, ct.hacker_id, ct.name
HAVING (SUM(b.total_submissions) 
        + SUM(b.total_accepted_submissions) 
        + SUM(a.total_views) 
        + SUM(a.total_unique_views)) > 0
ORDER BY 
    ct.contest_id;


/*Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are .

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.

Input Format

The following tables hold interview data:

Contests: The contest_id is the id of the contest, hacker_id is the id of the hacker who created the contest, and name is the name of the hacker.

Colleges: The college_id is the id of the college, and contest_id is the id of the contest that Samantha used to screen the candidates.

Challenges: The challenge_id is the id of the challenge that belongs to one of the contests whose contest_id Samantha forgot, and college_id is the id of the college where the challenge was given to candidates.

View_Stats: The challenge_id is the id of the challenge, total_views is the number of times the challenge was viewed by candidates, and total_unique_views is the number of times the challenge was viewed by unique candidates.

Submission_Stats: The challenge_id is the id of the challenge, total_submissions is the number of submissions for the challenge, and total_accepted_submission is the number of submissions that achieved full scores.

Sample Input

Contests Table:Colleges Table:Challenges Table:View_Stats Table:Submission_Stats Table:

Sample Output

66406 17973 Rose 111 39 156 56
66556 79153 Angela 0 0 11 10
94828 80275 Frank 150 38 41 15
Explanation

The contest  is used in the college . In this college , challenges  and  are asked, so from the view and submission stats:

Sum of total submissions 

Sum of total accepted submissions 

Sum of total views 

Sum of total unique views 

Similarly, we can find the sums for contests  and .*/
