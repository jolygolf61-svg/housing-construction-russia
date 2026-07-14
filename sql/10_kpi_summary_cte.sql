WITH cte_apartments AS (
    SELECT 
        регион, 
        количество_квартир AS apartments_count
    FROM apartments
    WHERE уровень = 'федеральный_округ' 
      AND год = 2024
),
cte_volume AS (
    SELECT 
        регион, 
        объем_млн_кв_м AS volume_total
    FROM volume
    WHERE уровень = 'федеральный_округ' 
      AND год = 2024
),
cte_rf_total AS (
    SELECT 
        объем_млн_кв_м AS rf_volume_total
    FROM volume
    WHERE уровень = 'страна' 
      AND регион = 'Российская Федерация'
      AND год = 2024
)
SELECT 
    c1.регион AS "Округ",
    c1.apartments_count AS "Квартиры",
    c2.volume_total AS "Объём",
    ROUND((c2.volume_total::NUMERIC / NULLIF(c3.rf_volume_total, 0)) * 100, 2) AS "Доля от РФ, %"
FROM cte_apartments c1
JOIN cte_volume c2 
    ON c1.регион = c2.регион
CROSS JOIN cte_rf_total c3 
ORDER BY c2.volume_total DESC;
