select h.hoscode as hospcode ,h.hosname as hospname,total,type1,type2,type3,type4 
from chospital h
left join 
   (select getamphurcode(person.hospcode) as amphur,person.hospcode  ,count(*) as total,sum(if(person.typearea='1',1,0)) as type1
    ,sum(if(person.typearea='2',1,0)) as type2,sum(if(person.typearea='3',1,0)) as type3,sum(if(person.typearea='4',1,0)) as type4
    from person
    where person.discharge = '9'  and person.nation ='099' 
    group by person.hospcode
    order by amphur,hospcode) as pa
on h.hoscode = pa.hospcode
where h.provcode = '65' and hostype  in ('03','04','05','07','08','09','12','13')
order by hoscode asc

