set @start='2014-10-01';
set @end='2014-12-31';
set @bdg_date = '2014-09-30';

CREATE TABLE  IF NOT EXISTS `s_ncd_nocholesteral_colorchart` (
  `hospcode` varchar(5) NOT NULL DEFAULT '',
  `pid` varchar(15) NOT NULL DEFAULT '',
  `sex` char(1) DEFAULT NULL,
  `smoke` char(1) DEFAULT NULL,
  `chronic` varchar(6) DEFAULT NULL,
  `date_serv` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sbp` int(11) DEFAULT NULL,
  `chart` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`hospcode`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DELETE FROM s_ncd_nocholesteral_colorchart WHERE date_serv BETWEEN @start and @end;

INSERT IGNORE INTO s_ncd_nocholesteral_colorchart 
(
  hospcode,pid,sex,smoke,chronic,date_serv,age,sbp,chart
)

 (      select person.hospcode,person.pid,person.sex,'N',chronic.chronic,bp.date_serv,TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) as age,bp.sbp,
        CASE 
             when SEX ='1' THEN
               CASE  
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) < 50 THEN
                     CASE
                        WHEN   ( sbp <140) THEN    '<10%'
                        WHEN   (sbp >=140 and sbp <160) THEN   '<10%'
                        WHEN   (sbp >=160 and sbp <180) THEN   '<10%'
                         WHEN   sbp >=180  THEN   '10-<20%'
                      END    /* 40*/
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) BETWEEN 50 and 59 THEN
                     CASE
                        WHEN   ( sbp <140) THEN   '<10%'
                        WHEN   (sbp >=140 and sbp <160) THEN   '<10%'
                        WHEN   (sbp >=160 and sbp <180) THEN   '<10%'
                        WHEN   sbp >=180  THEN   '20-<30%'
                     END    /* 50*/
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) BETWEEN 60 and 69 THEN
                     CASE
                        WHEN   ( sbp <140) THEN   '<10%'
                        WHEN   (sbp >=140 and sbp <160) THEN   '<10%'
                        WHEN   (sbp >=160 and sbp <180) THEN   '10-<20%'
                        WHEN   sbp >=180  THEN   '20-<30%'
                     END     /* 60*/
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) >=70 THEN
                     CASE
                        WHEN   ( sbp <140) THEN   '<10%'
                        WHEN   (sbp >=140 and sbp <160) THEN   '<10%'
                        WHEN   (sbp >=160 and sbp <180) THEN    '10-<20%'
                        WHEN   sbp >=180  THEN   '20-<30%'
                    END  /* 70*/
           ELSE 'NA'
           END   /* sex =1*/  
             when SEX ='2' THEN
               CASE  
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) < 50 THEN
                     CASE
                        WHEN   ( sbp <140) THEN    '<10%'
                        WHEN   (sbp >=140 and sbp <160) THEN   '<10%'
                        WHEN   (sbp >=160 and sbp <180) THEN   '<10%'
                         WHEN   sbp >=180  THEN   '10-<20%'
                      END    /* 40*/
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) BETWEEN 50 and 59 THEN
                     CASE
                        WHEN   ( sbp <140) THEN   '<10%'
                        WHEN   (sbp >=140 and sbp <160) THEN   '<10%'
                        WHEN   (sbp >=160 and sbp <180) THEN   '<10%'
                        WHEN   sbp >=180  THEN   '20-<30%'
                     END    /* 50*/
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) BETWEEN 60 and 69 THEN
                     CASE
                        WHEN   ( sbp <140) THEN   '<10%'
                        WHEN   (sbp >=140 and sbp <160) THEN   '<10%'
                        WHEN   (sbp >=160 and sbp <180) THEN   '10-<20%'
                        WHEN   sbp >=180  THEN   '20-<30%'
                     END     /* 60*/
                   WHEN   TIMESTAMPDIFF(YEAR,person.birth,bp.date_serv) >=70 THEN
                     CASE
                        WHEN   ( sbp <140) THEN   '<10%'
                        WHEN   (sbp >=140 and sbp <160) THEN   '<10%'
                        WHEN   (sbp >=160 and sbp <180) THEN    '10-<20%'
                        WHEN   sbp >=180  THEN   '20-<30%'
                    END  /* 70*/           ELSE 'NA'
           END   /* sex =2*/     
        
        ELSE 'NA' 
        END  as chart
        from chronic,person,

        (select c.hospcode,c.pid,c.date_serv,c.SBP from chronicfu c
         group by c.hospcode,c.pid 
         order by c.date_serv desc ) as bp 

        where person.discharge = '9' and person.typearea in ('1', '3') and person.nation ='099' 
         and (chronic.hospcode = person.hospcode and chronic.pid = person.pid) 
         and (bp.hospcode= chronic.hospcode and bp.pid = chronic.pid)
         and (bp.date_serv between @start and @end)
         and  ((chronic.chronic between 'I10' and 'I15') or (chronic.chronic between 'E10' and 'E14'))
         and (timestampdiff(year,person.birth,@bdg_date) between 35 and 59 ) );
