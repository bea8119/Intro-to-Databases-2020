INSERT INTO trainer
values('SMTPLA80N31B791Z', 'Paul', 'Smith',
 '1980/12/31', 'p.smith@gym.it', NULL),
	('KHNJHN81E30C455Y', 'John', 'Johnson',
	'1981/5/31',  'j.johnson@gym.it', '+2300110303444'),
	('AAAGGG83E30C445A', 'Peter', 'Johnson', 
	'1981/5/30', 'p.johnson@gym.it', '+2300110303444');


INSERT INTO course values
	('CT100', 'Spinning for beginners', 'Spinning', 1),
	('CT101', 'Fitdancing', 'Music activity', 2),
	('CT104', 'Advanced spinning', 'Spinning', 4);
	
INSERT INTO schedule values	
	('SMTPLA80N31B791Z', 'Monday', '10:00', 45, 'CT100', 'R1'),
	('SMTPLA80N31B791Z', 'Tuesday', '11:00', 45, 'CT100', 'R1'),
	('SMTPLA80N31B791Z', 'Tuesday', '15:00', 45, 'CT100', 'R2'),
	('KHNJHN81E30C455Y', 'Monday', '10:00', 30, 'CT101', 'R2'),
	('KHNJHN81E30C455Y', 'Monday', '11:30', 30, 'CT104', 'R2'),
	('KHNJHN81E30C455Y', 'Wednesday', '9:00', 60, 'CT104', 'R1');
	