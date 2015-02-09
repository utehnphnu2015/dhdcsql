set @start='2014-10-01';
set @end='2014-12-31';

select  h.hoscode as hospcode ,concat(provcode,distcode,subdistcode,mu) as areacode,h.hosname as hospname,
(SELECT cc_person from 
          (select person.HOSPCODE,count(DISTINCT(person.PID)) as cc_person from diagnosis_opd  
           inner join person on diagnosis_opd.hospcode = person.hospcode and diagnosis_opd.pid = person.pid 
           INNER JOIN card on person.hospcode = card.hospcode and person.pid = card.pid 
           where  person.typearea in ('1', '3') and person.nation ='099' and (diagnosis_opd.DATE_SERV BETWEEN @start and @end)
           and (LEFT(diagnosis_opd.DIAGCODE,1) = 'U' AND diagnosis_opd.DIAGCODE<>'U77')  
           and card.instype_new in ('0100') group by month(diagnosis_opd.dateserv),person.HOSPCODE ) as c
where c.hospcode  = h.hoscode ) as uc_person,
(SELECT cc_person from 
          (select diagnosis_opd.HOSPCODE,count(DISTINCT(diagnosis_opd.seq)) as cc_person from diagnosis_opd  
           inner join person on diagnosis_opd.hospcode = person.hospcode and diagnosis_opd.pid = person.pid 
           INNER JOIN card on person.hospcode = card.hospcode and person.pid = card.pid 
           where  person.typearea in ('1', '3') and person.nation ='099' and (diagnosis_opd.DATE_SERV BETWEEN @start and @end)
           and (LEFT(diagnosis_opd.DIAGCODE,1) = 'U' AND diagnosis_opd.DIAGCODE<>'U77')  
           and card.instype_new in ('0100') group by diagnosis_opd.HOSPCODE ) as c
where c.hospcode  = h.hoscode ) as uc_visit


from chospital_amp h
order by hoscode asc;
