select *
from apartments a
where a.год = 2024 and a.уровень  = 'федеральный_округ'
ORDER BY a.количество_квартир DESC
