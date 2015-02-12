SET @start_d:='20141001';
SET @date_3:='20141001';
SET @end_d:='20150930';

SELECT distcode,tb2.HOSPCODE,tb2.CID,b.name,b.lname,b.TYPEAREA,tb2.GRAVIDA,tb2.m,a.g1_ga
FROM (
SELECT l.HOSPCODE,l.CID,l.GRAVIDA,l.BDATE,DATE_FORMAT(l.BDATE,'%m') m
FROM tmp_labor l
WHERE l.BDATE BETWEEN @start_d AND @end_d
GROUP BY l.CID,l.GRAVIDA
) tb2
LEFT JOIN (
SELECT  SQL_BIG_RESULT 
*
FROM
(
SELECT
		a.cid,a.BIRTH,a.SEX,a.NATION,a.OCCUPATION_NEW,b.max_gravida as gravida
		,g6.bdate,g6.bhosp,g6.hospcode as input_bhosp
		,g1.ga as g1_ga,g1.date_serv as g1_date,g1.ancplace as g1_hospcode,g1.hospcode as input_hosp1
		,g2.ga as g2_ga,g2.date_serv as g2_date,g2.ancplace as g2_hospcode,g2.hospcode as input_hosp2
		,g3.ga as g3_ga,g3.date_serv as g3_date,g3.ancplace as g3_hospcode,g3.hospcode as input_hosp3
		,g4.ga as g4_ga,g4.date_serv as g4_date,g4.ancplace as g4_hospcode,g4.hospcode as input_hosp4
		,g5.ga as g5_ga,g5.date_serv as g5_date,g5.ancplace as g5_hospcode,g5.hospcode as input_hosp5

FROM
	(SELECT 
			pe.cid,pe.BIRTH,pe.SEX,pe.NATION,pe.OCCUPATION_NEW
	FROM
				tmp_anc as tt,t_person_cid as pe
	WHERE
			 tt.CID=pe.CID 
			AND tt.DATE_SERV BETWEEN @date_3 AND @end_d
	GROUP BY 
			pe.CID
	) as a
LEFT JOIN
	(
	SELECT 
			cid,MAX(GRAVIDA) as max_gravida
	FROM
		tmp_anc
	GROUP BY cid
	) as b ON a.cid=b.cid
LEFT JOIN
	(
	SELECT 
			cid,date_serv ,gravida,ancplace,ga,hospcode
	FROM
		tmp_anc
	WHERE
			ga <= 12 
	GROUP BY cid,gravida
	)	 as g1 ON a.cid=g1.cid AND g1.gravida=b.max_gravida
LEFT JOIN
	(
	SELECT 
			cid,date_serv ,gravida,ancplace,ga,hospcode
	FROM
		tmp_anc
	WHERE
			 ga BETWEEN 13 AND 20 
	GROUP BY cid,gravida
	)	 as g2 ON a.cid=g2.cid AND g2.gravida=b.max_gravida
LEFT JOIN
	(
	SELECT 
			cid,date_serv,gravida,ancplace,ga,hospcode
	FROM
		tmp_anc
	WHERE
			ga BETWEEN 21 AND 28 
	GROUP BY cid,gravida
	)	 as g3 ON a.cid=g3.cid AND g3.gravida=b.max_gravida
LEFT JOIN
	(
	SELECT 
			cid,date_serv,gravida,ancplace,ga,hospcode
	FROM
		tmp_anc
	WHERE
			 ga BETWEEN 29 AND 35 
	GROUP BY cid,gravida
	)	 as g4 ON a.cid=g4.cid AND g4.gravida=b.max_gravida
LEFT JOIN
	(
	SELECT 
			cid,date_serv,gravida,ancplace,ga,hospcode
	FROM
		tmp_anc
	WHERE
			ga BETWEEN 36 AND 40 
	GROUP BY cid,gravida
	)	 as g5 ON a.cid=g5.cid AND g5.gravida=b.max_gravida
LEFT JOIN
	(
	SELECT 
			cid,bdate,gravida,bhosp,hospcode
	FROM
		tmp_labor
	WHERE
			bdate BETWEEN @start_d AND @end_d
	GROUP BY cid,gravida
	)	 as g6 ON a.cid=g6.cid AND g6.gravida=b.max_gravida

UNION

SELECT
		c.cid,c.BIRTH,c.SEX,c.NATION,c.OCCUPATION_NEW,d.max_gravida as gravida
		,g12.bdate,g12.bhosp,g12.hospcode as input_bhosp
		,g7.ga as g1_ga,g7.date_serv as g1_date,g7.ancplace as g1_hospcode,g7.hospcode as input_hosp1
		,g8.ga as g2_ga,g8.date_serv as g2_date,g8.ancplace as g2_hospcode,g8.hospcode as input_hosp2
		,g9.ga as g3_ga,g9.date_serv as g3_date,g9.ancplace as g3_hospcode,g9.hospcode as input_hosp3
		,g10.ga as g4_ga,g10.date_serv as g4_date,g10.ancplace as g4_hospcode,g10.hospcode as input_hosp4
		,g11.ga as g5_ga,g11.date_serv as g5_date,g11.ancplace as g5_hospcode,g11.hospcode as input_hosp5

FROM
	(SELECT 
			pe.cid,pe.BIRTH,pe.SEX,pe.NATION,pe.OCCUPATION_NEW
	FROM
				tmp_anc as tt,t_person_cid as pe
	WHERE
			 tt.CID=pe.CID 
			AND tt.DATE_SERV BETWEEN @date_3 AND @end_d
	GROUP BY 
			pe.CID
	) as c
LEFT JOIN
	(
	SELECT 
			cid,MAX(GRAVIDA)-1 as max_gravida
	FROM
		tmp_anc
	GROUP BY cid
	) as d ON c.cid=d.cid
LEFT JOIN
	(
	SELECT 
			cid,date_serv ,gravida,ancplace,ga,hospcode
	FROM
		tmp_anc
	WHERE
			ga <= 12 
	GROUP BY cid,gravida
	)	 as g7 ON c.cid=g7.cid AND g7.gravida=d.max_gravida
LEFT JOIN
	(
	SELECT 
			cid,date_serv ,gravida,ancplace,ga,hospcode
	FROM
		tmp_anc
	WHERE
			 ga BETWEEN 13 AND 20 
	GROUP BY cid,gravida
	)	 as g8 ON c.cid=g8.cid AND g8.gravida=d.max_gravida
LEFT JOIN
	(
	SELECT 
			cid,date_serv,gravida,ancplace,ga,hospcode
	FROM
		tmp_anc
	WHERE
			ga BETWEEN 21 AND 28 
	GROUP BY cid,gravida
	)	 as g9 ON c.cid=g9.cid AND g9.gravida=d.max_gravida
LEFT JOIN
	(
	SELECT 
			cid,date_serv,gravida,ancplace,ga,hospcode
	FROM
		tmp_anc
	WHERE
			 ga BETWEEN 29 AND 35 
	GROUP BY cid,gravida
	)	 as g10 ON c.cid=g10.cid AND g10.gravida=d.max_gravida
LEFT JOIN
	(
	SELECT 
			cid,date_serv,gravida,ancplace,ga,hospcode
	FROM
		tmp_anc
	WHERE
			ga BETWEEN 36 AND 40 
	GROUP BY cid,gravida
	)	 as g11 ON c.cid=g11.cid AND g11.gravida=d.max_gravida
LEFT JOIN
	(
	SELECT 
			cid,bdate,gravida,bhosp,hospcode
	FROM
		tmp_labor
	WHERE
			bdate BETWEEN @start_d AND @end_d
	GROUP BY cid,gravida
	)	 as g12 ON c.cid=g12.cid AND g12.gravida=d.max_gravida
WHERE d.max_gravida >0 AND g12.bdate is not null
) as dd
ORDER BY cid
) a ON tb2.CID=a.cid AND round(tb2.GRAVIDA)=round(a.gravida)
left join (
SELECT SQL_BIG_RESULT 
			p.*,age(DATE_FORMAT(CONCAT(@b_year,'0701'),'%Y%m%d'),birth,'y') as age_y
		FROM
			t_person_db p
		WHERE LENGTH(TRIM(p.cid))=13 AND p.TYPEAREA in('1','3')
		ORDER BY  p.D_UPDATE DESC ,p.TYPEAREA ASC
) b on tb2.cid=b.cid
left join chospital on tb2.HOSPCODE=chospital.hoscode 
GROUP BY tb2.HOSPCODE,tb2.CID,tb2.GRAVIDA
ORDER BY cid
