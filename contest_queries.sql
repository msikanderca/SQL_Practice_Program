select * from contest;

SELECT c_id, start_date, end_date,
       DATEDIFF(LEAD(start_date) OVER (ORDER BY start_date), end_date) +1  AS no_of_days
FROM contest;


SELECT c_id, start_date, end_date, 
    LAG(end_date) OVER (ORDER BY start_date) AS prev_end_date,
    DATEDIFF(start_date, LAG(end_date) OVER (ORDER BY start_date)) AS gap_days
FROM contest;