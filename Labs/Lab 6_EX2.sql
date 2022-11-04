DROP TABLE IMP;
drop table dip;

DROP TABLE SUMMARY;

CREATE TABLE IMP
(EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(10),
SAL NUMBER(7,2),
PRIMARY KEY(EMPNO));


CREATE TABLE SUMMARY
(JOB VARCHAR2(10),
NUM NUMBER,
PRIMARY KEY(JOB));


INSERT INTO IMP(EMPNO, ENAME, JOB, SAL) 
VALUES(1, 'VERDI', 'SECRETARY', 800);

INSERT INTO IMP(EMPNO, ENAME, JOB, SAL) 
VALUES(2, 'ROSSI', 'BANKER', 900);

INSERT INTO IMP(EMPNO, ENAME, JOB, SAL) 
VALUES(3, 'BIANCHI', 'BANKER', 1100);


INSERT INTO SUMMARY(JOB,NUM)
VALUES('SECRETARY',1);

INSERT INTO SUMMARY(JOB,NUM)
VALUES('BANKER',2);



/*In the SUMMARY table, the NUM attribute specifies the number of employees in the IMP table who
perform the same job. Write the triggers to guarantee the consistency between the IMP and SUMMARY
tables when:
• A new record is inserted in the IMP table
• The value of job in the IMP table is updated */

CREATE OR REPLACE TRIGGER updatesummary
after insert  ON  IMP 
FOR EACH ROW
DECLARE 
N NUMBER;
M NUMBER;

BEGIN 
-- check if there are other employees with the same job --
select count(*) into N
from summary
where job=:new.job;

 if(N=0) THEN
    --no other employees for the job --
    INSERT INTO SUMMARY(job, num)
    values( :new.job, 1);

ELSE
    -- there are other employees with the job --
   SELECT NUM into M
   FROM SUMMARY 
   WHERE job= :new.job;
   
   UPDATE SUMMARY
   SET NUM= M+1
   WHERE job= :new.job;
   
   END IF;
END;

SELECT * FROM IMP;
SELECT * FROM SUMMARY;

INSERT INTO IMP (EMPNO, ENAME, JOB, SAL) VALUES(4, 'NERI', 'CORRIERE', 750); 

SELECT * FROM IMP;
SELECT * FROM SUMMARY;

