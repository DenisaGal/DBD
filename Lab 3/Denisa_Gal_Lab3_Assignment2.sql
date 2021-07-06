CREATE VIEW Borrowed_books_information (B_ID, T_ID, Title, Authors, Year, Publisher, Page_number) AS
    SELECT C.B_ID Copy_id, T.T_ID Title_id, T.Title Book_Title, T.Authors Authors, T.Year Year, T.Publisher Publisher, T.Page_number Number_of_pages
    FROM Book_title T, Book_copy C 
    WHERE T.T_ID = C.Title_id

SELECT *
    FROM Borrowed_books_information

CREATE VIEW Only_borrowed_books_information2 (B_ID, T_ID, Title, Authors, Year, Publisher, Page_number) AS
    SELECT C.B_ID Copy_id, T.T_ID Title_id, T.Title Book_Title, T.Authors Authors, T.Year Year, T.Publisher Publisher, T.Page_number Number_of_pages
    FROM Book_title T, Book_copy C 
    WHERE T.T_ID = C.Title_id AND C.B_Start IS NULL AND C.B_End IS NULL

SELECT *
    FROM Only_borrowed_books_information2