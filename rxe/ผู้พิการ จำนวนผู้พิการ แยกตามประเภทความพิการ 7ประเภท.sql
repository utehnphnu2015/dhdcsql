select if(disabtype ='1','Type 1',IF(disabtype ='2','Type 2',IF(disabtype ='3','Type 3',IF(disabtype ='4','Type 4',IF(disabtype ='5','Type 5'
,IF(disabtype ='6','Type 6',IF(disabtype ='7','Type 7','No Type'))))))) as disabtype,
count(DISTINCT cid) as total
from disability left join person on disability.HOSPCODE=person.HOSPCODE and 
disability.pid=person.pid where typearea in ('1','3') and DISCHARGE='9' 
group by DISABTYPE;
#ผู้พิการบางคน พิการหลายอย่างในคนๆเดียวครับ