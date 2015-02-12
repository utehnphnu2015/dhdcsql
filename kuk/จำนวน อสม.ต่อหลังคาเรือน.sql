//kukks

select  h.hoscode,h.hosname,t.`จำนวนหลังคาเรือน`  ,t.`จำนวน อสม.`,t.`จำนวน อสม.ต่อหลังคาเรือน` from chospital_amp h 
LEFT JOIN 
(
select h.hoscode,h.hosname,home2.num_house as 'จำนวนหลังคาเรือน'  ,
home2.num_osm as 'จำนวน อสม.' ,
concat('1 : ',round((home2.num_house/home2.num_osm),0)) as 'จำนวน อสม.ต่อหลังคาเรือน'
from chospital_amp h
join (select home.HOSPCODE,
count(distinct home.HID) as num_house,
count(distinct home.VHVID) as num_osm
from
home
group by home.HOSPCODE) as home2 on home2.HOSPCODE=h.hoscode 
) t on t.hoscode = h.hoscode

// tehn edit

//kukks

