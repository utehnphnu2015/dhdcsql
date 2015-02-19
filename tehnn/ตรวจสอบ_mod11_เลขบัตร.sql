
set @mon = '2013-10';
SELECT @mon as mon,h.hoscode,
(SELECT COUNT(t.CID) from person t WHERE t.HOSPCODE = h.hoscode ) as total
,(SELECT COUNT(t.cid) from person t WHERE t.HOSPCODE = h.hoscode and  mod11(t.cID)=1) as total
,(SELECT COUNT(t.cid) from person t WHERE t.HOSPCODE = h.hoscode and  mod11(t.cID)=0) as total
FROM  chospital_amp h