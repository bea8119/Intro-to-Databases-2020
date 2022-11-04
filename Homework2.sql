Beatrice Piras - s259888     

Homework 2 


EX 1

a)

SELECT Name, Surname, Datetour, count(GTCO.tourtypecode), sum(Duration)
       FROM type_of_tour tot,GUIDED_TOUR_CARRIED_OUT GTCO, tour_guide tg
       WHERE GTCO.TourTypeCode=tot.tourtypecode
            AND GTCO.guidecode=tg.guidecode
            AND GTCO.guidecode NOT IN ( SELECT guidecode
                                    FROM GUIDED_TOUR_CARRIED_OUT GTCO2, groupp g
                                    WHERE GTCO2.groupcode=g.groupcode
                                    AND lang='fr')
        Group by Name, Surname, Datetour;
        
        
			
b)
    SELECT Monument, sum(NumberOParticipants)
    FROM type_of_tour tot,GUIDED_TOUR_CARRIED_OUT gtco, groupp g
    WHERE gtco.groupcode=g.groupcode
        AND gtco.tourtypecode=tot.tourtypecode
        AND Monument IN ( SELECT DISTINCT Monument
                            FROM GUIDED_TOUR_CARRIED_OUT gtco2, type_of_tour tot2
                            WHERE gtco2.tourtypecode=tot2.tourtypecode
                            GROUP BY Monument
                            HAVING count(gtco2.tourtypecode)>=10)
    GROUP BY Monument
    ORDER BY sum(NumberOParticipants) DESC;
	
	
	
	
EX 2
/*For the role of the primary keys in experiment, 
I assumed each student could only do one experiment per day 
with the same device in the same laboratory, hence i used 
'date' to count*/

a)

SELECT DeviceName, LabName, Name, count(Date)
FROM  Device d, Laboratory l, Experiment e
WHERE l.LabId=d.LabId 
AND d.DeviceId=e.DeviceId
AND s.StudentId=e.StudentId
AND d.DeviceId in (SELECT DeviceId
					FROM Experiment
					Group by DeviceId
					Having count(*)>=10)
Group by DeviceName, LabName, Name 



b)

SELECT LAbID, LabName, Date
FROM Device d, Laboratory l, Experiment e 
WHERE l.LabId=d.LabId 
AND d.DeviceId=e.DeviceId
AND d.LabId in( SELECT LabId
				FROM Student s2, Device d2,  Experiment e2 
				WHERE d.DeviceId=e.DeviceId
				AND s.StudentId=e.StudentId
				AND DegreeCourse='Computer Engineering')
AND Category='Electronics'
AND MONTH(Date)=6
AND YEAR(Date)=2019;				
				
				

				
EX 3

a)

SELECT CampName, City, s.ActivityCode, count(SSN)
FROM Summer_Camp sc, Activity A1, SUBSCRIPTION_TO_ACTIVITY_IN_SUMMER_CAMP s
WHERE sc.campcode=s.campcode 
    AND A1.activitycode=s.activitycode   
    AND s.campcode in  (select CampCode 
                         FROM SUBSCRIPTION_TO_ACTIVITY_IN_SUMMER_CAMP s2 , Activity a
                         WHERE s2.activitycode=a.activitycode
                         group by CampCode
                        having count( distinct SSN)>=15 and count( distinct category)>=3)
Group by  CampName, City, s.ActivityCode;




b)

SELECT  t.Name, t.Surname, t.Birthdate, s.campcode, sc.CampName
FROM  Teenager t, SUBSCRIPTION_TO_ACTIVITY_IN_SUMMER_CAMP s, Summer_camp sc                                           
WHERE t.SSN=s.SSN
AND s.CampCode=sc.CampCode
AND s.SSN in (SELECT SSN 
            FROM SUBSCRIPTION_TO_ACTIVITY_IN_SUMMER_CAMP s2
            GROUP BY s2.SSN
            HAVING count(distinct s2.Campcode)>5)             
AND t.Birthdate<'01-GEN-2005'
Group by  t.Name, t.Surname, t.Birthdate, s.campcode, sc.CampName
Having count(distinct s.ActivityCode)=(Select count(distinct s3.Activitycode )
                                            FROM SUBSCRIPTION_TO_ACTIVITY_IN_SUMMER_CAMP s3
                                            Where s3.Campcode=s.CampCode);
