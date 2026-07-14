DROP TABLE IF EXISTS JobSkill CASCADE;
DROP TABLE IF EXISTS Skill CASCADE;
DROP TABLE IF EXISTS Job CASCADE;
DROP TABLE IF EXISTS Company CASCADE;
DROP TABLE IF EXISTS RawJobs CASCADE;

CREATE TABLE Company(
    company_id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE Job(
    job_id SERIAL PRIMARY KEY,
    title TEXT,
    location TEXT,
    link TEXT,
    first_seen DATE,
    city TEXT,
    country TEXT,
    level TEXT,
    type TEXT,
    summary TEXT,
    company_id INT REFERENCES Company(company_id)
);

CREATE TABLE Skill(
    skill_id SERIAL PRIMARY KEY,
    skill_name TEXT UNIQUE
);

CREATE TABLE JobSkill(
    job_id INT REFERENCES Job(job_id),
    skill_id INT REFERENCES Skill(skill_id),
    PRIMARY KEY(job_id,skill_id)
);

CREATE TABLE RawJobs(
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