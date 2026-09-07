INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits),
(SELECT id FROM person WHERE name = 'Dmitriy'),
(SELECT DISTINCT pizzeria_id FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE price < 800 and pizzeria.name != 'Papa Johns' LIMIT 1),
'2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT * FROM mv_dmitriy_visits_and_eats;