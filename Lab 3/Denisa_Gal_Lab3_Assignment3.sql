CREATE VIEW Books_information (B_ID, T_ID, Title, Authors, Year, Publisher, Page_number, Student) AS
    SELECT C.B_ID Copy_id, T.T_ID Title_id, T.Title Book_Title, T.Authors Authors, T.Year Year, T.Publisher Publisher, T.Page_number Number_of_pages, NVL(S.S_Name,'Not borrowed')
    FROM Book_title T LEFT JOIN Book_copy C ON T.T_ID = C.Title_id LEFT JOIN Student S ON S.S_id = C.Student_id
    ORDER BY C.B_ID
    

SELECT * 
    FROM Books_information