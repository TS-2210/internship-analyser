CREATE TABLE Company(
    company_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE Job(
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
CREATE TABLE Skill(
    skill_id SERIAL PRIMARY KEY,
    skill_name VARCHAR(100)
);
CREATE TABLE JobSkill(
    job_id INT REFERENCES Job(job_id),
    skill_id INT REFERENCES Skill(skill_id),
    PRIMARY KEY(job_id,skill_id)
);