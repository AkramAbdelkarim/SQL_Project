/*
 Find job postings from the fist quarter that have a salary greater than $70k
 - combine job posting tables from the first quarter of 2023 (Jan-Mar)
 - Get job postings with an average yearly salary > $70k
 */
-- Wel will use subqueries and UNION operators to achieve this
-- subquery definition
SELECT quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.job_posted_date::DATE,
    quarter1_job_postings.salary_year_avg
FROM (
        SELECT *
        FROM january_jobs
        UNION
        SELECT *
        FROM february_jobs
        UNION
        SELECT *
        FROM march_jobs
    ) AS quarter1_job_postings
WHERE quarter1_job_postings.salary_year_avg > 70000
    AND quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY quarter1_job_postings.salary_year_avg DESC