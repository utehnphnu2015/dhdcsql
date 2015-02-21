set @start='2014-04-01';
set @end='2015-03-31'; 

select temp.hoscode,temp.hosname,temp.target as 'จำนวนหญิงตั้งครรภ์',temp.hv as 'sPb'9yh'หญิงตั้งครรภ์ที่ได้รับการเยี่ยม',round((temp.hv*100/temp.target),2) as 'ร้อยละ' from (select h.hoscode,h.hosname,
(SELECT
count(distinct p.CID)
FROM
anc as a,
person as p
where p.PID=a.PID and p.HOSPCODE=a.HOSPCODE
and a.DATE_SERV between @start and @end
and p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') and p.HOSPCODE=h.hoscode) as 'target',
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
and comserv.COMSERVICE like '1A20%'
group by p.CID) as hhv where hhv.HOSPCODE=h.hoscode) as 'hv'
from chospital h 
where h.provcode='41' and h.distcode='06' and h.hostype in ('03','07')) as temp