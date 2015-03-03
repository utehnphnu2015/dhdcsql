set @bdg_date = '2014-09-30';
set @start='2014-04-01';
set @end='2015-03-31';


SELECT
h.hoscode,
h.hosname,
(select count(distinct p.CID) as num
from
anc as a,
person as p 
where a.PID = p.PID 
and p.HOSPCODE = a.HOSPCODE
and p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') 
and a.DATE_SERV between @start and @end 
and p.HOSPCODE=h.hoscode) as target,
(SELECT
count(distinct p.CID)
FROM
procedure_opd as pd ,
anc as a ,
person as p ,
dental as d
where 
a.PID = p.PID 
and p.HOSPCODE = a.HOSPCODE 
and pd.PROCEDCODE='2330011'
and d.PID=a.PID
and d.HOSPCODE=a.HOSPCODE 
and d.SEQ = pd.SEQ  
and d.PID=pd.PID 
and d.HOSPCODE = pd.HOSPCODE 
and a.DATE_SERV between @start and @end 
and p.NATION='099' and p.DISCHARGE='9' and p.TYPEAREA in ('1','3') 
and p.HOSPCODE=h.hoscode) as output
FROM
chospital_amp AS h
order by h.hoscode