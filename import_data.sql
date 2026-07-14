INSERT INTO Company(name)
SELECT DISTINCT company
FROM RawJobs
WHERE company IS NOT NULL
ON CONFLICT(name)
DO NOTHING;
INSERT INTO Job(
title,
location,
link,
first_seen,
city,
country,
level,
type,
summary,
company_id
)

SELECT
r.job_title,
r.job_location,
r.job_link,
TO_DATE(r.first_seen,'YYYY-MM-DD'),
r.search_city,
r.search_country,
r.job_level,
r.job_type,
r.job_summary,
c.company_id
FROM RawJobs r
JOIN Company c
ON r.company=c.name;