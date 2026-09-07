WITH dates AS (
    SELECT missing_dates::date AS missing_date
    FROM GENERATE_SERIES('2022-01-01'::timestamp, '2022-01-10', '1 day')
    AS missing_dates
)

SELECT missing_date
FROM dates
LEFT JOIN person_visits
ON dates.missing_date = person_visits.visit_date
AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE person_visits.visit_date is NULL
ORDER BY missing_date ASC;