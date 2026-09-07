-- Session #1
-- Обновила рейтинг для "Pizza Hut" до 5 баллов в режиме транзакции
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

-- Проверила, что вижу изменения в session №1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
-- Проверила, что не вижу изменения в session №2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #1
-- Сделала коммит
COMMIT;

-- Session #2
-- Проверила, что вижу изменения в session №2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';