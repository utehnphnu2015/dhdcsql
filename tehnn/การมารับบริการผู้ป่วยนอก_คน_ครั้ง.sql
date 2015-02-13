
set @selyear = selyear;
set @pyear = @year-1;

select h.hoscode,h.hosname,
(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@pyear,'10')) as oct,
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@pyear,'10')) as oct1,

(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@pyear,'11')) as nov,
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@pyear,'11')) as nov1,

(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@pyear,'12')) as 'dec',
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@pyear,'12')) as 'dec1',

(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'01')) as jan,
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'01')) as jan1,

(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'02')) as feb,
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'02')) as feb1,

(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'03'))as mar,
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'03'))as mar1,

(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'04'))as apr,
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'04'))as apr1,

(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'05'))as may,
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'05'))as may1,

(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'06'))as jun,
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'06'))as jun1,

(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'07'))as jul,
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'07'))as jul1,

(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'08'))as aug,
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'08'))as aug1,

(SELECT COUNT(DISTINCT s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'09'))as sep,
(SELECT COUNT(s.pid) FROM service s 
where s.HOSPCODE = h.hoscode and EXTRACT(YEAR_MONTH FROM s.DATE_SERV)= CONCAT(@selyear,'09'))as sep1

from chospital_amp h;