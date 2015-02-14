SET @start_d:='2013-10-01';
SET @end_d:='2014-09-30';

select dr.DNAME,count(DISTINCT dr.pid) as n_person
from drugallergy dr left join (
	select * from person where typearea in ('1','3') and discharge='9' group by cid 
) pn on dr.hospcode=pn.hospcode and dr.pid=pn.pid 
where DATERECORD BETWEEN @start_d and @end_d
group by dr.DNAME
ORDER BY n_person DESC
limit 20
# เอาไว้ดูว่า ในช่วงเวลาที่กำหนด ผู้ป่วยแพ้ยาอะไรมากที่สุด  10-20 อันดับแรก  เอาไว้เป็นข้อมูลระมัดระวัง ในการใช้ยา


