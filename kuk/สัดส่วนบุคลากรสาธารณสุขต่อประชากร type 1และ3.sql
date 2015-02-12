select care_team.hoscode,care_team.hosname,care_team.pop,care_team.doctor,concat('1 : ',round((care_team.pop/care_team.doctor),0)) as raio from
(select h.hoscode,h.hosname,
(select count(distinct CID) 
from person p 
where p.DISCHARGE='9' 
and p.TYPEAREA in ('1','3')
and p.HOSPCODE=h.hoscode
) as pop,
(select count(distinct CID) as doc
from provider pv
where pv.CID is not null and pv.PROVIDERTYPE in ('03','04','05','06') 
and pv.OUTDATE is null and pv.MOVETO is NULL and pv.HOSPCODE=h.hoscode) as doctor
from chospital h 
where h.provcode='41' and h.distcode='06' and h.hostype ='03') as care_team
