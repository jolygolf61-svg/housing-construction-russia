SELECT 
    a.год, 
    sum(a.количество_квартир) AS всего_строк_квартир, 
    v.объем_млн_кв_м 
FROM 
    apartments as a
JOIN 
    volume as v ON v.регион = a.регион AND v.год = a.год 
WHERE 
    a.уровень = 'страна'
GROUP BY 
    a.год, 
    v.объем_млн_кв_м;
