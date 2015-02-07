set @start_d='2014-10-01';
set @end_d='2015-03-31';

select left(@end_d,4) as year,date_format(birth,'%Y%m') as month,hospcode,count(*) as target,sum(if(food='1',1,0)) as result 
from (
SELECT n.HOSPCODE,n.PID,p.BIRTH,n.DATE_SERV,n.FOOD,DATE_FORMAT(n.DATE_SERV,'%m') m
FROM nutrition n INNER JOIN person p ON n.HOSPCODE=p.HOSPCODE AND n.PID=p.PID 
WHERE n.DATE_SERV BETWEEN @start_d AND @end_d AND n.FOOD in('0','1','2','3','4')
GROUP BY n.HOSPCODE,n.PID
HAVING TIMESTAMPDIFF(MONTH,p.BIRTH,n.DATE_SERV) BETWEEN 0 AND 5 
ORDER BY n.DATE_SERV DESC ) tb1 group by year,month,hospcode