INSERT INTO job_applied (
        joh_id,
        application_sent_date,
        custom_resume,
        resume_file_name,
        cover_letter_sent,
        cover_letter_file_name,
        status
    )
VALUES (
        4,
        '2024-02-03',
        true,
        'resume_03.pdf',
        true,
        'cover_letter_03.pdf',
        'sumbitted'
    ),
    (
        4,
        '2024-02-04',
        true,
        'resume_04.pdf',
        false,
        NULL,
        'qualified'
    );
SELECT *
from job_applied;
ALTER TABLE job_applied
    RENAME COLUMN joh_id TO job_id;
-- ADDING a column of contact info for companies we are applying to
ALTER TABLE job_applied
ADD contact VARCHAR(50);
-- Updating data in the 'contact' column
UPDATE job_applied
SET contact = 'Erlich Bachman'
where job_id = 1;
UPDATE job_applied
SET contact = 'Dinesh Ghugtai'
where job_id = 2;
UPDATE job_applied
SET contact = 'Bertram Gilfoyle'
where job_id = 3;
UPDATE job_applied
SET contact = 'Jian Yang'
where job_id = 4;
UPDATE job_applied
SET contact = 'Big Head'
where job_id = 5;
SELECT *
FROM job_applied;
-- Renaming column conact to contac_name 
ALTER TABLE job_applied
    RENAME COLUMN contact TO contact_name;
-- chaning column contact name dataype VARCHAR() -> TEXT
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;
SELECT *
FROM job_applied;
-- Deleting a column from our table 
ALTER TABLE job_applied DROP COLUMN contact_name;
-- Deleting tables 
DROP TABLE job_applied;