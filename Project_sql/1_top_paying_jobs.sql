/*
 Question: What are the top paying Data Analyst jobs?
 - Identify the top 10 highest-paying Data Analyst roles that are available remotely.
 - Focus on job postings with specified salaries (remove nulls).
 - Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment benefits for roles in the market.  
 */
SELECT job_id,
    job_title,
    company_dim.name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM job_postings_fact -- To actually know which companies these roles are coreponding we need to do a LEFT JOIN with the company_dim table
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND -- LOOKING FOR REMOTE DATA ANALYST ROLES ONLY
    salary_year_avg IS NOT NULL -- REMOVING NULL SALARY VALUES
ORDER BY salary_year_avg DESC
LIMIT 10;
/*
 We can tailor this query to our to look for different roles (e.g Data Engineer, Data Scientist) 
 and specifiy differetn job locations (Dallas, TX for example)
 */