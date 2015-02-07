set @pcu = '11255';

SELECT concat(ins.instypecode,' : ',ins.instypename) as 'สิทธิการรักษา',count(p.PID) as 'คน'
FROM person p,card c,cinstype_new ins
where (p.HOSPCODE=c.HOSPCODE and p.PID=c.PID) and c.INSTYPE_NEW=ins.instypecode 
and p.TYPEAREA in ('1','3') and p.DISCHARGE=9 and p.HOSPCODE=@pcu
GROUP BY c.INSTYPE_NEW
UNION
SELECT 'รวม' as 'สิทธิการรักษา',count(p.PID) as 'คน'
FROM person p,card c,cinstype_new ins
where (p.HOSPCODE=c.HOSPCODE and p.PID=c.PID) and c.INSTYPE_NEW=ins.instypecode 
and p.TYPEAREA in ('1','3') and p.DISCHARGE=9 and p.HOSPCODE=@pcu
