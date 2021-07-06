DECLARE
    i                   Integer;
    Number_of_records   Integer;              
    CURSOR Books_Cursor IS 
        SELECT T_ID, Title, Authors, Year, Publisher, Page_number
            FROM Book_title LEFT JOIN Book_copy ON (Book_title.T_ID = Book_copy.Title_ID AND B_Start IS NULL AND B_END IS NULL) 
            GROUP BY T_ID, Title, Authors, Year, Publisher, Page_number
            HAVING COUNT(Book_copy.Title_ID) < 3;
    TYPE Book_title_Record_Table IS TABLE OF Book_title%RowType INDEX BY binary_integer;
    Book_RT1 Book_title_Record_Table; 
BEGIN
    OPEN Books_Cursor;
    FOR i IN 1..50 LOOP
        FETCH Books_Cursor INTO Book_RT1(i);
        EXIT WHEN Books_Cursor%NotFound;
        Number_of_records := i;
    END LOOP;
    CLOSE Books_Cursor;
 
    FOR j IN Book_RT1.FIRST..Book_RT1.LAST LOOP
        Book_RT1(j).Publisher := 'UPT_ORACLE';
        DBMS_OUTPUT.PUT_LINE('Updated Publisher of entry ' || j || ': ' || Book_RT1(j).T_Id || ' ' || Book_RT1(j).Title || ' ' || Book_RT1(j).Authors || ' ' || Book_RT1(j).Year || ' ' || Book_RT1(j).Publisher || ' ' || Book_RT1(j).Page_number);
        UPDATE Book_title
            SET Publisher = Book_RT1(j).Publisher
            WHERE T_ID = Book_RT1(j).T_Id;
    END LOOP;
END;