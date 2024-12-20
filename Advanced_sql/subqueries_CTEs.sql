-- We can use subqueries to select only january jobs like we did when created a jan jobs table
SELECT *
FROM (
        -- subquery starts here
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(
                MONTH
                FROM job_posted_date
            ) = 1
    ) AS januray_jobs;
-- subquery ends here
-- CTEs
WITH januray_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(
            MONTH
            FROM job_posted_date
        ) = 1
)
SELECT *
FROM januray_jobs;
-- More complex queries
-- 1. SUBQUERIES
-- We are interested about companies  that require no degree
SELECT company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
        SELECT company_id
        FROM job_postings_fact
        WHERE job_no_degree_mention = TRUE
    );
-- 2. CTEs
-- Find companies with most job opennings
WITH company_job_count AS (
    -- CTE starts here
    SELECT company_id,
        COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT company_dim.name,
    company_job_count.total_jobs
FROM company_dim
    LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC;