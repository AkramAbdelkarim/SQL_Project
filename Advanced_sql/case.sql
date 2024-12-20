SELECT job_title_short,
    job_location
FROM job_postings_fact;
/*
 We want to label a new column as follows:
 'New York, NY' as 'Local'
 'Anywhere' as remote
 other locations as 'on-site'
 */
SELECT job_title_short,
    job_location,
    CASE
        WHEN job_location = 'New York, NY' THEN 'Local'
        WHEN job_location = 'Anywhere' THEN 'Remote'
        ELSE 'On Site'
    END AS location_category
FROM job_postings_fact;
--Number of jobs per location category
SELECT COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'New York, NY' THEN 'Local'
        WHEN job_location = 'Anywhere' THEN 'Remote'
        ELSE 'On Site'
    END AS location_category
FROM job_postings_fact
GROUP BY location_category;
-- Narrowing down further to only look for 'Data Analyst' jobs in these location categories
SELECT COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'New York, NY' THEN 'Local'
        WHEN job_location = 'Anywhere' THEN 'Remote'
        ELSE 'On Site'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category
ORDER BY number_of_jobs DESC;