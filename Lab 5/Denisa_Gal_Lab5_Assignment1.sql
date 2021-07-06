DECLARE 
    SName 		Student.S_Name%type;
    YearOfStudy Student.Year_of_study%type;
    AverageMark Student.Average_mark%type;
BEGIN 
    SELECT S_Name, Year_of_study, Average_mark INTO SName, YearOfStudy, AverageMark 
        FROM Student
        WHERE Student.S_Id = '2';
        SName:=REGEXP_SUBSTR(SName,'^[A-Za-z0-9]') || '.' || REGEXP_SUBSTR(LTRIM(SName, REGEXP_SUBSTR(SName,'[A-Za-z0-9]* ')), '([A-Za-z0-9]*)');
        IF (AverageMark > 9 AND YearOfStudy = 4 ) THEN
        Dbms_output.put_line(SName||' Excelent ' || AverageMark || ' SeniorStudent ' || YearOfStudy);
        ELSE 
            IF (AverageMark > 9 AND YearOfStudy < 4) THEN
            Dbms_output.put_line(SName|| ' Excelent ' || AverageMark || ' Student ' || YearOfStudy);
            ELSE 
                IF (AverageMark < 9 AND YearOfStudy = 4) THEN
                Dbms_output.put_line(SName|| ' Good ' || AverageMark || ' SeniorStudent ' || YearOfStudy);
                ELSE
                Dbms_output.put_line(SName|| ' Good ' || AverageMark || ' Student ' || YearOfStudy);
                END IF;
            END IF;
        END IF;
END;