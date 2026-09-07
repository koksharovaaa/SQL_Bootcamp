-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
    b.money *
    COALESCE(
        (SELECT rate_to_usd
        FROM currency c
        WHERE c.id = b.currency_id
        AND c.updated <= b.updated
        ORDER BY c.updated DESC
        LIMIT 1),
        (SELECT rate_to_usd
        FROM currency c
        WHERE c.id = b.currency_id
        AND c.updated > b.updated
        ORDER BY c.updated ASC
        LIMIT 1)
    ) AS currency_in_usd

FROM balance b
INNER JOIN (
    SELECT DISTINCT id, name
    FROM currency GROUP BY id, name
) c
ON c.id = b.currency_id

LEFT JOIN "user" u
    ON u.id = b.user_id

ORDER BY name DESC, lastname, currency_name ASC;