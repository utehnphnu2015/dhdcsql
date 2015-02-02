
SELECT t0.HOSPCODE,t0.HNAME 
                            ,t0.male,t0.female,t0.total,t0.nhouse
                            FROM 
                            (
                            SELECT p.HOSPCODE,o.off_name as HNAME
                            ,sum(if(p.SEX='1',1,0)) as male
                            ,sum(if(p.SEX='2',1,0)) as female
                            ,sum(if(p.SEX in ('1','2'),1,0)) as total
                            ,count(DISTINCT h.HOSPCODE,h.HID)  as nhouse  
                            FROM person p
                            LEFT JOIN home h
                            ON p.HOSPCODE=h.HOSPCODE AND p.HID=h.HID 
                            LEFT JOIN co_office o
                            ON p.HOSPCODE=o.off_id 
                            WHERE p.TYPEAREA in ('1','3') 
                            AND p.DISCHARGE in ('9','')
                            GROUP BY p.HOSPCODE
                            ORDER BY o.subdistid,p.HOSPCODE
                            ) as t0