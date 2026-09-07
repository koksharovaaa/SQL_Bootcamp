SELECT person.name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu on person_order.menu_id = menu.id
WHERE (menu.pizza_name LIKE '%pepperoni%'
OR menu.pizza_name LIKE '%mushroom%') AND
(person.address = 'Moscow'
OR person.address = 'Samara')
AND person.gender = 'male'
ORDER BY person.name DESC;