set @bdg_date = '2014-09-30';
set @start='2014-04-01';
set @end='2015-03-31';

SELECT
h.hoscode,
h.hosname,
(select count(distinct p.CID) as nump
from person as p
where p.DISCHARGE='9'
and p.TYPEAREA in (1,3)
and (TIMESTAMPDIFF(YEAR,p.BIRTH,@bdg_date) <=3 ) 
and h.hoscode=p.HOSPCODE ) as numA,
(select count(distinct p.CID) as nump
from person as p,
dental as d,
procedure_opd as pd,
diagnosis_opd as dg
where
d.HOSPCODE=p.HOSPCODE
and d.PID=p.PID

and d.HOSPCODE=pd.HOSPCODE
and d.PID=pd.PID
and d.SEQ=pd.SEQ

and dg.HOSPCODE=pd.HOSPCODE
and dg.PID=pd.PID
and dg.SEQ=pd.SEQ

and p.DISCHARGE='9'
and p.TYPEAREA in ('1','3')
and (TIMESTAMPDIFF(YEAR,p.BIRTH,@bdg_date) <=3 ) 
and dg.DIAGCODE='Z012'
and pd.PROCEDCODE='2330011'
and h.hoscode=p.HOSPCODE ) as numB
from
chospital_amp as h
order by h.hoscode

