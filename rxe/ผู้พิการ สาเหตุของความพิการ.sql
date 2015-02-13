select distcode,ds.hospcode,hosname,
sum(if(DISABCAUSE='1',1,0)) as congenital,
sum(if(DISABCAUSE='2',1,0)) as injury,
sum(if(DISABCAUSE='3',1,0)) as disease,
sum(if(DISABCAUSE is null,1,0)) as unspecified,
count(DISTINCT ds.pid) as total
from disability ds left join (
	select * from person where typearea in ('1','3') and discharge='9' group by cid 
) pn on ds.hospcode=pn.hospcode and ds.pid=pn.pid 
left join chospital ch on ds.hospcode=ch.hoscode 
group by ds.hospcode,hosname
#ผู้พิการบางคน มีสาเหตุความพิการหลายอย่างในคนๆเดียวครับ   เพราะในตาราง disability มี pid ซ้ำกัน หรือเกิดจากการลงข้อมูลผิด หรือการเข้าใจในการลงข้อมูลผิดก้เป็นได้