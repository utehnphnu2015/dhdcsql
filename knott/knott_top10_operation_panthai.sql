set @start = '2014-10-01';
set @end = '2014-12-31';
set @pcu = '11255';

select d.PROCEDCODE,i.desc_r as หัตถการ,count(distinct d.pid) as คน,count(DISTINCT d.seq) as ครั้ง
from procedure_opd d,cicd9ttm_planthai i
where d.PROCEDCODE=i.`code` and d.DATE_SERV between @start and @end 
and d.HOSPCODE=@pcu 
group by d.PROCEDCODE
order by ครั้ง DESC
limit 10
