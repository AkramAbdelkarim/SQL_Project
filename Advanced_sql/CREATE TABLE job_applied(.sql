CREATE TABLE job_applied(
    joh_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);
-- Returns no data avaiable since our table is still empty
SELECT *
FROM job_applied;