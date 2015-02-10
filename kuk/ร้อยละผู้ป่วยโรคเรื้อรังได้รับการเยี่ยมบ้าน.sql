set @start='2014-04-01';
set @end='2015-03-31'; 

select h.hoscode,h.hosname,
(select COUNT(DISTINCT p_target.cid) from 
(SELECT
p.cid,p.HOSPCODE
FROM
chronic as c
join person as p on p.PID=c.PID and p.HOSPCODE=c.HOSPCODE
and c.TYPEDISCH="03"
GROUP BY p.CID) as p_target
where p_target.HOSPCODE=h.hoscode
GROUP BY p_target.HOSPCODE) as target,
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
and comserv.COMSERVICE like "1A%"
group by p.CID) as hhv where hhv.HOSPCODE=h.hoscode) as commserv_num
from chospital h 
where h.provcode='41' and h.distcode='06' and h.hostype in ('03','07')
