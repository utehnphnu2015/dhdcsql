select distcode,ds.hospcode,hosname,count(DISTINCT ds.pid) as total, 
sum(if(disabtype='1',1,0)) 'Visible',sum(if(disabtype='2',1,0)) 'Hear',
sum(if(disabtype='3',1,0)) 'Movement',sum(if(disabtype='4',1,0)) 'Behavior',
sum(if(disabtype='5',1,0)) 'Wisdom',sum(if(disabtype='6',1,0)) 'Learning',
sum(if(disabtype='7',1,0)) 'Autism' 
from disability ds left join (
	select * from person where typearea in ('1','3') and discharge='9' group by cid 
) pn on ds.hospcode=pn.hospcode and ds.pid=pn.pid 
left join chospital ch on ds.hospcode=ch.hoscode 
group by ds.hospcode,hosname
#ผู้พิการบางคน พิการหลายอย่างในคนๆเดียวครับ