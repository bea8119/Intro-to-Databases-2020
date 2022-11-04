
CREATE OR REPLACE TRIGGER entrances
after insert on ENTRANCE_REQUEST
for each row
declare
x NUMBER;
y NUMBER;

BEGIN

select count(*) into x
from ENTRANCE_QUEQUE 
where SupermarketCode= :new.SupermarketCode;

select NumberOfPlacesInQueque into y
from SUPERMARKET 
where SupermarketCode= :new.SupermarketCode;

--if queque is full (error)
if(x>=y) then
	raise_application_error();

else
--if queque is available
	insert into ENTRANCE_QUEQUE(SupermarketCode, CustomerSSN)
	values(:new.SupermarketCode, :new.CustomerSSN);
	
	
	
END IF;

END;

A:
after insert or update on SUPERMARKET
for each row

B:
IF(:new.City='Turin' AND TIMEDIFF(:new.ClosingTime, :new.OpeningTime)>='18:00:00') 
	
	select count(*) into X
	from SUPERMARKET
	where City='Turin' AND TIMEDIFF(ClosingTime, OpeningTime)>='18:00:00';

else X=0;

END IF;





