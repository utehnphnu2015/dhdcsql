set @start='2014-04-01';
set @end='2015-03-31'; 

select *,round((price_drug_all/price_drugthai),2) as ratio from 
(select
chospital.hoscode,
chospital.hosname,
(select sum(price) from 
(select
drug_opd.HOSPCODE,
(drug_opd.DRUGPRICE*drug_opd.AMOUNT) as price
from
drug_opd where drug_opd.DATE_SERV between @start and @end ) d2
where d2.HOSPCODE=chospital.hoscode
group by HOSPCODE) as price_drug_all,
(select sum(price) from 
(select
drug_opd.HOSPCODE,
(drug_opd.DRUGPRICE*drug_opd.AMOUNT) as price
from
drug_opd
join cdrug_planthai on cdrug_planthai.didstd = drug_opd.DIDSTD where drug_opd.DATE_SERV between @start and @end ) d1
where d1.HOSPCODE=chospital.hoscode
group by HOSPCODE) as price_drugthai
FROM
chospital
where chospital.provcode='41' and chospital.distcode='06' and hostype  in ('03','04','05','07','08','09','12','13')) as price_drug

