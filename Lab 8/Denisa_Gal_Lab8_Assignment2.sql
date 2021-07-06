CREATE TYPE Book_titles IS TABLE OF Varchar2(100);

CREATE OR REPLACE FUNCTION Books_with_less_than_x_copies(x Number) RETURN Book_titles PIPELINED IS
    message Varchar2(30) := 'Books with less than ';
    CURSOR Books_Titles_Cursor IS 
        SELECT Title
            FROM Book_title LEFT JOIN Book_copy ON (Book_title.T_ID = Book_copy.Title_ID) 
            GROUP BY T_ID, Title, Authors, Year, Publisher, Page_number
            HAVING COUNT(Book_copy.Title_ID) < x;
BEGIN
    FOR B_Title IN Books_Titles_Cursor LOOP
        PIPE ROW(B_Title.Title);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(message || x || ' copies: ');
    RETURN;
END Books_with_less_than_x_copies;

BEGIN
    FOR Title IN (SELECT * FROM TABLE(Books_with_less_than_x_copies(2))) LOOP
        DBMS_OUTPUT.PUT_LINE('  -> ' || Title.COLUMN_VALUE);
    END LOOP;
END;

SELECT * FROM TABLE(Books_with_less_than_x_copies(2));