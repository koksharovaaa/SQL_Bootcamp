SELECT visits.name AS name,
coalesce(visits.count, 0) + coalesce(orders.count, 0) AS total_count
FROM (SELECT p.name, count(*) AS "count"
  FROM person_visits
  INNER JOIN pizzeria p ON p.id = person_visits.pizzeria_id
  GROUP BY p.name) AS visits
FULL JOIN (SELECT p.name, count(*) AS "count"
  FROM person_order
  INNER JOIN menu m ON person_order.menu_id = m.id
  INNER JOIN pizzeria p ON m.pizzeria_id = p.id
  GROUP BY p.name) AS orders
ON visits.name = orders.name
ORDER BY total_count DESC, name ASC;

