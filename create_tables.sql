TRUNCATE TABLE JobSkill, Job, Company
RESTART IDENTITY CASCADE;
CREATE TABLE IF NOT EXISTS Company(
    company_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS Job(
    job_id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    location VARCHAR(200),
    link TEXT,
    first_seen DATE,
    city VARCHAR(100),
    country VARCHAR(100),
    level VARCHAR(100),
    type VARCHAR(100),
    summary TEXT,
    company_id INT REFERENCES Company(company_id)
);
CREATE TABLE IF NOT EXISTS Skill(
    skill_id SERIAL PRIMARY KEY,
    skill_name VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS JobSkill(
    job_id INT REFERENCES Job(job_id),
    skill_id INT REFERENCES Skill(skill_id),
    PRIMARY KEY(job_id,skill_id)
);

CREATE TABLE IF NOT EXISTS RawJobs(
    job_title TEXT,
    company TEXT,
    job_location TEXT,
    job_link TEXT,
    first_seen TEXT,
    search_city TEXT,
    search_country TEXT,
    job_level TEXT,
    job_type TEXT,
    job_summary TEXT,
    job_skills TEXT
);
SELECT *
FROM rawjobs
LIMIT 5; 
INSERT INTO Company(name)
SELECT DISTINCT company
FROM rawjobs
WHERE company IS NOT NULL;

/*SELECT *
FROM Company
LIMIT 5; testing*/

INSERT INTO Job(title,location,link,first_seen, city,country,level,type,summary,company_id)
SELECT r.job_title, r.job_location, r.job_link,  TO_DATE(r.first_seen,'YYYY-MM-DD'), r.search_city, r.search_country, r.job_level, r.job_type, r.job_summary, c.company_id
FROM rawjobs r
JOIN company c ON r.company = c.name;

/*SELECT *
FROM Job
LIMIT 5; testing*/