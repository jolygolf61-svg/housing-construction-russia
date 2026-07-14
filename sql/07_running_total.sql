SELECT
    год,
    количество_квартир,
    SUM(количество_квартир) OVER (
        ORDER BY год
    ) AS накопительно
FROM apartments
WHERE уровень = 'страна'
ORDER BY год;
