set @start='2014-10-01';
set @end='2014-12-31';

select h.distcode as amphur,h.hoscode as hospcode ,concat(provcode,distcode,subdistcode,mu) as areacode,h.hosname as hospname,
(select count(distinct CID) as num 
from 
(select
p.HOSPCODE,p.CID,p.PID,p.PRENAME,p.NAME,p.LNAME,
la.LMP,la.BDATE,la.BTYPE,
(select po_date 
from 
(select
a.HOSPCODE,
a.PID,
a.DATE_SERV,
a.ANCNO,
a.GA,
l.LMP,
datediff(po.PPCARE,l.BDATE) as po_date
from
anc as a,
labor as l,
postnatal as po 
where (a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) and (a.HOSPCODE = po.HOSPCODE 
and a.PID = po.PID)) as a2
where a2.po_date between '1' and '7' and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as ppc_no1,
(select po_date 
from 
(select
a.HOSPCODE,a.PID,
a.DATE_SERV,a.ANCNO,a.GA,
l.LMP,
datediff(po.PPCARE,l.BDATE) as po_date
from
anc as a,
labor as l,
postnatal as po 
where (a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) and (a.HOSPCODE = po.HOSPCODE 
and a.PID = po.PID)) as a2
where a2.po_date between '8' and '15'   and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as ppc_no2,
(select po_date 
from 
(select a.HOSPCODE,a.PID,a.DATE_SERV,a.ANCNO,a.GA,
l.LMP,
datediff(po.PPCARE,l.BDATE) as po_date
from
anc as a,
labor as l,
postnatal as po 
where (a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) and (a.HOSPCODE = po.HOSPCODE 
and a.PID = po.PID)) as a2
where a2.po_date between '16' and '42'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as ppc_no3
from
labor as la
,person as p 
where  la.PID = p.PID 
and p.HOSPCODE = la.HOSPCODE
and la.BDATE between @start and @end
and p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') and la.BTYPE<>'6'
order by p.HOSPCODE 
) as ppc3t where ppc3t.HOSPCODE=h.hoscode
) as target,
(
select count(distinct CID) as num 
from 
(select
p.HOSPCODE,p.CID,p.PID,p.PRENAME,p.NAME,p.LNAME,
la.LMP,la.BDATE,la.BTYPE,
(select po_date 
from 
(select
a.HOSPCODE,
a.PID,
a.DATE_SERV,
a.ANCNO,
a.GA,
l.LMP,
datediff(po.PPCARE,l.BDATE) as po_date
from
anc as a,
labor as l,
postnatal as po 
where (a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) and (a.HOSPCODE = po.HOSPCODE 
and a.PID = po.PID)) as a2
where a2.po_date between '1' and '7' and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as ppc_no1,
(select po_date 
from 
(select
a.HOSPCODE,a.PID,
a.DATE_SERV,a.ANCNO,a.GA,
l.LMP,
datediff(po.PPCARE,l.BDATE) as po_date
from
anc as a,
labor as l,
postnatal as po 
where (a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) and (a.HOSPCODE = po.HOSPCODE 
and a.PID = po.PID)) as a2
where a2.po_date between '8' and '15'   and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as ppc_no2,
(select po_date 
from 
(select a.HOSPCODE,a.PID,a.DATE_SERV,a.ANCNO,a.GA,
l.LMP,
datediff(po.PPCARE,l.BDATE) as po_date
from
anc as a,
labor as l,
postnatal as po 
where (a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID) and (a.HOSPCODE = po.HOSPCODE 
and a.PID = po.PID)) as a2
where a2.po_date between '16' and '42'    and a2.PID=p.PID and a2.HOSPCODE=p.HOSPCODE
group by a2.PID
) as ppc_no3
from
labor as la
,person as p 
where  la.PID = p.PID 
and p.HOSPCODE = la.HOSPCODE
and la.BDATE between @start and @end
and p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') and la.BTYPE<>'6'
order by p.HOSPCODE 
) as anc5t where anc5t.HOSPCODE=h.hoscode
and ppc_no1 is not null and ppc_no2 is not null and ppc_no3 is not null 
) as result
from chospital h
where h.provcode = '65' and hostype  in ('03','04','05','07','08','09','12','13')
order by distcode,hoscode asc;
