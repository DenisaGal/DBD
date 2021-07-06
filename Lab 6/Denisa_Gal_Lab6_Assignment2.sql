DECLARE
    TYPE Book_Record IS RECORD
            (T_ID           Varchar2(20),
            Title           Varchar2(100),
            Authors         Varchar2(20),
            Year	        Number,
            Publisher       Varchar2(20),
            Page_number     Number);
            Book_R1  Book_Record;
BEGIN
    SELECT T_ID, Title, Authors, Year, Publisher, Page_number INTO Book_R1
        FROM Book_title LEFT JOIN Book_copy ON (Book_title.T_ID = Book_copy.Title_ID)
        GROUP BY T_ID, Title, Authors, Year, Publisher, Page_number
        HAVING COUNT(Book_copy.Title_ID) > 2
        FETCH FIRST 1 ROWS ONLY;

    DBMS_OUTPUT.PUT_LINE(Book_R1.T_ID || ' ' || Book_R1.Title || ' ' || Book_R1.Authors || ' ' || Book_R1.Year || ' ' || Book_R1.Publisher || ' ' || Book_R1.Page_number);
END;