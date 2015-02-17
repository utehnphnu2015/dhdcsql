set @start='2014-10-01';
set @end='2015-03-31';

select  h.distcode as amphur,h.hoscode as hospcode ,concat(provcode,distcode,subdistcode,mu) as areacode,h.hosname as hospname,child.total as target,dev.total as result 
from chospital h
left join
         (select person.HOSPCODE,count(distinct person.pid) as total
           from person
           where  person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' 
           and (person.birth BETWEEN DATE_ADD(@start,INTERVAL -71 month) and DATE_ADD(@end,INTERVAL -0 month))
           GROUP BY person.HOSPCODE ) child
on h.hoscode = child.hospcode
left join
         (select n.HOSPCODE,count(distinct person.pid) as total
           from nutrition n inner join person on n.hospcode=person.hospcode and n.pid=person.pid  
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' 
           and n.CHILDDEVELOP = '1'
           and (person.birth BETWEEN DATE_ADD(@start,INTERVAL -71 month) and DATE_ADD(@end,INTERVAL -0 month))
           group by n.hospcode
          ) dev
on h.hoscode = dev.hospcode
where h.provcode = '65' and hostype  in ('03','04','05','07','08','09','12','13')
GROUP BY hoscode
order by distcode,hoscode asc;
