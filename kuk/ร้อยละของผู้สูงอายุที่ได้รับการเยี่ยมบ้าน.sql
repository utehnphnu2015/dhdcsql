set @bdg_date = '2014-09-30';
set @start='2014-04-01';
set @end='2015-03-31';

select temp.hoscode,temp.hosname,temp.target,temp.hv,round((temp.hv*100/temp.target),2) as percent from (select h.hoscode,h.hosname,
(SELECT
count(distinct p.CID)
FROM
person as p
where  p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') and p.HOSPCODE=h.hoscode and (TIMESTAMPDIFF(YEAR,p.birth,@bdg_date)>= 60)) as target,
(select count(distinct hhv.CID) as num from 
(SELECT
comserv.HOSPCODE,
comserv.PID,
comserv.SEQ,
comserv.DATE_SERV,
comserv.COMSERVICE,
p.CID
FROM
community_service as comserv
,person as p
where p.PID=comserv.PID and p.HOSPCODE=comserv.HOSPCODE
and comserv.DATE_SERV between @start and @end 
and comserv.COMSERVICE like "1A4%" and (TIMESTAMPDIFF(YEAR,p.birth,@bdg_date)>= 60)
group by p.CID) as hhv where hhv.HOSPCODE=h.hoscode) as hv
from chospital h 
where h.provcode='41' and h.distcode='06' and h.hostype in ('03','07')) as temp
