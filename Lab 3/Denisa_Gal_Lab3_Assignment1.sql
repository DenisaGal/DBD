ACCEPT S_Name CHAR PROMPT 'Student name: ';

INSERT INTO Student
VALUES (&S_id, &S_Name, &Year_of_study, &Faculty, &Average_mark);
