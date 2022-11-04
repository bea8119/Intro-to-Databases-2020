drop table imp;
drop table dip;


REMARK
/* 
Creating table DIP 
*/  
CREATE TABLE DIP
 (DEPTNO  NUMBER(2) NOT NULL,
 DNAME    VARCHAR2(14),
 LOC      VARCHAR2(14),
 MINSAL   NUMBER(7,2),
 MAXSAL   NUMBER(7,2),
 PRIMARY KEY(DEPTNO));


/* 
Creating table IMP 
*/

CREATE TABLE IMP
 (EMPNO   NUMBER(4) NOT NULL,
 DEPTNO   NUMBER(2),
 ENAME    VARCHAR2(10),
 JOB      VARCHAR2(9),
 SAL      NUMBER(7,2),
 PRIMARY KEY(EMPNO),
 FOREIGN KEY(DEPTNO) REFERENCES DIP(DEPTNO) ON DELETE CASCADE);


REMARK
/*
Inserting data into tables.
*/

INSERT INTO DIP (DEPTNO, DNAME, LOC, MINSAL, MAXSAL)
       VALUES (10, 'ACCOUNTING', 'NEW YORK',100,2500);

INSERT INTO DIP (DEPTNO, DNAME, LOC, MINSAL, MAXSAL)
       VALUES (20, 'RESEARCH', 'DALLAS',150,3000);
       
INSERT INTO DIP (DEPTNO, DNAME, LOC, MINSAL, MAXSAL)
       VALUES (30, 'SALES', 'CHICAGO',120,2500);
       
INSERT INTO DIP (DEPTNO, DNAME, LOC, MINSAL, MAXSAL)
       VALUES (40, 'OPERATIONS', 'BOSTON',200,2100);


INSERT INTO IMP (EMPNO, ENAME, JOB, SAL, DEPTNO)
       VALUES (7000, 'SMITH', 'CLERK', 850, 10);


INSERT INTO IMP (EMPNO, ENAME, JOB, SAL, DEPTNO)
       VALUES (7010, 'SCOTT', 'ANALYST', 1600, 10);


INSERT INTO IMP (EMPNO, ENAME, JOB, SAL, DEPTNO)
       VALUES (7020, 'BLAKE', 'SALESMAN', 1400, 10);


INSERT INTO IMP (EMPNO, ENAME, JOB, SAL, DEPTNO)
       VALUES (7030, 'SMITH', 'MANAGER', 2500, 10);



INSERT INTO IMP (EMPNO, ENAME, JOB, SAL, DEPTNO)
       VALUES (7040, 'SMITH', 'CLERK', 800, 20);


INSERT INTO IMP (EMPNO, ENAME, JOB, SAL, DEPTNO)
       VALUES (7050, 'SCOTT', 'ANALYST', 1600, 20);



INSERT INTO IMP (EMPNO, ENAME, JOB, SAL, DEPTNO)
       VALUES (7060, 'ADAMS', 'CLERK', 900, 30);


INSERT INTO IMP (EMPNO, ENAME, JOB, SAL, DEPTNO)
       VALUES (7070, 'JAMES', 'CLERK', 1000, 30);

INSERT INTO IMP (EMPNO, ENAME, JOB, SAL, DEPTNO)
       VALUES (7080, 'ALLEN', 'CLERK', 850, 40);
       
       
       select * from imp, dip where imp.deptno=dip.deptno;
       
       
      /* exercise 1 */
      
  /*    Write the trigger which manages the update of the DNAME attribute on DIP table. When the DNAME
attribute changes from ‘ACCOUNTING’ to ‘SALES’, the wage (SAL attribute) for all employees, who work in
the corresponding DEPTNO, is increased by 100. */

CREATE OR REPLACE TRIGGER updName
 After update of dname on dip
 for each row
 when (OLD.dname= 'ACCOUNTING' AND NEW.dname= 'SALES')
 begin
 update imp
 set sal = sal +100
 where deptno= :NEW.deptno;
 end;
 
  select * from imp;
  select * from dip;
 
 UPDATE DIP SET DNAME = 'SALES' WHERE DNAME='ACCOUNTING';

 select * from imp;
  select * from dip;


DROP TABLE IMP;
drop table dip;