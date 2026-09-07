SELECT name FROM person 
WHERE EXISTS 
    (SELECT 1 FROM person_order WHERE (menu_id = 13
    OR menu_id = 14 OR menu_id = 18)
    AND person_order.order_date = '2022-01-07'
    AND person_order.person_id = person.id);