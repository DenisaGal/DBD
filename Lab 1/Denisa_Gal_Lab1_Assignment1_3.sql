DELETE FROM Student WHERE S_ID > (SELECT MAX(S_ID) - 2 FROM Student);

UPDATE Student 
	SET Average_mark = 7.77 
	WHERE Average_mark <= 7;

SELECT Book_title.Title, COUNT(*) AS Number_of_copies
    FROM (Book_copy INNER JOIN Book_title ON Book_copy.Title_ID = Book_title.T_ID)
    GROUP BY Book_title.Title;