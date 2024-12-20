-- Here we will be working with date functions, focusing on the 'job_posted_date' column
SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date AS date
FROM job_postings_fact
LIMIT 50;
/*
 We notice that the datatype for the job_posted_date column is a timesatamp 
 we want to change it to DATE datatype
 we can use the casting :: (double colon) and specify the datatype 
 This is done within the SELECT statement
 */
-- 1. ::DATE: changes column to DATE formate
--Note: :: is used for casting format
SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM job_postings_fact;
-- 2. AT TIME ZONE: function to change timestamp to specific time zone
SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date
FROM job_postings_fact
LIMIT 50;
-- NOTICE TIME ZONE CHANGED TO -5HRS
-- 3. EXTRACT: gets fields (month, year, day, ..etc) from date/time value
SELECT job_title_short AS title,
    job_location AS location,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS date_month,
    EXTRACT(
        YEAR
        FROM job_posted_date
    ) AS date_year
FROM job_postings_fact
LIMIT 50;
-- YOU CAN EXTRACT MONTH, DAY, SECOND, MINUTE, ETC
/*
 We can use the EXTRACT function in conjunction with GROUP BY to, for example, 
 to see how month of the year are trending in terms of job_postings by counting
 the number of job_id's fro each month and them group the result by month's of the year
 */
SELECT COUNT(job_id),
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS Date_month
FROM job_postings_fact
GROUP BY Date_month
ORDER BY Date_month;
-- Same query just filtered jobs for Data Analysts only
SELECT COUNT(job_id) AS job_posted_counted,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS Date_month
FROM job_postings_fact
where job_title_short = 'Data Analyst'
GROUP BY Date_month
ORDER BY job_posted_counted DESC;
-- The trend shows that early in the year especially January, job postings are high and tend to go lower towards the end of the year