CREATE OR REPLACE PROCEDURE Borrow_Book(pStudentID IN Varchar2, pBookID IN Varchar2) AS  
BEGIN
    UPDATE Book_copy SET Student_ID = pStudentID, B_Start = Sysdate WHERE (Title_ID = pBookID AND Student_ID IS NULL) AND rownum = 1;
    DBMS_OUTPUT.put_line('Student: ' || pStudentID || ' borrowed the book ' || pBookID);
END Borrow_Book;

BEGIN
    Borrow_Book(1, 6);
END;

CREATE OR REPLACE PROCEDURE Return_Book(pStudentID IN Varchar2, pBookID IN Varchar2) AS  
BEGIN
    UPDATE Book_copy SET B_End = Sysdate WHERE (Title_ID = pBookID AND Student_ID = pStudentID AND B_Start IS NOT NULL) AND rownum = 1;
    DBMS_OUTPUT.put_line('Student: ' || pStudentID || ' returned the book ' || pBookID);
END Return_Book;

BEGIN
    Return_Book(1, 6);
END;

BEGIN
    Borrow_Book(4, 'FF2400');
END;

BEGIN
    Return_Book(4, 'FF2400');
END;
