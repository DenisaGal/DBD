SELECT T_ID, Title, Authors, Publisher, DECODE(Publisher, 'Editura_UPT', 'local', 'abroad') "Local/Abroad",  COUNT(Book_copy.Title_ID) AS "Number_of_copies"
    FROM Book_title LEFT JOIN Book_copy ON (Book_title.T_ID = Book_copy.Title_ID AND B_Start IS NULL AND B_END IS NULL)
    GROUP BY T_ID, Title, Authors, Publisher
    HAVING COUNT(Book_copy.Title_ID) > 3;