
select * from person where hospcode='10725'
####  จาก jub รพ.ศรีสังวรสุโขทัย


#จำนวนผู้ป่วยความดันโลหิตสูงผู้ป่วยนอก อายุระหว่าง 15-35 ปี

SET @hospcode='10725';
SET @diagcode='I10';

SELECT  p.PID,CONCAT(p.NAME,' ',p.LNAME) AS tname,p.CID,diago.DIAGCODE,(YEAR(CURDATE())- YEAR(BIRTH) ) AS tage
FROM f43_person p 
LEFT JOIN f43_diagnosis_opd diago ON diago.PID=p.PID
WHERE p.hospcode=@hospcode
    AND (YEAR(CURDATE())- YEAR(BIRTH))>14 AND (YEAR(CURDATE())- YEAR(BIRTH))<35
    AND diago.DIAGCODE=@diagcode
GROUP BY p.PID


 #end----------------------------------------------------------------------------------

#จำนวนผู้ป่วยความดันโลหิตสูงผู้ป่วยใน อายุระหว่าง 15-35 ปี
SET @hospcode='10725';
SET @diagcode='I10';

SELECT  p.PID,CONCAT(p.NAME,' ',p.LNAME) AS tname,p.CID,diagi.DIAGCODE,(YEAR(CURDATE())- YEAR(BIRTH) ) AS tage
FROM f43_person p 
LEFT JOIN f43_diagnosis_ipd diagi ON diagi.PID=p.PID
WHERE p.hospcode=@hospcode
			AND (YEAR(CURDATE())- YEAR(BIRTH))>14 AND (YEAR(CURDATE())- YEAR(BIRTH))<35
			AND diagi.DIAGCODE=@diagcode
GROUP BY p.PID
