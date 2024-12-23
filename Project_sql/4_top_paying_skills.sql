/*
 Question: What are the top skills based on salary?
 - Look at the average salary associated with each skill for Data Analyst positions. 
 - Focuses on roles with specific salaries, regarless of location.
 - Why? It reveals how different skills impact salary levels for Data Analysts and helps
 identify the most financially rewarding skills to acquire or improve.
 */
-- we will start with our last query for this 
SELECT skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL -- we need roles with specified salaries only
    AND job_work_from_home = True
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25
    /*
     Insights and Trends for Top 25 Paying Skills in Data Analyst Jobs:
     Emerging Skills:
     
     PySpark leads the list with an average salary of $208,172.25. This reflects a high demand for expertise in big data processing and distributed computing.
     Bitbucket ($189,154.50) and GitLab ($154,500.00) are notable, highlighting the importance of version control and collaboration tools.
     AI & ML Integration:
     
     Tools like DataRobot ($155,485.50) and Watson ($160,515.00) show the growing integration of AI and machine learning in data analytics.
     Scikit-learn ($125,781.25) and Jupyter ($152,776.50) emphasize the need for practical ML knowledge and interactive computing environments.
     Programming Languages:
     
     Swift ($153,750.00), Golang ($145,000.00), and Scala ($124,903.00) indicate the increasing relevance of programming for specialized or high-performance applications.
     Data Tools & Libraries:
     
     Popular Python libraries like Pandas ($151,821.33) and NumPy ($143,512.50) remain critical for numerical computation and data manipulation.
     Databricks ($141,906.60) and PostgreSQL ($123,878.75) show a preference for advanced platforms for big data and database management.
     Cloud and DevOps:
     
     Kubernetes ($132,500.00), Jenkins ($125,436.33), and Airflow ($126,103.00) highlight the increasing demand for automation and container orchestration skills.
     GCP (Google Cloud Platform) ($122,500.00) reinforces the trend toward cloud expertise.
     Visualization and Reporting:
     
     Tools like MicroStrategy ($121,619.25) indicate the need for expertise in business intelligence and reporting tools.
     Collaboration & Productivity:
     
     Notion ($125,000.00) and Atlassian ($131,161.80) underscore the value of tools that improve team collaboration and project management.
     
     Trends Summary:
     High-paying Data Analyst roles are favoring professionals with expertise in:
     
     -Big data and distributed computing tools.
     - AI/ML platforms and libraries.
     - Advanced programming and DevOps tools.
     - Cloud and database management systems.
     - Business intelligence and team collaboration solutions.
     
     See JSON result below:
     [
     {
     "skills": "pyspark",
     "average_salary": "208172.25"
     },
     {
     "skills": "bitbucket",
     "average_salary": "189154.50"
     },
     {
     "skills": "couchbase",
     "average_salary": "160515.00"
     },
     {
     "skills": "watson",
     "average_salary": "160515.00"
     },
     {
     "skills": "datarobot",
     "average_salary": "155485.50"
     },
     {
     "skills": "gitlab",
     "average_salary": "154500.00"
     },
     {
     "skills": "swift",
     "average_salary": "153750.00"
     },
     {
     "skills": "jupyter",
     "average_salary": "152776.50"
     },
     {
     "skills": "pandas",
     "average_salary": "151821.33"
     },
     {
     "skills": "elasticsearch",
     "average_salary": "145000.00"
     },
     {
     "skills": "golang",
     "average_salary": "145000.00"
     },
     {
     "skills": "numpy",
     "average_salary": "143512.50"
     },
     {
     "skills": "databricks",
     "average_salary": "141906.60"
     },
     {
     "skills": "linux",
     "average_salary": "136507.50"
     },
     {
     "skills": "kubernetes",
     "average_salary": "132500.00"
     },
     {
     "skills": "atlassian",
     "average_salary": "131161.80"
     },
     {
     "skills": "twilio",
     "average_salary": "127000.00"
     },
     {
     "skills": "airflow",
     "average_salary": "126103.00"
     },
     {
     "skills": "scikit-learn",
     "average_salary": "125781.25"
     },
     {
     "skills": "jenkins",
     "average_salary": "125436.33"
     },
     {
     "skills": "notion",
     "average_salary": "125000.00"
     },
     {
     "skills": "scala",
     "average_salary": "124903.00"
     },
     {
     "skills": "postgresql",
     "average_salary": "123878.75"
     },
     {
     "skills": "gcp",
     "average_salary": "122500.00"
     },
     {
     "skills": "microstrategy",
     "average_salary": "121619.25"
     }
     ]
     */