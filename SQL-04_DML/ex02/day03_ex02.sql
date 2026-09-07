WITH not_ordered AS (
    SELECT id FROM menu
    WHERE NOT EXISTS (
        SELECT 1 FROM person_order
    WHERE menu.id = person_order.menu_id)
    ORDER BY id
)

SELECT menu.pizza_name AS pizza_name, menu.price,
pizzeria.name AS pizzeria_name
FROM not_ordered
JOIN menu ON menu.id = not_ordered.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY pizza_name, menu.price, pizzeria_name;