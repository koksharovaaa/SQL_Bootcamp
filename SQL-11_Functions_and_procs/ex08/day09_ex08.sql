DROP FUNCTION IF EXISTS fnc_fibonacci;

CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
    RETURNS TABLE (fibonacci bigint) AS $$
WITH RECURSIVE fib(a,b) AS (
	SELECT 0 AS a, 1 as b
	UNION ALL
	SELECT b, a + b
	FROM fib
	WHERE b < pstop)
SELECT a FROM fib;
$$ LANGUAGE SQL;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
SELECT * FROM fnc_fibonacci(20);