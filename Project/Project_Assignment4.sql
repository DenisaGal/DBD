CREATE OR REPLACE TRIGGER "Update_number_of_available_seats_after_cancel" AFTER DELETE ON Ticket FOR EACH ROW
    BEGIN
        UPDATE Flight SET Available_seats = (Available_seats + 1) WHERE ID = :OLD.Flight_ID;
    END;

CREATE OR REPLACE PROCEDURE Cancel_Ticket(pTicket_ID IN Varchar2) AS
    R_date    Date;
    F_ID      Varchar2(20);
    T_price   Number;
    fee       Number;
BEGIN
    SELECT Flight_ID INTO F_ID FROM Ticket WHERE ID = pTicket_ID; 
    SELECT Reservation_date INTO R_date FROM Ticket WHERE ID = pTicket_ID;
    IF (TO_CHAR(R_date, 'MM/DD/YYYY') = TO_CHAR(SYSDATE, 'MM/DD/YYYY')) THEN
        DBMS_OUTPUT.put_line('Your ticket reservation for flight ' || F_ID || ' has been cancelled successfully.');
    ELSE
        SELECT Price INTO T_price FROM Ticket WHERE ID = pTicket_ID;
        fee := T_price * 2 / 100;
        DBMS_OUTPUT.put_line('You will have to pay a ' || fee || ' ron fee (2% of the price you paid for the ticket) for late cancellation.');
    END IF;
    DELETE FROM Ticket WHERE ID = pTicket_ID;
END Cancel_Ticket;

BEGIN
    Cancel_Ticket('10');
    Cancel_Ticket('9');
END;