set @start='2014-10-01';
set @end='2014-12-31';
set @bdg_date = '2014-09-30';

select  h.distcode as amphur,h.hoscode as hospcode ,concat(provcode,distcode,subdistcode,mu) as areacode,h.hosname as hospname, 
ifnull(ncd_target.hos_target,0) as target,ifnull(ncd_do.hos_doit,0) as result
from  chospital h
LEFT JOIN
          (SELECT person.hospcode,count(distinct(person.pid)) as hos_target from chronic  
           INNER JOIN person on chronic.hospcode = person.hospcode and chronic.pid = person.pid 
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' 
           and (TIMESTAMPDIFF(YEAR,person.birth,@bdg_date) >=35  ) and  chronic.chronic BETWEEN 'E10' and 'E149' 
           GROUP BY person.hospcode) AS ncd_target 
on  h.hoscode = ncd_target.hospcode
LEFT JOIN
          (SELECT person.hospcode,count(distinct(person.pid)) as hos_doit from diagnosis_opd  
            INNER JOIN person on diagnosis_opd.hospcode = person.hospcode and diagnosis_opd.pid = person.pid 
            INNER JOIN chronic on person.hospcode = chronic.hospcode  and person.pid = chronic.pid
           where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' and chronic.chronic BETWEEN 'E10' and 'E149'
           and (diagnosis_opd.diagcode in ('I200','I201', 'I208', 'I209' ,'I210', 'I211', 'I212','I213', 'I214', 'I219', 'I220', 'I221', 'I228', 'I229', 'I248','I249', 'I252', 'I255', 'I256', 'I258', 'I259')  
           or diagnosis_opd.diagcode in ('E105','E115','E125','E135', 'E145'))  
           and date_serv BETWEEN @start and @end  and (TIMESTAMPDIFF(YEAR,person.birth,date_serv) >=35  ) GROUP BY person.hospcode) as ncd_do 
on  h.hoscode = ncd_do.hospcode
where h.provcode = '65' and hostype  in ('03','04','05','07','08','09','12','13')
order by distcode,hoscode asc;
