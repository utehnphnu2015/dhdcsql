set @start='2014-10-01';
set @end='2014-12-31';
set @bdg_date = '2014-09-30';

select  h.distcode as amphur,h.hoscode as hospcode ,concat(provcode,distcode,subdistcode,mu) as areacode,h.hosname as hospname,
(SELECT hos_target from
 (select person.hospcode , count(distinct person.pid) as hos_target from person  
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' 
           and (TIMESTAMPDIFF(YEAR,person.birth,@bdg_date) >= 35 ) group by person.hospcode ) as t
where  t.hospcode = h.hoscode
) as target ,
(SELECT  hos_chronic from 
          (select person.hospcode,count(distinct(person.pid)) as hos_chronic from chronic  
           inner join person on chronic.hospcode = person.hospcode and chronic.pid = person.pid 
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' and  ((chronic.chronic between 'E10' and 'E149') or (chronic.chronic between 'I10' and 'I159')) 
           and (TIMESTAMPDIFF(YEAR,person.birth,@bdg_date) >= 35 )  group by person.hospcode) as c
where c.hospcode  = h.hoscode
) as chronic,
(SELECT hos_doit from
          (select person.hospcode,count(distinct(person.pid)) as hos_doit from ncdscreen  
           inner join person on ncdscreen.hospcode = person.hospcode and ncdscreen.pid = person.pid 
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' and date_serv between @start and @end 
           and (TIMESTAMPDIFF(YEAR,person.birth,date_serv) >= 35 )  group by person.hospcode) as r
where r.hospcode = h.hoscode
) as result 