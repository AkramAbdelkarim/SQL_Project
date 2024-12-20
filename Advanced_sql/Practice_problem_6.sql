/*
 Create tables from other tables
 Question:
 - Create three tables 
 - Jan 2023 jobs
 - Feb 2023 jobs
 - Mar 2023 jobs
 */
-- 1. Creating a table for Jan 2023 jobs
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 1;
-- 2. Creating a table for Feb 2023 jobs
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 2;
-- 3. Creating a table for Mar 2023 jobs
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 3;
SELECT job_posted_date
from january_jobs;