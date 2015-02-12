set @start='2014-10-01';
set @end='2014-12-31';
set @bdg_date = '2014-09-30';

select  h.distcode as amphur,h.hoscode as hospcode ,concat(provcode,distcode,subdistcode,mu) as areacode,h.hosname as hospname,

(SELECT  hos_chronic from 
          (select person.hospcode,count(distinct(person.pid)) as hos_chronic from chronic  
           inner join person on chronic.hospcode = person.hospcode and chronic.pid = person.pid
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' and  (chronic.chronic between 'E10' and 'E14')  
           and (TIMESTAMPDIFF(YEAR,person.birth,@bdg_date) >= 35  )  group by person.hospcode) as c
where c.hospcode  = h.hoscode
) as target,IFNULL(l1,0)as l1,IFNULL(l2,0)as l2,IFNULL(l3,0)as l3,IFNULL(l4,0)as l4,IFNULL(l5,0)as l5


from chospital h
LEFT JOIN
(select n.hospcode,sum(if(n.chart = '<10%',1,0)) as l1 ,sum(if(n.chart = '10-<20%',1,0)) as l2 ,
                   sum(if(n.chart = '20-<30%',1,0)) as l3 ,sum(if(n.chart = '30-<40%',1,0)) as l4 ,sum(if(n.chart = '>=40%',1,0)) as l5
                   from s_ncd_nocholesteral_colorchart n
                   where n.date_serv BETWEEN @start  and  @end
                   and  (n.chronic between 'E10' and 'E14') 
                   GROUP BY n.hospcode
) as result  on result.hospcode = h.hoscode
where h.provcode = '65' and hostype  in ('03','04','05','07','08','09','12','13')
order by distcode,hoscode asc;
