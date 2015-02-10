set @start='2014-04-01';
set @end='2015-03-31';

select h.hoscode,h.hosname,
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
where a2.ga_date between '112' and '146'   and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
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
where a2.ga_date between '168' and '202'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
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
where a2.ga_date between '210' and '244'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
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
where a2.ga_date between '252' and '286'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
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
) as a,
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
where a2.ga_date between '112' and '146'   and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no2,
(select ga_date 
from  (select a.HOSPCODE,a.PID,a.DATE_SERV,a.ANCNO,a.GA,l.LMP,datediff(a.DATE_SERV,l.LMP) as ga_date
from
anc as a,labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '168' and '202'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as anc_no3,
(select ga_date 
from 
(select a.HOSPCODE,a.PID,a.DATE_SERV,a.ANCNO,a.GA,l.LMP,datediff(a.DATE_SERV,l.LMP) as ga_date
from anc as a,labor as l 
where a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) as a2
where a2.ga_date between '210' and '244'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
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
where a2.ga_date between '252' and '286'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
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
) as b
from chospital h
where h.provcode='41' and h.distcode='06' and h.hostype in ('03','07');