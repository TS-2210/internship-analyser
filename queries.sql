INSERT INTO Skill(skill_name)
SELECT DISTINCT TRIM(skill)
FROM(
SELECT
UNNEST(
STRING_TO_ARRAY(job_skills,',')
) skill
FROM RawJobs
WHERE job_skills IS NOT NULL
) skills
ON CONFLICT(skill_name)
DO NOTHING;

INSERT INTO JobSkill(job_id,skill_id)
SELECT
j.job_id,
s.skill_id
FROM RawJobs r
JOIN Company c
ON r.company=c.name
JOIN Job j
ON j.company_id=c.company_id
AND j.title=r.job_title
JOIN LATERAL
UNNEST(
STRING_TO_ARRAY(r.job_skills,',')
)
split(skill)
ON TRUE
JOIN Skill s
ON s.skill_name=TRIM(split.skill);

CREATE INDEX idx_company
ON Company(name);

CREATE INDEX idx_title
ON Job(title);

CREATE INDEX idx_skill
ON Skill(skill_name);