SET ENABLE_SEQSCAN TO ON;
EXPLAIN ANALYZE
SELECT
    menu.pizza_name AS pizza_name, menu.price AS price,
    MAX(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
    AS pizzeria_rating
FROM  menu
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1;

CREATE INDEX idx_1 ON pizzeria (rating);

SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE
SELECT
    menu.pizza_name AS pizza_name, menu.price AS price,
    MAX(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
    AS pizzeria_rating
FROM  menu
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id AND rating = 4.9
ORDER BY 1;

DROP INDEX idx_1;