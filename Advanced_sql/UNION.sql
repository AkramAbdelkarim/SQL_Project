/*
 Combining result sets of two or more select statement
 Note: for the Union to work, each SELECT statement should have the
 same number of columns in the resut set with similar data types 
 */
-- For this we will use our tables created earlier for Jan, Feb, and Mar jobs
-- We will only apply on specific columns
SELECT job_title_short,
    company_id,
    job_location
FROM january_jobs
UNION ALL
-- combines first select statement with second
SELECT job_title_short,
    company_id,
    job_location
FROM february_jobs
UNION ALL
-- combines previous select statements with the next one
SELECT job_title_short,
    company_id,
    job_location
FROM march_jobs;
-- UNION: combines result sets rows-wise and removes duplicates
-- UNION ALL: includes duplicate rows