CREATE TABLE Company(
    company_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    industry VARCHAR(100),
    location VARCHAR(100)
);
CREATE TABLE Job(
    job_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    salary INT,
    date_posted DATE,
    company_id INT REFERENCES Company(company_id)
);
CREATE TABLE Skill(
    skill_id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE JobSkill(
    job_id INT REFERENCES Job(job_id),
    skill_id INT REFERENCES Skill(skill_id),
    PRIMARY KEY(job_id,skill_id)
);