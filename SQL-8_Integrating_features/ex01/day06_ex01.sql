-- DROP TABLE person_discounts;

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
    ROW_NUMBER() OVER() as id,
    person_id,
    pizzeria_id,
    case when order_count = 1 then 10.5
         when order_count = 2 then 22
         else 30
    end discount
FROM (SELECT person_order.person_id,
    menu.pizzeria_id,
    COUNT(person_order.person_id) as order_count
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    GROUP BY person_id, pizzeria_id);

SELECT * FROM person_discounts;