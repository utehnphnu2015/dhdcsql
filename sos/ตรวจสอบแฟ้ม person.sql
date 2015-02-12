select  h.distcode as amphur,h.hoscode as hospcode ,concat(provcode,distcode,subdistcode,mu) as areacode,h.hosname as hospname,
cid_isnull,cid_not13,nation_isnull

from chospital h
LEFT JOIN
          (select person.hospcode,count(distinct(person.pid)) as total,SUM(if(trim(person.cid)='' or ISNULL(person.cid),1,0)) as cid_isnull
          ,SUM(if(length(person.cid) <> 13,1,0)) as cid_not13,SUM(if(trim(person.nation)='' or ISNULL(person.nation),1,0)) as nation_isnull from person  
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099'   group by person.hospcode) as p
ON h.hoscode = p.hospcode
where h.provcode = '65' and hostype  in ('03','04','05','07','08','09','12','13')
order by distcode,hoscode asc;