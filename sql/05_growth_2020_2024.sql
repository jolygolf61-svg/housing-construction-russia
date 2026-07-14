SELECT
    t1.регион,
    t1.количество_квартир  AS кварт_2020,
    t2.количество_квартир  AS кварт_2024,
    t2.количество_квартир - t1.количество_квартир AS прирост
FROM apartments t1
JOIN apartments t2 ON t1.регион = t2.регион
WHERE t1.год = 2020
  AND t2.год = 2024
  AND t1.уровень = 'регион'
ORDER BY прирост DESC
LIMIT 10;
