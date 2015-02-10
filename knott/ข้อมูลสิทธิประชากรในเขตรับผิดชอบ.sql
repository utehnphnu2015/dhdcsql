set @pcu = '11255';

SELECT concat(ins.instypecode,' : ',ins.instypename) as right,count(p.PID) as person
FROM person p,card c,cinstype_new ins
where (p.HOSPCODE=c.HOSPCODE and p.PID=c.PID) and c.INSTYPE_NEW=ins.instypecode 
and p.TYPEAREA in ('1','3') and p.DISCHARGE=9 and p.HOSPCODE=@pcu
GROUP BY c.INSTYPE_NEW
UNION
SELECT 'Total' as right,count(p.PID) as person
FROM person p,card c,cinstype_new ins
where (p.HOSPCODE=c.HOSPCODE and p.PID=c.PID) and c.INSTYPE_NEW=ins.instypecode 
and p.TYPEAREA in ('1','3') and p.DISCHARGE=9 and p.HOSPCODE=@pcu
