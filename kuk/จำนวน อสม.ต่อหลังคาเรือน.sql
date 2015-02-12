select h.hoscode,h.hosname,home2.num_house as 'จำนวนหลังคาเรือน'  ,
home2.num_osm as 'จำนวน อสม.' ,
concat('1 : ',round((home2.num_house/home2.num_osm),0)) as 'จำนวน อสม.ต่อหลังคาเรือน'
from chospital h
join (select home.HOSPCODE,
count(distinct home.HID) as num_house,
count(distinct home.VHVID) as num_osm
from
home
group by home.HOSPCODE) as home2 on home2.HOSPCODE=h.hoscode 
where h.provcode='41' and h.distcode='06' and h.hostype in ('03','07')

