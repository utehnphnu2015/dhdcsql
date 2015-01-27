
select * from person where hospcode='10725'
####  จาก jub รพ.ศรีสังวรสุโขทัย


#จำนวนผู้ป่วยความดันโลหิตสูงผู้ป่วยนอก อายุระหว่าง 15-35 ปี
SELECT  p.PID,CONCAT(p.NAME,' ',p.LNAME) AS tname,p.CID,diago.DIAGCODE,(YEAR(CURDATE())- YEAR(BIRTH) ) AS tage
FROM f43_person p 
LEFT JOIN f43_diagnosis_opd diago ON diago.PID=p.PID
WHERE p.hospcode='10725'
    AND (YEAR(CURDATE())- YEAR(BIRTH))>14 AND (YEAR(CURDATE())- YEAR(BIRTH))<36
    AND diago.DIAGCODE='I10'
GROUP BY p.PID