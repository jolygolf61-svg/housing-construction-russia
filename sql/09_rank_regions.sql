SELECT
    регион,
    объем_млн_кв_м,
    RANK() OVER (
        ORDER BY объем_млн_кв_м DESC
    ) AS ранг
FROM volume
WHERE уровень = 'регион' and год = 2024
ORDER BY объем_млн_кв_м DESC;
