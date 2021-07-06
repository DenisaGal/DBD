CREATE TABLE Client (ID Varchar2(20) PRIMARY KEY, Name Varchar2(50), Gender Varchar2(1));

CREATE TABLE Flight (ID Varchar2(20) PRIMARY KEY, Price Number, Available_seats Number);

CREATE TABLE Ticket (ID Varchar2(20) PRIMARY KEY, Client_ID Varchar2(20), Flight_ID Varchar2(20), Reservation_date Date, Price Number);

ALTER TABLE Ticket 
    ADD CONSTRAINT "TICKET_FK_C" FOREIGN KEY ("CLIENT_ID")
	REFERENCES  "CLIENT" ("ID");

ALTER TABLE Ticket 
    ADD CONSTRAINT "TICKET_FK_F" FOREIGN KEY ("FLIGHT_ID")
	REFERENCES  "FLIGHT" ("ID");

CREATE OR REPLACE TRIGGER "Update_number_of_available_seats" AFTER INSERT ON Ticket FOR EACH ROW
    BEGIN
        UPDATE Flight SET Available_seats = (Available_seats - 1) WHERE ID = :NEW.Flight_ID;
    END;

INSERT INTO Client VALUES('1', 'John Doe', 'M');
INSERT INTO Client VALUES('2', 'Jane Doe', 'F');
INSERT INTO Client VALUES('3', 'Howard Hughes', 'M');
INSERT INTO Client VALUES('4', 'Katharine Hepburn', 'F');
INSERT INTO Client VALUES('5', 'Ava Gardner', 'F');
INSERT INTO Client VALUES('6', 'Noah Dietrich', 'M');
INSERT INTO Client VALUES('7', 'Juan Trippe', 'M');
INSERT INTO Client VALUES('8', 'Professor Fitz', 'M');
INSERT INTO Client VALUES('9', 'Jack Frye', 'M');
INSERT INTO Client VALUES('10', 'Jean Harlow', 'M');
INSERT INTO Client VALUES('11', 'Errol Flynn', 'M');
INSERT INTO Client VALUES('12', 'Johnny Meyer', 'M');
INSERT INTO Client VALUES('13', 'Glenn Odekirk', 'M');
INSERT INTO Client VALUES('14', 'Faith Domergue', 'F');
INSERT INTO Client VALUES('15', 'Robert Gross', 'M');

INSERT INTO Flight VALUES('1TL', 298, 50);
INSERT INTO Flight VALUES('2TP', 232, 14);
INSERT INTO Flight VALUES('3TR', 198, 8);
INSERT INTO Flight VALUES('4LA', 144, 100);
INSERT INTO Flight VALUES('5LB', 171, 87);
INSERT INTO Flight VALUES('6LP', 315, 45);
INSERT INTO Flight VALUES('7LT', 4842, 99);
INSERT INTO Flight VALUES('8THK', 948, 150);
INSERT INTO Flight VALUES('9TB', 1244, 63);
INSERT INTO Flight VALUES('10TS', 1535, 84);
INSERT INTO Flight VALUES('11NYM', 233, 76);
INSERT INTO Flight VALUES('12NYLA', 566, 30);
INSERT INTO Flight VALUES('13AI', 542, 12);
INSERT INTO Flight VALUES('14AL', 347, 26);
INSERT INTO Flight VALUES('15AB', 350, 77);