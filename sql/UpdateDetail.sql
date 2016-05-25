--Script UpdateDetail
--
--One time script to update nutrients on data alreay entered in Health.DailyDetail.  
--
--01/23/2016

-- Declare Storage
DECLARE
    @ObsDate    DATE,
    @NDB_No     CHAR(12),
    @Amount     NUMERIC(18,3),
    @Scale      NUMERIC(12,5);
    
-- Create cursor for the existing data
DECLARE cursor_detail CURSOR FOR
    SELECT ObsDate NDB_No, Amount FROM Health.DailyDetail;
    
OPEN cursor_detail

CLOSE cursor_detail;
DEALLOCATE cursor_detail; 