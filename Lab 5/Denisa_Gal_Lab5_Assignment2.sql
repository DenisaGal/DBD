DECLARE
    AllBooks Number := 0;
    AvailableBooks Number := 0;
BEGIN
    FOR book_title_row IN (SELECT Title FROM Book_title)
    LOOP
        Dbms_output.put_line('Title of the book: ' || book_title_row.Title);
        AllBooks := AllBooks + 1;
    END LOOP; 
    FOR book_copy_row in (SELECT count(Title) AS AvailableCopies FROM Book_title WHERE T_ID IN (SELECT Book_copy.Title_Id FROM Book_title, Book_copy WHERE Book_copy.B_Start IS NULL AND Book_copy.B_End IS NULL AND Book_copy.Title_Id=Book_title.T_ID))
    LOOP
        AvailableBooks := AvailableBooks + 1;
    END LOOP;
    Dbms_output.put_line('The library has ' || (AvailableBooks / AllBooks * 100) || '% of books available ');
END;