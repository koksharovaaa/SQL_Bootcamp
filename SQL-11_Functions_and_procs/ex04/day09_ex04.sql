CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
) AS $$
    SELECT p.id, p.name, p.age, p.gender, p.address 
    FROM person p 
    WHERE p.gender = 'male';
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
) AS $$
    SELECT p.id, p.name, p.age, p.gender, p.address 
    FROM person p 
    WHERE p.gender = 'female';
$$ LANGUAGE SQL;

SELECT * FROM fnc_persons_male();

SELECT * FROM fnc_persons_female();