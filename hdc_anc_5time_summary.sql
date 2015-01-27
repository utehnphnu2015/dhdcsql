set @start='2014-04-01';
set @end='2015-03-31'; 

select h.hoscode,h.hosname,
(select count(distinct CID) as cc
from labor as la,person as p 
where p.HOSPCODE = la.HOSPCODE and p.PID = la.PID
and la.BDATE between @start and @end
and p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') and la.BTYPE<>'6' and p.HOSPCODE=h.hoscode) as labor_all,

(select count(CID) from 
(select p.HOSPCODE,p.CID,la.LMP,la.EDC,la.BDATE,la.BTYPE,
(select datediff(a.DATE_SERV,l.LMP) as ga_date 
from anc as a,labor as l 
where datediff(a.DATE_SERV,l.LMP) between '7' and '84' and a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID and a.PID=p.PID and a.HOSPCODE=p.HOSPCODE group by a.PID) as no1,
(select datediff(a.DATE_SERV,l.LMP) as ga_date 
from anc as a,labor as l 
where datediff(a.DATE_SERV,l.LMP) between '112' and '146' and a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID and a.PID=p.PID and a.HOSPCODE=p.HOSPCODE group by a.PID) as no2,
(select datediff(a.DATE_SERV,l.LMP) as ga_date 
from anc as a,labor as l 
where datediff(a.DATE_SERV,l.LMP) between '168' and '202' and a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID and a.PID=p.PID and a.HOSPCODE=p.HOSPCODE group by a.PID) as no3,
(select datediff(a.DATE_SERV,l.LMP) as ga_date 
from anc as a,labor as l 
where datediff(a.DATE_SERV,l.LMP) between '210' and '244' and a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID and a.PID=p.PID and a.HOSPCODE=p.HOSPCODE group by a.PID) as no4,
(select datediff(a.DATE_SERV,l.LMP) as ga_date 
from anc as a,labor as l 
where datediff(a.DATE_SERV,l.LMP) between '252' and '286' and a.HOSPCODE = l.HOSPCODE 
and a.PID = l.PID and a.PID=p.PID and a.HOSPCODE=p.HOSPCODE group by a.PID) as no5

from labor as la,person as p 
where p.HOSPCODE = la.HOSPCODE and p.PID = la.PID
and la.BDATE between @start and @end
and p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') and la.BTYPE<>'6') as no_anc 
where no_anc.HOSPCODE=h.hoscode and no_anc.no1 is not null  and no_anc.no2 is not null and no_anc.no3 is not null
and no_anc.no4 is not null and no_anc.no5 is not null) as anc_5t 
from chospital h 
where h.provcode='41' and h.distcode='06' and h.hostype in ('03','07');

##test

