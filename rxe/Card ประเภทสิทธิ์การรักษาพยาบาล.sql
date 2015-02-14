select ptc.instypename as Type,count(pn.CID) as N
from card c left join (
	select * from person where typearea in ('1','3') and discharge='9' group by cid 
) pn on c.hospcode=pn.hospcode and c.pid=pn.pid 
left JOIN cinstype_new ptc on ptc.instypecode = c.INSTYPE_NEW
group by ptc.instypename
ORDER BY N desc

# แยกสิทะิ์การรักษา  เอาไว้ทำกราฟวงกลม