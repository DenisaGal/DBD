CREATE OR REPLACE PROCEDURE Reserve_Ticket(pClient_ID IN Varchar2, pFlight_ID IN Varchar2, pDiscount IN Number) AS  
    pPrice      Number;
    TPrice      Number;
    Insert_Id   Varchar(20);
BEGIN
    SELECT MAX(Id) INTO Insert_Id FROM Ticket;
    IF (Insert_Id IS NULL) THEN
        Insert_Id := 1;
    ELSE
        Insert_Id := Insert_Id + 1;
    END IF;
    SELECT Price INTO pPrice FROM Flight WHERE ID = pFlight_ID;
    TPrice := pPrice - (pPrice * pDiscount/100);
    INSERT INTO Ticket VALUES(Insert_Id, pClient_ID, pFlight_ID, Sysdate, TPrice);
    DBMS_OUTPUT.put_line('Client: ' || pClient_ID || ' reserved a ticket for flight ' || pFlight_ID || ' with a discount of ' || pDiscount || '% and a total price of ' || TPrice || ' ron.');
    apex_application.g_print_success_message := 'Client: ' || pClient_ID || ' reserved a ticket for flight ' || pFlight_ID || ' with a discount of ' || pDiscount || '% and a total price of ' || TPrice || ' ron.';
END Reserve_Ticket;

BEGIN
    Reserve_Ticket('3', '2TP', 5);
    Reserve_Ticket('6', '10TS', 25);
END;