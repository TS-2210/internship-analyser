SELECT
s.skill_name,
COUNT(*) frequency
FROM Skill s
JOIN JobSkill js
ON s.skill_id=js.skill_id
GROUP BY s.skill_name
ORDER BY frequency DESC
LIMIT 10;

SELECT c.name,
COUNT(*) jobs
FROM Company c
JOIN Job j
ON c.company_id=j.company_id
GROUP BY c.name
ORDER BY jobs DESC;