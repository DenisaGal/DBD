CREATE SEQUENCE list_sequence
    START WITH     1
    INCREMENT BY   1

CREATE SEQUENCE list_sequence2    
    INCREMENT BY 1
     START WITH 0
     MAXVALUE 999999999999
     MINVALUE 0
     CYCLE
     CACHE 100;

SELECT list_sequence2.NEXTVAL AS ID, book_list.*
    FROM (
        SELECT S.S_Name, T.Title 
            FROM Book_title T LEFT JOIN Book_copy C ON T.T_ID = C.Title_id LEFT JOIN Student S ON S.S_id = C.Student_id 
            WHERE T.Page_number < 100
        ) book_list;