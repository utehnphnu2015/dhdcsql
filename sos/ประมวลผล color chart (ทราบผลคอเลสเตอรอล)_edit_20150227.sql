set @start='2014-10-01';
set @end='2014-12-31';
set @bdg_date = '2014-09-30';

CREATE TABLE IF NOT EXISTS  `sys_ncd_cholesteral_colorchart` (
  `hospcode` varchar(5) NOT NULL DEFAULT '',
  `pid` varchar(15) NOT NULL DEFAULT '',
  `sex` char(1) DEFAULT NULL,
  `smoke` char(1) DEFAULT NULL,
  `chronic` varchar(6) DEFAULT NULL,
  `labtest` char(2) DEFAULT NULL,
  `labresult` float DEFAULT NULL,
  `date_serv` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sbp` int(11) DEFAULT NULL,
  `chart` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`hospcode`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DELETE FROM sys_ncd_cholesteral_colorchart WHERE date_serv BETWEEN @start and @end;

INSERT IGNORE INTO sys_ncd_cholesteral_colorchart 
(
  hospcode,pid,sex,smoke,chronic,labtest,labresult,date_serv,age,sbp,chart
)

 (     select person.hospcode,person.pid,person.sex,'N',chronic.chronic,la.labtest,la.labresult,bp.date_serv,TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) as age,bp.sbp,
        CASE 
             when SEX ='1' THEN
               CASE  
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) < 50 THEN
                     CASE
                        WHEN   ( sbp <140) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '<10%'
                                WHEN  (labresult >=320) THEN '<10%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=140 and sbp <160) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '<10%'
                                WHEN  (labresult >=320  ) THEN '10-<20%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=160 and sbp <180) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '10-<20%'
                                WHEN  (labresult >=320  ) THEN '20-<30%'
                           ELSE 'NA'
                           END  
                        WHEN   sbp >=180  THEN
                           CASE  
                                WHEN  labresult <200 THEN '10-<20%'
                                WHEN  (labresult >=200  and labresult <240) THEN '10-<20%'
                                WHEN  (labresult >=240  and labresult <280) THEN '20-<30%'
                                WHEN  (labresult >=280  and labresult <320) THEN '>=40%'   
                                WHEN  (labresult >=320  ) THEN '>=40%'   
                           ELSE 'NA'
                           END  /* sbp*/ 
                       END    /* 40*/

                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) BETWEEN 50 and 59 THEN
                     CASE
                        WHEN   ( sbp <140) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '<10%'
                                WHEN  (labresult >=320  ) THEN '<10%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=140 and sbp <160) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '<10%'
                                WHEN  (labresult >=320  ) THEN '10-<20%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=160 and sbp <180) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '10-<20%'
                                WHEN  (labresult >=320 ) THEN '20-<30%'
                           ELSE 'NA'
                           END  
                        WHEN   sbp >=180  THEN
                           CASE  
                                WHEN  labresult <200 THEN '10-<20%'
                                WHEN  (labresult >=200  and labresult <240) THEN '20-<30%'
                                WHEN  (labresult >=240  and labresult <280) THEN '20-<30%'
                                WHEN  (labresult >=280  and labresult <320) THEN '>=40%'   
                                WHEN  (labresult >=320  ) THEN '>=40%'   
                           ELSE 'NA'
                           END  /* sbp*/ 
                       END    /* 50*/
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) BETWEEN 60 and 69 THEN
                     CASE
                        WHEN   ( sbp <140) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '<10%'
                                WHEN  (labresult >=320  ) THEN '<10%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=140 and sbp <160) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '10-<20%'
                                WHEN  (labresult >=320  ) THEN '10-<20%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=160 and sbp <180) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '10-<20%'
                                WHEN  (labresult >=240  and labresult <280) THEN '10-<20%'
                                WHEN  (labresult >=280  and labresult <320) THEN '10-<20%'
                                WHEN  (labresult >=320  ) THEN '20-<30%'
                           ELSE 'NA'
                           END  
                        WHEN   sbp >=180  THEN
                           CASE  
                                WHEN  labresult <200 THEN '20-<30%'
                                WHEN  (labresult >=200  and labresult <240) THEN '20-<30%'
                                WHEN  (labresult >=240  and labresult <280) THEN '30-<40%'
                                WHEN  (labresult >=280  and labresult <320) THEN '>=40%'   
                                WHEN  (labresult >=320  ) THEN '>=40%'   
                           ELSE 'NA'
                           END  /* sbp*/ 
                      END     /* 60*/
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) >=70 THEN
                     CASE
                        WHEN   ( sbp <140) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '<10%'
                                WHEN  (labresult >=320  ) THEN '10-<20%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=140 and sbp <160) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '10-<20%'
                                WHEN  (labresult >=280  and labresult <320) THEN '10-<20%'
                                WHEN  (labresult >=320  ) THEN '10-<20%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=160 and sbp <180) THEN
                           CASE  
                                WHEN  labresult <200 THEN '10-<20%'
                                WHEN  (labresult >=200  and labresult <240) THEN '10-<20%'
                                WHEN  (labresult >=240  and labresult <280) THEN '10-<20%'
                                WHEN  (labresult >=280  and labresult <320) THEN '20-<30%'
                                WHEN  (labresult >=320  ) THEN '20-<30%'
                           ELSE 'NA'
                           END  
                        WHEN   sbp >=180  THEN
                           CASE  
                                WHEN  labresult <200 THEN '10-<20%'
                                WHEN  (labresult >=200  and labresult <240) THEN '10-<20%'
                                WHEN  (labresult >=240  and labresult <280) THEN '30-<40%'
                                WHEN  (labresult >=280  and labresult <320) THEN '>=40%'   
                                WHEN  (labresult >=320  ) THEN '>=40%'   
                           ELSE 'NA'
                           END  /* sbp*/ 
                    END  /* 70*/
           ELSE 'NA'
           END   /* sex =1*/  
             when SEX ='2' THEN
               CASE  
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) < 50 THEN
                     CASE
                        WHEN   ( sbp <140) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '<10%'
                                WHEN  (labresult >=320  ) THEN '10-<20%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=140 and sbp <160) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '10-<20%'
                                WHEN  (labresult >=320  ) THEN '20-<30%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=160 and sbp <180) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '10-<20%'
                                WHEN  (labresult >=280  and labresult <320) THEN '20-<30%'
                                WHEN  (labresult >=320  ) THEN '>=40%'  
                           ELSE 'NA'
                           END  
                        WHEN   sbp >=180  THEN
                           CASE  
                                WHEN  labresult <200 THEN '10-<20%'
                                WHEN  (labresult >=200  and labresult <240) THEN '20-<30%'
                                WHEN  (labresult >=240  and labresult <280) THEN '>=40%'   
                                WHEN  (labresult >=280  and labresult <320) THEN '>=40%'   
                                WHEN  (labresult >=320  ) THEN '>=40%'   
                           ELSE 'NA'
                           END  /* sbp*/ 
                       END    /* 40*/

                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) BETWEEN 50 and 59 THEN
                     CASE
                        WHEN   ( sbp <140) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '<10%'
                                WHEN  (labresult >=320  ) THEN '10-<20%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=140 and sbp <160) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '10-<20%'
                                WHEN  (labresult >=320  ) THEN '20-<30%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=160 and sbp <180) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN  '10-<20%'
                                WHEN  (labresult >=280  and labresult <320) THEN '20-<30%'
                                WHEN  (labresult >=320  ) THEN '>=40%' 
                           ELSE 'NA'
                           END  
                        WHEN   sbp >=180  THEN
                           CASE  
                                WHEN  labresult <200 THEN '20-<30%'
                                WHEN  (labresult >=200  and labresult <240) THEN '30-<40%'
                                WHEN  (labresult >=240  and labresult <280) THEN '>=40%'   
                                WHEN  (labresult >=280  and labresult <320) THEN '>=40%'   
                                WHEN  (labresult >=320  ) THEN '>=40%'   
                           ELSE 'NA'
                           END  /* sbp*/ 
                       END    /* 50*/
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) BETWEEN 60 and 69 THEN
                     CASE
                        WHEN   ( sbp <140) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '<10%'
                                WHEN  (labresult >=320  ) THEN '10-<20%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=140 and sbp <160) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '10-<20%'
                                WHEN  (labresult >=320  ) THEN '20-<30%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=160 and sbp <180) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '10-<20%'
                                WHEN  (labresult >=240  and labresult <280) THEN '10-<20%'
                                WHEN  (labresult >=280  and labresult <320) THEN '20-<30%'
                                WHEN  (labresult >=320  ) THEN '>=40%'   
                           ELSE 'NA'
                           END  
                        WHEN   sbp >=180  THEN
                           CASE  
                                WHEN  labresult <200 THEN '20-<30%'
                                WHEN  (labresult >=200  and labresult <240) THEN '30-<40%'
                                WHEN  (labresult >=240  and labresult <280) THEN '>=40%'   
                                WHEN  (labresult >=280  and labresult <320) THEN '>=40%'   
                                WHEN  (labresult >=320  ) THEN '>=40%'   
                           ELSE 'NA'
                           END  /* sbp*/ 
                      END     /* 60*/
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) >=70 THEN
                     CASE
                        WHEN   ( sbp <140) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '<10%'
                                WHEN  (labresult >=280  and labresult <320) THEN '<10%'
                                WHEN  (labresult >=320  ) THEN '10-<20%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=140 and sbp <160) THEN
                           CASE  
                                WHEN  labresult <200 THEN '<10%'
                                WHEN  (labresult >=200  and labresult <240) THEN '<10%'
                                WHEN  (labresult >=240  and labresult <280) THEN '10-<20%'
                                WHEN  (labresult >=280  and labresult <320) THEN '10-<20%'
                                WHEN  (labresult >=320  ) THEN '20-<30%'
                           ELSE 'NA'
                           END  
                        WHEN   (sbp >=160 and sbp <180) THEN
                           CASE  
                                WHEN  labresult <200 THEN '10-<20%'
                                WHEN  (labresult >=200  and labresult <240) THEN '10-<20%'
                                WHEN  (labresult >=240  and labresult <280) THEN '10-<20%'
                                WHEN  (labresult >=280  and labresult <320) THEN '20-<30%'
                                WHEN  (labresult >=320  ) THEN '>=40%'   
                           ELSE 'NA'
                           END  
                        WHEN   sbp >=180  THEN
                           CASE  
                                WHEN  labresult <200 THEN '20-<30%'
                                WHEN  (labresult >=200  and labresult <240) THEN '30-<40%'
                                WHEN  (labresult >=240  and labresult <280) THEN '>=40%'   
                                WHEN  (labresult >=280  and labresult <320) THEN '>=40%'   
                                WHEN  (labresult >=320  ) THEN '>=40%'   
                           ELSE 'NA'
                           END  /* sbp*/ 
                    END  /* 70*/
           ELSE 'NA'
           END   /* sex =2*/     
        
        ELSE 'NA' 
        END  as chart
        from chronic,person,
        (select l.hospcode,l.pid,l.date_serv,l.labtest,l.labresult from labfu l
         WHERE l.labtest = '07'
         group by l.hospcode,l.pid 
         order by l.date_serv desc ) as la,

        (select c.hospcode,c.pid,c.date_serv,c.SBP from chronicfu c
         group by c.hospcode,c.pid 
         order by c.date_serv desc ) as bp 

        where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' 
         and (chronic.hospcode = person.hospcode and chronic.pid = person.pid) 
         and (la.hospcode= chronic.hospcode and la.pid = chronic.pid)
         and (la.date_serv between @start and @end)
         and (bp.hospcode= chronic.hospcode and bp.pid = chronic.pid)
         and (bp.date_serv between @start and @end)
         and  ((chronic.chronic between 'I10' and 'I159') or (chronic.chronic between 'E10' and 'E149'))
         and (timestampdiff(year,person.birth,bp.date_serv) >= 35  ) );
