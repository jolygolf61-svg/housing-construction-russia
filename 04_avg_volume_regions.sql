select 
	v.регион,
	round (avg (v.объем_млн_кв_м),2) as AVG_Volume,
	round (min (v.объем_млн_кв_м),2) as Min_Volume,
	round (max (v.объем_млн_кв_м),2) as Max_Volume
from volume v 
where v.год between 2020 and 2024
	AND v.уровень = 'регион'
group by v.регион
order by AVG_Volume desc
limit 15