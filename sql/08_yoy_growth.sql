SELECT
    год,
    объем_млн_кв_м,
    LAG(объем_млн_кв_м) OVER (ORDER BY год) AS предыдущий_год,
    ROUND(
        (объем_млн_кв_м - LAG(объем_млн_кв_м) OVER (ORDER BY год)) 
        / LAG(объем_млн_кв_м) OVER (ORDER BY год) * 100, 
        1
    ) AS изменение_pct
FROM volume
WHERE уровень = 'страна'
ORDER BY год;
