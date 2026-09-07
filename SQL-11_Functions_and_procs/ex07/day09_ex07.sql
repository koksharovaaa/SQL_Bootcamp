CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS $$
    SELECT min(val)
    FROM unnest(arr) AS val
    WHERE val IS NOT NULL;
$$ LANGUAGE SQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);