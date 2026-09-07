SELECT pizzeria.name
AS pizzeria_name FROM person_visits
JOIN person ON person.id = person_visits.person_id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
WHERE person.name = 'Andrey'
AND pizzeria.id NOT IN (
    SELECT menu.pizzeria_id FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id
    WHERE person.name = 'Andrey')
ORDER BY pizzeria_name ASC;