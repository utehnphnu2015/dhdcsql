 SET @start_d:='20141001';
SET @end_d:='20150930';

SELECT h.distcode,l.HOSPCODE,l.CID,pn.name,pn.lname,l.BDATE,l.GRAVIDA,DATE_FORMAT(l.BDATE,'%m') m,if(l.GRAVIDA>1,1,0) a
FROM tmp_labor l left join person pn on l.cid=pn.cid
left join chospital h on l.HOSPCODE=h.hoscode
WHERE l.BDATE BETWEEN @start_d AND @end_d AND l.age_y BETWEEN 15 AND 19 AND l.HOSPCODE=l.BHOSP
GROUP BY CID;
