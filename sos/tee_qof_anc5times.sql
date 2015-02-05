set @start='2014-10-01';
set @end='2014-12-31';

select h.distcode as amphur,h.hoscode as hospcode ,concat(provcode,distcode,subdistcode,mu) as areacode,h.hosname as hospname,
(select count(distinct CID) as num 
from 
(select
p.HOSPCODE,p.CID,p.PID,p.PRENAME,p.NAME,p.LNAME,
la.LMP,la.BDATE,la.BTYPE,
(select ga_date 
from 
(select
a.HOSPCODE,
a.PID,
a.DATE_SERV,
a.ANCNO,
a.GA,
l.LMP,
datediff(a.DATE_SERV,l.LMP) as ga_date
from
anc as a,
labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '7' and '84' and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no1,
(select ga_date 
from 
(select
a.HOSPCODE,a.PID,
a.DATE_SERV,a.ANCNO,a.GA,
l.LMP,
datediff(a.DATE_SERV,l.LMP) as ga_date
from
anc as a,
labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '85' and '146'   and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no2,
(select ga_date 
from 
(select a.HOSPCODE,a.PID,a.DATE_SERV,a.ANCNO,a.GA,
l.LMP,
datediff(a.DATE_SERV,l.LMP) as ga_date
from
anc as a,
labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '147' and '202'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no3,
(select ga_date 
from 
(select a.HOSPCODE,a.PID,a.DATE_SERV,a.ANCNO,a.GA,l.LMP,
datediff(a.DATE_SERV,l.LMP) as ga_date
from
anc as a,
labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '203' and '244'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no4,
(
select ga_date 
from 
(select
a.HOSPCODE,
a.PID,
a.DATE_SERV,
a.ANCNO,
a.GA,
l.LMP,
datediff(a.DATE_SERV,l.LMP) as ga_date
from
anc as a,
labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '245' and '286'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no5
from
labor as la
,person as p 
where  la.PID = p.PID 
and p.HOSPCODE = la.HOSPCODE
and la.BDATE between @start and @end
and p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') and la.BTYPE<>'6'
order by p.HOSPCODE 
) as anc5t where anc5t.HOSPCODE=h.hoscode
) as target,
(
select count(distinct CID) as num 
from 
(select
p.HOSPCODE,p.CID,p.PID,p.PRENAME,p.NAME,p.LNAME,
la.LMP,la.BDATE,la.BTYPE,
(select ga_date 
from 
(select a.HOSPCODE,a.PID,a.DATE_SERV,a.ANCNO,a.GA,l.LMP,
datediff(a.DATE_SERV,l.LMP) as ga_date
from
anc as a,
labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '7' and '84' and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no1,
(select ga_date 
from 
(select
a.HOSPCODE,a.PID,a.DATE_SERV,a.ANCNO,a.GA,l.LMP,datediff(a.DATE_SERV,l.LMP) as ga_date
from anc as a,
labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '85' and '146'   and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no2,
(select ga_date 
from  (select a.HOSPCODE,a.PID,a.DATE_SERV,a.ANCNO,a.GA,l.LMP,datediff(a.DATE_SERV,l.LMP) as ga_date
from
anc as a,labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '147' and '202'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no3,
(select ga_date 
from 
(select a.HOSPCODE,a.PID,a.DATE_SERV,a.ANCNO,a.GA,l.LMP,datediff(a.DATE_SERV,l.LMP) as ga_date
from anc as a,labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '203' and '244'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no4,
(
select ga_date 
from 
(select
a.HOSPCODE,
a.PID,
a.DATE_SERV,
a.ANCNO,
a.GA,
l.LMP,
datediff(a.DATE_SERV,l.LMP) as ga_date
from
anc as a,
labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '245' and '286'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no5
from
labor as la
,person as p 
where  la.PID = p.PID 
and p.HOSPCODE = la.HOSPCODE
and la.BDATE between @start and @end
and p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') and la.BTYPE<>'6'
order by p.HOSPCODE 
) as anc5t where anc5t.HOSPCODE=h.hoscode 
and anc_no1 is not null and anc_no2 is not null and anc_no3 is not null and anc_no4 is not null and anc_no5 is not null
) as result

from chospital h
where h.provcode = '65' and hostype  in ('03','04','05','07','08','09','12','13')
order by distcode,hoscode asc;

