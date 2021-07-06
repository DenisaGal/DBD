DECLARE
    Std    Student%ROWTYPE;
    CURSOR Student_Cursor IS SELECT * FROM Student;
BEGIN
    OPEN Student_Cursor;
    WHILE Student_Cursor%rowcount < 5 LOOP
        FETCH Student_Cursor INTO Std;
        EXIT WHEN  Student_Cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(Student_Cursor%rowcount || ' ' || Std.S_Id || ' ' || Std.S_Name || ' ' || Std.Year_of_study || ' ' || Std.Faculty || ' ' || Std.Average_mark);
    END LOOP;
    CLOSE Student_Cursor;
END;