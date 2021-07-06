DECLARE
    TYPE Student_Record IS RECORD
        (S_Id           Varchar2(20),
        S_Name          Varchar2(20),
        Year_of_study	Number,
        Faculty         Varchar2(20),
        Average_mark    Number);
        Std_R1  Student_Record;
        Std_R2  Student%RowType;
BEGIN
    Std_R1.S_Id := '16';
    Std_R1.S_Name := 'Student16';
    Std_R1.Year_of_study := 1;
    Std_R1.Faculty := 'AC';
    Std_R1.Average_mark := 6;

    Std_R2.S_Id := '17';
    Std_R2.S_Name := 'Student17';
    Std_R2.Year_of_study := 4;
    Std_R2.Faculty := 'FEEA';
    Std_R2.Average_mark := 8;

    INSERT INTO Student VALUES (Std_R1.S_Id, Std_R1.S_Name, Std_R1.Year_of_study, Std_R1.Faculty, Std_R1.Average_mark);
    INSERT INTO Student VALUES (Std_R2.S_Id, Std_R2.S_Name, Std_R2.Year_of_study, Std_R2.Faculty, Std_R2.Average_mark);
END;