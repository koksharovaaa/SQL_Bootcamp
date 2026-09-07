WITH b AS (
    SELECT balance.user_id, balance.type,
    balance.currency_id, SUM(balance.money)::numeric AS volume
    FROM balance
    GROUP BY balance.user_id, balance.type, balance.currency_id),

c AS (
    SELECT currency.id, currency.name, currency.rate_to_usd
    FROM currency
    JOIN (SELECT id, MAX(updated) AS updated
        FROM currency GROUP BY id) tmp
        ON currency.id = tmp.id
        AND currency.updated = tmp.updated),

final AS (
    SELECT
        COALESCE(u.name, 'not defined') AS name,
        COALESCE(u.lastname, 'not defined') AS lastname,
        b.type,
        b.volume,
        COALESCE(c.name, 'not defined') AS currency_name,
        COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
        b.volume * COALESCE(c.rate_to_usd, 1) AS total_volume_in_usd
    FROM b
    LEFT JOIN "user" u ON u.id = b.user_id
    LEFT JOIN c ON c.id = b.currency_id)

SELECT *
FROM final
ORDER BY name DESC, lastname, type;