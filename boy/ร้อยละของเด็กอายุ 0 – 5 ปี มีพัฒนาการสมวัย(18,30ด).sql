
SET @start_d:='20141001';
SET @end_d:='20150930';

SELECT h.distcode,n.HOSPCODE,n.PID,p.cid,p.name,p.lname,n.CHILDDEVELOP,n.DATE_SERV,DATE_FORMAT(n.DATE_SERV,'%m') m
FROM nutrition n INNER JOIN person p ON n.HOSPCODE=p.HOSPCODE AND n.PID=p.PID
left join chospital h on p.HOSPCODE=h.hoscode
WHERE p.DISCHARGE='9' AND p.NATION='099' AND n.CHILDDEVELOP in(SELECT id_childdevelop FROM cchilddevelop)
AND TIMESTAMPDIFF(MONTH,p.BIRTH,n.DATE_SERV) in(18,30)
AND n.DATE_SERV BETWEEN @start_d AND @end_d
GROUP BY n.HOSPCODE,n.PID
ORDER BY n.DATE_SERV