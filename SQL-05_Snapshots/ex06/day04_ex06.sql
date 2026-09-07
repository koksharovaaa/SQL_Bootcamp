DROP MATERIALIZED VIEW IF EXISTS mv_dmitriy_visits_and_eats;

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name
FROM person_visits
JOIN person ON person.id = person_visits.person_id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE menu.price < 800 AND person.name = 'Dmitriy'
and person_visits.visit_date = '2022-01-08';

SELECT * FROM mv_dmitriy_visits_and_eats;