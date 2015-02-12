 SET @start_d:='20141001';
SET @end_d:='20150930';
SET @ampur:='02';

SELECT distcode,tb2.HOSPCODE,tb2.CID,b.name,b.lname,b.TYPEAREA,tb2.GRAVIDA,tb2.m,a.g1_ga
FROM (
SELECT l.HOSPCODE,l.CID,l.GRAVIDA,l.BDATE,DATE_FORMAT(l.BDATE,'%m') m
FROM tmp_labor l
WHERE l.BDATE BETWEEN @start_d AND @end_d
GROUP BY l.CID,l.GRAVIDA
) tb2
LEFT JOIN t_person_anc a ON tb2.CID=a.cid AND round(tb2.GRAVIDA)=round(a.gravida)
left join t_person_cid b on tb2.cid=b.cid
left join chospital on tb2.HOSPCODE=chospital.hoscode
where distcode=@ampur
GROUP BY tb2.HOSPCODE,tb2.CID,tb2.GRAVIDA
ORDER BY cid
