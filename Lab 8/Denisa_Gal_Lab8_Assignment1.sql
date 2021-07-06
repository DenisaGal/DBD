CREATE OR REPLACE PROCEDURE Insert_Student(S_Id IN Varchar2, S_Name IN Varchar2, Year_of_study IN Number, Faculty IN Varchar2, Average_mark IN Number) AS 
    ok_message              Varchar2(50) := 'Student was inserted: ';
    Insert_S_Id             Varchar2(20); 
    Insert_S_Name           Varchar2(20); 
    Insert_Year_of_study    Number; 
    Insert_Faculty          Varchar2(20); 
    Insert_Average_mark     Number;
BEGIN
    Insert_S_Id := S_Id;
    Insert_S_Name := S_Name;
    Insert_Year_of_study := Year_of_study;
    Insert_Faculty := Faculty;
    Insert_Average_mark := Average_mark;
    INSERT INTO Student
        VALUES(Insert_S_Id, Insert_S_Name, Insert_Year_of_study, Insert_Faculty, Insert_Average_mark);
    DBMS_OUTPUT.PUT_LINE(ok_message || Insert_S_Id || ' ' || Insert_S_Name);
END Insert_Student;

BEGIN
    Insert_Student('30', 'Student ABC', 4, 'ABC', 5);
END;

BEGIN
    Insert_Student('31', 'Student 123', 4, 'ABC', 6);
    Insert_Student('32', 'Student 456', 4, 'ABC', 7);
    Insert_Student('33', 'Student 789', 4, 'ABC', 8);
END;