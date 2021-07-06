CREATE TABLE Book_title (T_ID Varchar2(20) PRIMARY KEY,Title Varchar2(100),Authors Varchar2(20),Year Number(4), Publisher Varchar2(20), Page_number Number(4));

CREATE TABLE Book_copy (B_ID Varchar2(20) PRIMARY KEY, Title_ID Varchar2(20) REFERENCES Book_title(T_ID), Student_ID Number(4) REFERENCES Student(S_ID), B_Start Date, B_End Date);

CREATE TABLE Student (S_ID Number(4) PRIMARY KEY, S_Name Varchar2(20), Year_of_study Number(4), Faculty Varchar2(20), Average_mark Number(4));

#cascade delete for FK