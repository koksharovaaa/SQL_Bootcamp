CREATE TABLE IF NOT EXISTS nodes (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INT NOT NULL
);

INSERT INTO nodes(point1, point2, cost)
VALUES
  ('a', 'b', 10),
  ('b', 'a', 10),
  ('a', 'c', 15),
  ('c', 'a', 15),
  ('a', 'd', 20),
  ('d', 'a', 20),
  ('b', 'd', 25),
  ('d', 'b', 25),
  ('d', 'c', 30),
  ('c', 'd', 30),
  ('b', 'c', 35),
  ('c', 'b', 35);

WITH RECURSIVE tours AS (
    SELECT
        ARRAY[point1, point2] AS path,
        cost
    FROM nodes
    WHERE point1 = 'a'
    UNION ALL
    SELECT
        t.path || n.point2,
        t.cost + n.cost
    FROM tours t
    JOIN nodes n ON t.path[array_upper(path, 1)] = n.point1
    WHERE n.point2 <> ALL(t.path)
),

finished AS (
    SELECT
        t.cost + n.cost AS total_cost,
        t.path || ARRAY['a'] AS tour
    FROM tours t
    JOIN nodes n ON t.path[array_upper(path, 1)] = n.point1
    WHERE array_length(t.path, 1) = 4
    AND n.point2 = 'a'
)

SELECT total_cost, tour
FROM finished
WHERE total_cost = (SELECT MIN(total_cost) FROM finished)
ORDER BY total_cost, tour;

-- psql -U annes -d team0 -f team00_ex00_2.sql