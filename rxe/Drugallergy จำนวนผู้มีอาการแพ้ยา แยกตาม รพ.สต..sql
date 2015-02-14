SET @start_d:='2010-10-01';
SET @end_d:='2015-09-30';

select distcode,dr.hospcode,hosname,count(DISTINCT dr.pid) as total
from drugallergy dr left join (
	select * from person where typearea in ('1','3') and discharge='9' group by cid 
) pn on dr.hospcode=pn.hospcode and dr.pid=pn.pid 
left join chospital ch on dr.hospcode=ch.hoscode 
where DATERECORD BETWEEN @start_d and @end_d
group by dr.hospcode,hosname
#รายงานผู้มีอาการแพ้ยา แยกตามสถานบริการ  ตามช่วงเวลาที่กำหนด
# เอาไว้ดูว่า บางสถานบริการ ไม่ได้ลงข้อมูลการแพ้ยาเลย  อาจจะเป็นเพราะลืม หรือ ลงข้อมูลไม่เป็น
