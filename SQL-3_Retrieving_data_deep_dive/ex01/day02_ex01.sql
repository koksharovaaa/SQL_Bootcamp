SELECT dates::date AS missing_date 
FROM GENERATE_SERIES('2022-01-01'::timestamp, '2022-01-10', '1 day')
AS dates
LEFT JOIN person_visits
ON dates::date = person_visits.visit_date
AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE person_visits.visit_date is NULL
ORDER BY missing_date ASC;