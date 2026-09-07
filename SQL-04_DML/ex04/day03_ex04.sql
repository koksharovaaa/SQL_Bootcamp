WITH women_count AS (
    SELECT pizzeria_id,
    COUNT(*) AS women_order FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    JOIN person ON person.id = person_order.person_id
    WHERE person.gender = 'female'
    GROUP BY pizzeria_id
),

men_count AS (
    SELECT pizzeria_id,
    COUNT(*) AS men_order FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    JOIN person ON person.id = person_order.person_id
    WHERE person.gender = 'male'
    GROUP BY pizzeria_id
)

SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN women_count
ON pizzeria.id = women_count.pizzeria_id
LEFT JOIN men_count
ON pizzeria.id = men_count.pizzeria_id
WHERE women_count.women_order > 0
AND men_count.men_order IS NULL

UNION

SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN men_count
ON pizzeria.id = men_count.pizzeria_id
LEFT JOIN women_count
ON pizzeria.id = women_count.pizzeria_id
WHERE men_count.men_order > 0
AND women_count.women_order IS NULL

ORDER BY pizzeria_name;
