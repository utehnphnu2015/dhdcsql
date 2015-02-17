set @start='2014-10-01';
set @end='2014-12-31';
set @bdg_date = '2014-09-30';

select  h.distcode as amphur,h.hoscode as hospcode ,concat(provcode,distcode,subdistcode,mu) as areacode,h.hosname as hospname,

(SELECT  hos_chronic from 
          (select person.hospcode,count(distinct(person.pid)) as hos_chronic from chronic  
           inner join person on chronic.hospcode = person.hospcode and chronic.pid = person.pid
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' and  (chronic.chronic between 'I10' and 'I159')  
           and (TIMESTAMPDIFF(YEAR,person.birth,@bdg_date) >=35  )  group by person.hospcode) as c
where c.hospcode  = h.hoscode
) as target,
(SELECT hos_doit from
          (select person.hospcode,count(distinct(person.pid)) as hos_doit from chronic  
           inner join person on chronic.hospcode = person.hospcode and chronic.pid = person.pid 
           inner join diagnosis_opd on person.hospcode = diagnosis_opd.hospcode and person.pid = diagnosis_opd.pid 
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099'  and  (chronic.chronic between 'I10' and 'I159') 
           and diagnosis_opd.diagcode in ('E10', 'E11')  and (diagnosis_opd.date_serv BETWEEN @start and @end ) 
           and (TIMESTAMPDIFF(YEAR,person.birth,diagnosis_opd.date_serv) >= 35 )  group by person.hospcode) as r
where r.hospcode = h.hoscode
) as result 

from chospital h
where h.provcode = '65' and hostype  in ('03','04','05','07','08','09','12','13')
order by distcode,hoscode asc;
