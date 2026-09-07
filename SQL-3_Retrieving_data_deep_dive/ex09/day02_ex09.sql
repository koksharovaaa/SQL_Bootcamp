SELECT name FROM person
WHERE gender = 'female'
AND id IN (
    SELECT person_id FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    WHERE menu.pizza_name LIKE '%pepperoni%'
    INTERSECT
    SELECT person_id FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    WHERE menu.pizza_name LIKE '%cheese%'
)
ORDER BY name ASC;