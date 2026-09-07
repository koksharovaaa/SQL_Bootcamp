WITH women_count AS (
    SELECT pizzeria_id,
    COUNT(*) AS women_visits
    FROM person_visits
    JOIN person
    ON person.id = person_visits.person_id
    WHERE person.gender = 'female'
    GROUP BY pizzeria_id
),

men_count AS (
    SELECT pizzeria_id,
    COUNT(*) AS men_visits
    FROM person_visits
    JOIN person
    ON person.id = person_visits.person_id
    WHERE person.gender = 'male'
    GROUP BY pizzeria_id
)

SELECT pizzeria.name
AS pizzeria_name
FROM pizzeria
JOIN women_count
ON pizzeria.id = women_count.pizzeria_id
LEFT JOIN men_count
ON pizzeria.id = men_count.pizzeria_id
WHERE women_count.women_visits > COALESCE(men_count.men_visits, 0)

UNION

SELECT pizzeria.name
AS pizzeria_name
FROM pizzeria
JOIN men_count
ON pizzeria.id = men_count.pizzeria_id
LEFT JOIN women_count
ON pizzeria.id = women_count.pizzeria_id
WHERE men_count.men_visits > COALESCE(women_count.women_visits, 0)

ORDER BY pizzeria_name;
