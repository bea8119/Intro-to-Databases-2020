drop table PENALTIES;
drop table COMPANYDEL;
drop table COMPANIES;
drop table DELIVERERS;

CREATE TABLE DELIVERERS
(DELIVERERID  SMALLINT NOT NULL,
 NAME   CHAR(15) NOT NULL,
 INITIALS  CHAR(3),
 YEAR_OF_BIRTH SMALLINT,
 SEX   CHAR(1),
 YEAR_JOINED  SMALLINT NOT NULL,
 STREET  CHAR(15) NOT NULL,
 HOUSENO  CHAR(4),
 POSTCODE  CHAR(6),
 TOWN   CHAR(10) NOT NULL,
 CELLNO  CHAR(10),
 PHONENO CHAR(4),
 PRIMARY KEY(DELIVERERID)
 );

CREATE TABLE COMPANIES
 (COMPANYID  SMALLINT NOT NULL,
 DELIVERERID  SMALLINT NOT NULL,
 MANDATE  CHAR(6) NOT NULL,
 PRIMARY KEY(COMPANYID),
 FOREIGN KEY(DELIVERERID) REFERENCES DELIVERERS(DELIVERERID)
 );

CREATE TABLE COMPANYDEL
 (COMPANYID  SMALLINT NOT NULL ,
 DELIVERERID  SMALLINT NOT NULL,
 NUMDELIVERIES   SMALLINT NOT NULL,
 NUMCOLLECTIONS   SMALLINT NOT NULL,
 PRIMARY KEY (COMPANYID,DELIVERERID),
 FOREIGN KEY(DELIVERERID) REFERENCES DELIVERERS(DELIVERERID),
 FOREIGN KEY(COMPANYID) REFERENCES COMPANIES(COMPANYID)
 );

CREATE TABLE PENALTIES
 (PAYMENTID INTEGER NOT NULL,
 DELIVERERID  SMALLINT NOT NULL,
 DATA   DATE NOT NULL,
 AMOUNT  DECIMAL(7,2)   NOT NULL,
 PRIMARY KEY(PAYMENTID),
 FOREIGN KEY(DELIVERERID) REFERENCES DELIVERERS(DELIVERERID)
  );

REMARK

/*
Inserimento dati nelle tabelle.
*/

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO,PHONENO)
       VALUES (2,'Everett','R',1948,'M',1975,'Stoney Road','43','3575NH','Stratford','070-237893','2411');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO,PHONENO)
       VALUES (6,'Parmenter','R',1964,'M',1977,'Haseltine Lane','80','1234KK','Stratford','070-476537','8467');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO,PHONENO)
       VALUES (8,'Newcastle','B',1962,'F',1980,'Station Road','4','6584WO','Inglewood','070-476573','2983');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO,PHONENO)
       VALUES (27,'Collins','DD',1964,'F',1983,'Long Drive','804','8457DK','Eltham','079-234857','2513');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO,PHONENO)
       VALUES (44,'Baker','E',1963,'M',1980,'Lewis Street','23','4444LJ','Inglewood','070-368753','1124');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO,PHONENO)
       VALUES (57,'Brown','M',1971,'M',1985,'Edgecombe Way','16','4377CB','Stratford','070-473458','6409');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO,PHONENO)
       VALUES (83,'Hope','PK',1956,'M',1982,'Magdalene Road','16a','1812UP','Stratford','070-353548','1608');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO,PHONENO)
       VALUES (100,'Parmenter','P',1963,'M',1979,'Haseltine Lane','80','1234KK','Stratford','070-476537','6524');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO,PHONENO)
       VALUES (104,'Moorman','D',1970,'F',1984,'Stout Street','65','9437AO','Eltham','079-987571','7060');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO,PHONENO)
       VALUES (112,'Bailey','IP',1963,'F',1984,'Vixen Road','8','6392LK','Plymouth','010-54874','1319');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO)
       VALUES (7,'Wise','GWS',1963,'M',1981,'Edgecombe Way','39','9758VB','Stratford','070-347689');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO)
       VALUES (28,'Collins','C',1963,'F',1983,'Old Main Road','10','1294QK','Midhurst','010-659599');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO)
       VALUES (39,'Bishop','D',1956,'M',1980,'Eaton Square','78','9629CD','Stratford','070-393435');

INSERT INTO DELIVERERS (DELIVERERID,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,CELLNO)
       VALUES (95,'Miller','P',1934,'M',1972,'High Street','33a','5746OP','Douglas','070-867564');

INSERT INTO COMPANIES (COMPANYID, DELIVERERID, MANDATE)
       VALUES ( 1, 6, 'first');

INSERT INTO COMPANIES (COMPANYID, DELIVERERID, MANDATE)
       VALUES ( 2, 27, 'second');

INSERT INTO COMPANYDEL
       VALUES (1,2,4,8);

INSERT INTO COMPANYDEL
       VALUES (1,6,9,1);

INSERT INTO COMPANYDEL
       VALUES (1,8,0,1);

INSERT INTO COMPANYDEL
       VALUES (1,44,7,5);

INSERT INTO COMPANYDEL
       VALUES (1,57,5,0);

INSERT INTO COMPANYDEL
       VALUES (1,83,3,3);

INSERT INTO COMPANYDEL
       VALUES (2,8,4,4);

INSERT INTO COMPANYDEL
       VALUES (2,27,11,2);
	   
INSERT INTO COMPANYDEL
       VALUES (2,104,8,4);
	   
INSERT INTO COMPANYDEL
       VALUES (2,112,4,8);

INSERT INTO PENALTIES 
       VALUES (1,6,TO_DATE('12/08/1980','DD/MM/YYYY'),100);
	   
INSERT INTO PENALTIES 
      VALUES (2,44,TO_DATE('05/05/1981','DD/MM/YYYY'),75);
	   
INSERT INTO PENALTIES 
       VALUES (3,27,TO_DATE('10/9/1983','DD/MM/YYYY'),100);
	   
INSERT INTO PENALTIES 
       VALUES (4,104,TO_DATE('08/12/1984','DD/MM/YYYY'),50);
	   
INSERT INTO PENALTIES 
       VALUES (5,44,TO_DATE('8/12/1980','DD/MM/YYYY'),25);
	   
INSERT INTO PENALTIES 
       VALUES (6,8,TO_DATE('08/12/1980','DD/MM/YYYY'),25);
	   
INSERT INTO PENALTIES 
       VALUES (7,44,TO_DATE('30/12/1982','DD/MM/YYYY'),30);
	   
INSERT INTO PENALTIES 
       VALUES (8,27,TO_DATE('12/11/1984','DD/MM/YYYY'),75);
	   
       //1
SELECT *
FROM deliverers;


    //2
SELECT distinct COMPANYID
FROM companydel
WHERE numcollections!= 0
OR numdeliveries!=0;

//3
SELECT  name, delivererid
FROM deliverers
WHERE name like 'B%';

//4
SELECT name, sex, delivererid
FROM deliverers
WHERE phoneno!=8467
OR phoneno is null;

//5
SELECT distinct name, town
FROM deliverers d, penalties  p
WHERE d.delivererid=p.delivererid;

//6
SELECT distinct name, initials 
FROM DELIVERERS d, PENALTIES p, companies c
WHERE c.delivererid=d.delivererid AND p.delivererid=d.delivererid
AND p.data> TO_DATE('31/12/1980', 'DD/MM/YYYY')
ORDER BY name;

//7
SELECT d.delivererid, c.companyid 
FROM companydel c, deliverers d 
WHERE c.delivererid=d.delivererid
AND town='Stratford'
AND numdeliveries>=1
AND numcollections>=2;

// 8
SELECT DISTINCT d.delivererid
FROM deliverers d, companies c, companydel cd
WHERE d.delivererid=cd.delivererid 
AND  c.companyid=cd.companyid
AND year_of_birth>1962
AND mandate='first'
ORDER BY d.delivererid DESC;


//9
SELECT  DISTINCT name
FROM deliverers d, companydel c
WHERE d.delivererid=c.delivererid
AND (town='Inglewood' OR town='Stratford')
GROUP BY d.delivererid, name
HAVING count(companyid)>=2;

//10
SELECT D.DELIVERERID, SUM (AMOUNT)
FROM DELIVERERS d, PENALTIES p
WHERE d.delivererid=p.delivererid
AND town='Inglewood'
GROUP BY d.delivererid 
HAVING COUNT(*)>1;

//11
SELECT name,  MIN(amount)
FROM deliverers d, penalties p
WHERE d.delivererid=p.delivererid
GROUP BY d.delivererid, d.name
HAVING (COUNT(*)>1 AND COUNT(*)<4) ;

//12

SELECT SUM(numdeliveries), SUM(numcollections)
FROM companydel cd, deliverers d
WHERE cd.delivererid=d.delivererid
AND name like 'B%'
AND town<>'Stratford';
