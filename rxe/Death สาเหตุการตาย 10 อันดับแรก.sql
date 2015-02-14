SET @start_d:='2013-10-01';
SET @end_d:='2014-09-30';

select d.cdeath as ICD10TM,icd.diagtname,count(pn.pid) as N
from death d left join (
	select * from person where typearea in ('1','3') group by cid 
) pn on d.hospcode=pn.hospcode and d.pid=pn.pid 
left JOIN cicd10tm icd on icd.diagcode = d.cdeath
where d.ddeath BETWEEN @start_d and @end_d
group by ICD10TM
order by N desc
limit 10
#เฉพาะคนที่อยู่ในพื้นที่จริงๆ 1 กับ 3
