set @start = '2014-10-01';
set @end = '2014-12-31';
set @pcu = '11255';

select d.PROCEDCODE,i.desc_r as oper,count(distinct d.pid) as person,count(DISTINCT d.seq) as visit
from procedure_opd d,cicd9ttm_planthai i
where d.PROCEDCODE=i.`code` and d.DATE_SERV 
and d.HOSPCODE=@pcu 
group by d.PROCEDCODE
order by visit DESC
limit 10
