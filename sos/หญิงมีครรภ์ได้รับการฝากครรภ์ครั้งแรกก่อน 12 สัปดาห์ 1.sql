set @start='2014-10-01';
set @end='2014-12-31';

select h.distcode as amphur,h.hoscode as hospcode ,concat(provcode,distcode,subdistcode,mu) as areacode,h.hosname as hospname,
(select count(distinct CID) as num 
from 
(select
p.HOSPCODE,p.CID,p.PID,p.PRENAME,p.NAME,p.LNAME,
pn.LMP,a.DATE_SERV,
(select ga_date 
from 
(select
a.HOSPCODE,
a.PID,
a.DATE_SERV,
a.ANCNO,
a.GA,
pn.LMP,
datediff(a.DATE_SERV,pn.LMP) as ga_date
from
anc as a,
prenatal as pn
where a.HOSPCODE = pn.HOSPCODE 
and a.PID = pn.PID) as a2
where a2.ga_date between '7' and '84' and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no1
from
prenatal as pn
,anc as a
,person as p 
where  pn.PID = p.PID and p.HOSPCODE = pn.HOSPCODE
and pn.PID = a.PID and pn.HOSPCODE = a.HOSPCODE
and a.DATE_SERV between @start and @end
and p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') 
order by p.HOSPCODE 
) as anc12wks where anc12wks.HOSPCODE=h.hoscode
) as target,
(
select count(distinct CID) as num 
from 
(select
p.HOSPCODE,p.CID,p.PID,p.PRENAME,p.NAME,p.LNAME,
a.DATE_SERV,
(select ga_date 
from 
(select a.HOSPCODE,a.PID,a.DATE_SERV,a.ANCNO,a.GA,pn.LMP,
datediff(a.DATE_SERV,pn.LMP) as ga_date
from
anc as a,
prenatal as pn
where a.HOSPCODE = pn.HOSPCODE 
and a.PID = pn.PID) as a2
where a2.ga_date between '7' and '84' and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no1
from
anc as a
,person as p 
where  a.PID = p.PID 
and p.HOSPCODE = a.HOSPCODE
and a.DATE_SERV between @start and @end
and p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') 
order by p.HOSPCODE 
) as anc12wks where anc12wks.HOSPCODE=h.hoscode 
and anc_no1 is not null 
) as result

from chospital h
where h.provcode = '65' and hostype  in ('03','04','05','07','08','09','12','13')
order by distcode,hoscode asc;
