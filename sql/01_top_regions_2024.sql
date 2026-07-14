SELECT
    регион,
    SUM(количество_квартир)
FROM apartments
WHERE уровень = 'регион'
  AND год = 2024
GROUP BY регион
ORDER BY SUM(количество_квартир) DESC
LIMIT 10;
