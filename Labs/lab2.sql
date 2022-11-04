/*1. Find the identification codes, the names and the initials (attribute INITIALS) of
the deliverers that have never been fined. */
SELECT delivererid, name, initials
FROM deliverers d
WHERE delivererid not in (SELECT  delivererid
                            FROM penalties);
                            
                            
/*2. Find the identification codes of all deliverers that have received at least one
25-Euro fine and at least one 30-Euro fine.*/
                            
 SELECT distinct delivererid 
 FROM penalties p 
 WHERE delivererid in (  SELECT delivererid
                            FROM penalties  
                             WHERE amount=25 )
    AND delivererid in (  SELECT delivererid
                            FROM penalties  
                             WHERE amount=30 );
                             
                             
/*3. Find the identification codes and the names of the deliverers who have received
more than one fine on the same date.*/


  SELECT d.delivererid, d.name
  FROM deliverers d, penalties p
  WHERE d.delivererid=p.delivererid
    GROUP BY d.delivererid, data, d. name
   having count(*)>1  ;
   
   
   
/*4. Find the identification codes of the deliverers that have serviced requests from
all of the firms in table COMPANIES (N.B. A deliverer has serviced a request
from a firm if he/she has delivered/collected parcels to/from the firm at least
once).*/

select delivererid
  FROM companydel
  group by delivererid 
  having count(distinct companyid) = ( select count(distinct  companyid)
          FROM companies);
                        
/*5. Find the identification codes of the deliverers who have delivered (or collected)
parcels to (from) at least one firm where deliverer no. 57 has delivered or
collected parcels.*/

SELECT delivererid 
FROM companydel 
WHERE companyid in( SELECT distinct companyid
                        FROM companydel
                        where delivererid=57);


/*6. Find the identification codes and the names of the deliverers whose number of
fines received in 19801 is greater than the number of fines received in 1981
(by the same deliverer).*/


SELECT d.delivererid, name
FROM deliverers d, penalties p
WHERE d.delivererid=p.delivererid
GROUP BY d.delivererid, name
HAVING (SELECT count(*) FROM penalties p1 WHERE data>TO_DATE('01/01/1980', 'DD/MM/YYYY')
                                            AND data<=TO_DATE('31/12/1980', 'DD/MM/YYYY')
                                            AND d.delivererid=p1.delivererid)
      >(SELECT count(*) FROM penalties p2 WHERE data>TO_DATE('01/01/1981', 'DD/MM/YYYY') 
                                            AND data<=TO_DATE('31/12/1981', 'DD/MM/YYYY')
                                            AND d.delivererid=p2.delivererid);


/*7. Find the identification code of the deliverer who has received the highest
number of fines.*/

SELECT delivererid
FROM penalties p
GROUP BY delivererid
HAVING count(*)=
(SELECT max(numpenalties) FROM (SELECT count(*) as numpenalties FROM penalties GROUP BY delivererid ));


/*8. Find the identification codes of the deliverers who have delivered (or collected)
parcels to (from) all of the firms in which deliverer no. 57 has delivered or
collected parcels*/

SELECT delivererid 
FROM companydel 
WHERE companyid in( SELECT distinct companyid
                        FROM companydel
                        where delivererid=57)
GROUP BY delivererid
HAVING count(*)=( SELECT count(*) 
                        FROM companydel
                        where delivererid=57);


/*9. Find the identification codes of the deliverers who have only delivered (or
collected) parcels to (from) firms in which deliverer no. 57 has delivered or
collected parcels.*/


SELECT distinct delivererid 
FROM companydel 
WHERE delivererid not in( SELECT delivererid
                          FROM companydel
                           WHERE companyid not in (SELECT distinct companyid
                                 FROM companydel
                                 where delivererid=57));


/*10. Find the identification codes of the deliverers who have delivered (or
collected) parcels to (from) all of the firms in which deliverer no. 57 has
delivered or collected parcels, and only to (from) such firms (i.e., to/from no
other firms than those visited by deliverer no. 57).*/

SELECT distinct delivererid 
FROM companydel 
WHERE delivererid not in( SELECT delivererid
                          FROM companydel
                           WHERE companyid  not in (SELECT distinct companyid
                                 FROM companydel
                                 where delivererid=57))
GROUP BY  delivererid
HAVING count(*)=( SELECT count(*) 
                        FROM companydel
                        where delivererid=57);                              
                                 



/*LAB 3 PT 1*/

/*1. For each deliverer that has received at least two fines, find the identification code
(of the deliverer), the date of the first fine and the date of the last fine.*/


select delivererid, min(data), max(data)
                    FROM penalties
                    GROUP BY delivererid
                    having count(*)>=2;
                        

/*2. For each deliverer that has been fined, find the identification code, the date of the
last fine he/she received and the amount of this fine.*/

select delivererid, data, amount 
FROM penalties p1
WHERE p1.data= (select max(data)
                from penalties p2
                where p2.delivererid=p1.delivererid);

/* 3. Find the identification codes of companies where more than 30% of the deliverers in the database
have performed at least one delivery or one collection. */

select companyid
from companydel 
group by companyid
having count(*) > (select 0.3*count(*)
                    FROM deliverers);
                    








