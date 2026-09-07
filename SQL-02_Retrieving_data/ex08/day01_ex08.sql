SELECT order_date,
CONCAT(name, ' (age:', age, ')')
AS person_information
FROM person_order
NATURAL JOIN (SELECT person.id
AS person_id, person.name, person.age FROM person)
ORDER BY order_date, person_information ASC;