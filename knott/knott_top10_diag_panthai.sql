set @start = '2014-10-01';
set @end = '2014-12-31';
set @pcu = '11255';

select i.diseasethai as โรค,count(distinct d.pid) as คน,count(DISTINCT d.seq) as ครั้ง
from diagnosis_opd d,cdisease i
where d.DIAGCODE=i.diagcode and d.DATE_SERV between @start and @end and d.HOSPCODE=@pcu 
and d.DIAGCODE LIKE 'u%'
group by d.DIAGCODE
order by ครั้ง DESC
limit 10
#ทดสอยแก้ไข
