DECLARE
    TYPE Books_Record IS RECORD
            (T_ID           Varchar2(20),
            Title           Varchar2(100),
            Authors         Varchar2(20),
            Year            Number,
            Publisher       Varchar2(20),
            Page_number     Number,
            B_Id            Varchar2(20), 
            Title_ID        Varchar2(20), 
            Student_Id      Varchar2(20), 
            B_Start         Date, 
            B_End           Date);
    Book_R1  Books_Record;
    CURSOR Books_Cursor IS SELECT T_ID, Title, Authors, Year, Publisher, Page_number, B_Id, Title_ID, Student_Id, B_Start, B_End FROM Book_title LEFT JOIN Book_copy ON (Book_title.T_ID = Book_copy.Title_ID);
BEGIN
    DBMS_OUTPUT.PUT_LINE('i T_ID Title Authors Year Publisher Page_number B_Id Title_ID Student_Id B_Start B_End');
    OPEN Books_Cursor;
    FOR i IN 1..50 LOOP
        FETCH Books_Cursor INTO Book_R1;
        EXIT WHEN Books_Cursor%NotFound;
        DBMS_OUTPUT.PUT_LINE(i || ' ' ||Book_R1.T_ID || ' ' || Book_R1.Title || ' ' || Book_R1.Authors || ' ' || Book_R1.Year || ' ' || Book_R1.Publisher || ' ' || Book_R1.Page_number || ' ' || Book_R1.B_Id || ' ' || Book_R1.Title_ID || ' ' || Book_R1.Student_Id || ' ' || Book_R1.B_Start || ' ' || Book_R1.B_End);
    END LOOP;
    CLOSE Books_Cursor;
END;