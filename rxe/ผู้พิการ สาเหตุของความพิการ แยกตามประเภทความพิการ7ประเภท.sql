select if(disabtype ='1','Type 1',IF(disabtype ='2','Type 2',IF(disabtype ='3','Type 3',IF(disabtype ='4','Type 4',IF(disabtype ='5','Type 5'
,IF(disabtype ='6','Type 6',IF(disabtype ='7','Type 7','No Type'))))))) as disabtype,
sum(if(disabcause='1',1,0)) as congenital,
sum(if(disabcause='2',1,0)) as injury,
sum(if(disabcause='3',1,0)) as disease,
sum(if(disabcause is null,1,0)) as unspecified,
count(DISTINCT ds.pid) as total

from disability ds left join (
	select * from person where typearea in ('1','3') and discharge='9' group by cid 
) pn on ds.hospcode=pn.hospcode and ds.pid=pn.pid 
inner join chospital ch on ds.hospcode=ch.hoscode 
group by disabtype

#ผู้พิการบางคน มีสาเหตุความพิการหลายอย่างในคนๆเดียวครับ   เพราะในตาราง disability มี pid ซ้ำกัน หรือเกิดจากการลงข้อมูลผิด หรือการเข้าใจในการลงข้อมูลผิดก้เป็นได้