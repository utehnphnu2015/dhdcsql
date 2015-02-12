
 SET @start_d:='20141001';
SET @end_d:='20150930';

SELECT h.distcode,n.HOSPCODE,n.PID,p.cid,p.name,p.lname,p.BIRTH,n.DATE_SERV,n.FOOD,DATE_FORMAT(n.DATE_SERV,'%m') m
FROM nutrition n INNER JOIN person p ON n.HOSPCODE=p.HOSPCODE AND n.PID=p.PID
left join chospital h on n.HOSPCODE=h.hoscode
WHERE n.DATE_SERV BETWEEN @start_d AND @end_d AND n.FOOD in('0','1','2','3','4')
GROUP BY n.HOSPCODE,n.PID
HAVING TIMESTAMPDIFF(MONTH,p.BIRTH,n.DATE_SERV) BETWEEN 0 AND 5
ORDER BY n.DATE_SERV DESC