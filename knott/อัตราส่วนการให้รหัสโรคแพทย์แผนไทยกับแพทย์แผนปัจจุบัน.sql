SELECT sm.`month`,d.HOSPCODE,amp.hosname,count(d.SEQ) as total,
sum(if(d.DIAGCODE like 'u%',1,0)) as panthai_diag,
round(((sum(if(d.DIAGCODE like 'u%',1,0)))/(count(d.SEQ)))*100,2) as percent
from diagnosis_opd d,sys_month sm,chospital_amp amp 
where concat(year(d.DATE_SERV),month(d.DATE_SERV))=sm.`month` and d.HOSPCODE=amp.hoscode
GROUP BY d.HOSPCODE,concat(year(DATE_SERV),month(DATE_SERV)) 
ORDER BY d.HOSPCODE,concat(year(DATE_SERV),month(DATE_SERV))