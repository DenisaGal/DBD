DECLARE
    i                   Integer;
    Number_of_records   Integer;
    CURSOR Student_Cursor IS SELECT * FROM Student;
    STD_Cursor1 Student_Cursor%RowType;
    TYPE Student_Record_Table IS TABLE OF Student%RowType INDEX BY binary_integer;
    STD_RT1 Student_Record_Table; 
BEGIN
    OPEN Student_Cursor;
    FOR i IN 1..50 LOOP
        FETCH Student_Cursor INTO STD_RT1(i);
        EXIT WHEN Student_Cursor%NotFound;
        Number_of_records := i;
    END LOOP;
    CLOSE Student_Cursor;

    FOR i IN 1..Number_of_records LOOP
        STD_RT1(i).Faculty := 'Some Faculty';
        IF (STD_RT1(i).Year_of_study = 4 AND STD_RT1(i).Average_mark > 5) THEN
            STD_RT1.DELETE(i);
        ELSE
            IF (STD_RT1(i).Average_mark > 5) THEN
                STD_RT1(i).Year_of_study := (STD_RT1(i).Year_of_study + 1);
            END IF;
        END IF;
    END LOOP;

    FOR i IN 1..Number_of_records LOOP
        IF (STD_RT1.EXISTS(i)) THEN
            DBMS_OUTPUT.PUT_LINE(i || ' ' || STD_RT1(i).S_Id || ' ' || STD_RT1(i).S_Name || ' ' || STD_RT1(i).Year_of_study || ' ' || STD_RT1(i).Faculty || ' ' || STD_RT1(i).Average_mark);
        END IF;
    END LOOP;
END;