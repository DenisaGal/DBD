CREATE OR REPLACE TRIGGER "Check_available_seats" BEFORE INSERT ON Ticket FOR EACH ROW
    DECLARE
        tAvailable_seats    Number;
    BEGIN
        SELECT Available_seats INTO tAvailable_seats FROM Flight WHERE Flight.ID = :NEW.Flight_ID;
        IF (tAvailable_seats < 1) THEN
            RAISE_APPLICATION_ERROR(-20101,'Cound not reserve the ticket as there are not enought seats left on this flight');
        END IF;
    END;

BEGIN
    Reserve_Ticket('1', '3TR', 40);
    Reserve_Ticket('2', '3TR', 35);
    Reserve_Ticket('3', '3TR', 30);
    Reserve_Ticket('4', '3TR', 25);
    Reserve_Ticket('5', '3TR', 20);
    Reserve_Ticket('6', '3TR', 25);
    Reserve_Ticket('7', '3TR', 10);
    Reserve_Ticket('8', '3TR', 5);
END;

BEGIN
    Reserve_Ticket('9', '3TR', 50);
END;