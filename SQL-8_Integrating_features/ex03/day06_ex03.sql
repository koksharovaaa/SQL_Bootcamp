-- DROP INDEX idx_person_discounts_unique;

CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);

SELECT * FROM person_discounts
WHERE person_id = 2 AND pizzeria_id = 2;

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT * FROM person_discounts
WHERE person_id = 2 AND pizzeria_id = 2;