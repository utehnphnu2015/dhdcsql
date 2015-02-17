set @start='2014-10-01';
set @end='2014-12-31';
set @bdg_date = '2014-09-30';

select  h.distcode as amphur,h.hoscode as hospcode ,concat(provcode,distcode,subdistcode,mu) as areacode,h.hosname as hospname,

(SELECT  hos_chronic from 
          (select person.hospcode,count(distinct(person.pid)) as hos_chronic from chronic  
           inner join person on chronic.hospcode = person.hospcode and chronic.pid = person.pid
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' and  (chronic.chronic between 'E10' and 'E149')  
           and (TIMESTAMPDIFF(YEAR,person.birth,@bdg_date) >=35  )  group by person.hospcode) as c
where c.hospcode  = h.hoscode
) as target,
(SELECT hos_doit from
          (select person.hospcode,count(distinct(person.pid)) as hos_doit from chronic  
           inner join person on chronic.hospcode = person.hospcode and chronic.pid = person.pid 
           inner join labfu on person.hospcode = labfu.hospcode and person.pid = labfu.pid 
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099'  and  (chronic.chronic between 'E10' and 'E149')  
           and labfu.labtest in ('01','02','03') and (labfu.date_serv BETWEEN @start and @end ) 
           and (TIMESTAMPDIFF(YEAR,person.birth,labfu.date_serv) >= 35 )  group by person.hospcode) as r
where r.hospcode = h.hoscode
) as result ,
(SELECT hos_doit from
          (select person.hospcode,count(distinct(person.pid)) as hos_doit from chronic  
           inner join person on chronic.hospcode = person.hospcode and chronic.pid = person.pid            
           inner join labfu on person.hospcode = labfu.hospcode and person.pid = labfu.pid 
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099'  and  (chronic.chronic between 'E10' and 'E149')  
           and labfu.labtest in ('01','02','03') and labresult BETWEEN 70 and 130  and (labfu.date_serv BETWEEN @start and @end ) 
           and (TIMESTAMPDIFF(YEAR,person.birth,@bdg_date) >= 35 )  group by person.hospcode) as r
where r.hospcode = h.hoscode
) as 'fbs70-130'

from chospital h
where h.provcode = '65' and hostype  in ('03','04','05','07','08','09','12','13')
order by distcode,hoscode asc;
