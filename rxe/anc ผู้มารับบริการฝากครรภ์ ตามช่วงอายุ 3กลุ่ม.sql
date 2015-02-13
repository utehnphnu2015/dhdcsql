SET @start_d:='2014-10-01';
SET @end_d:='2015-09-30';

select distcode,hospcode,hosname, 
sum(if(age between 0 and 14,1,0)) 'female_less_14', sum(if(age between 15 and 19,1,0)) 'female15_19',
sum(if(age between 20 and 60,1,0)) 'female_more20' 
from (
select distcode,h.hosname,anc.*,TIMESTAMPDIFF(year,birth,DATE_SERV) age from anc inner join (
	select * from person where typearea in ('1','3') and discharge='9' group by cid 
) pn on anc.hospcode=pn.hospcode and anc.pid=pn.pid 
left join chospital h on anc.hospcode=h.hoscode 
where left(DATE_SERV,10) between @start_d and @end_d group by cid
) preg
group by distcode,hospcode,hosname