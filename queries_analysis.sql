SELECT s.skill_name, COUNT(*) frequency
FROM Job j
JOIN JobSkill js
ON j.job_id=js.job_id
JOIN Skill s
ON js.skill_id=s.skill_id
GROUP BY s.skill_name
ORDER BY frequency DESC
LIMIT 10;