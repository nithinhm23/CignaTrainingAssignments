-- 1.
DECLARE
    p NUMBER; r FLOAT; t NUMBER;
    si FLOAT;
BEGIN
    p:= 30000;
    r:=6.5;
    t:=2;
    si:=(p*r*t)/100;
    DBMS_OUTPUT.PUT_LINE ('The Simple Interest is ' || si);
END;

--2.
DECLARE
    emp_name VARCHAR(50);
    salary NUMBER;
    bonus NUMBER;
BEGIN
    emp_name := 'Sam';
    salary:=40000;
    IF salary>50000 THEN
        bonus:=0.10*salary;
    ELSE
        bonus:=0.15*salary;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Employee Name is ' || emp_name);
    DBMS_OUTPUT.PUT_LINE('Salary is ' || salary);
    DBMS_OUTPUT.PUT_LINE('Bonus is ' || bonus);
END;

--3
DECLARE
  v_dept Dept%ROWTYPE;
  
  v_dept_id Dept.deptno%TYPE := 230;
  
BEGIN
  SELECT DEPTNO ,
DNAME ,
LOC 
  INTO v_dept
  FROM dept
  WHERE Deptno = v_dept_id;
  
 
  DBMS_OUTPUT.PUT_LINE('Department Name: ' || v_dept.Dname);
  DBMS_OUTPUT.PUT_LINE('Location ID: ' || v_dept.Loc);
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No department found with ID: ' || v_dept_id);
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

--4

DECLARE
    TYPE t_marks_array IS TABLE OF NUMBER INDEX BY VARCHAR2(50);
   v_student_marks t_marks_array;

    v_total_marks   NUMBER := 0;
    v_student_count NUMBER := 0;
    v_average_marks NUMBER;
    v_student_name  VARCHAR2(50);

BEGIN
    v_student_marks('Alice') := 95;
    v_student_marks('Bob') := 88;
    v_student_marks('Charlie') := 76;
    v_student_marks('David') := 92;
    v_student_marks('Eve') := 84;

    DBMS_OUTPUT.PUT_LINE('--- Student Marks ---');

    v_student_name := v_student_marks.FIRST;
    WHILE v_student_name IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE('Student: ' || v_student_name || ' | Marks: ' || v_student_marks(v_student_name));

        v_total_marks := v_total_marks + v_student_marks(v_student_name);
        v_student_count := v_student_count + 1;

        v_student_name := v_student_marks.NEXT(v_student_name);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('-----------------------');
    DBMS_OUTPUT.PUT_LINE('Total Marks: ' || v_total_marks);

    IF v_student_count > 0 THEN
        v_average_marks := v_total_marks / v_student_count;
        DBMS_OUTPUT.PUT_LINE('Average Marks: ' || ROUND(v_average_marks, 2));
    ELSE
        DBMS_OUTPUT.PUT_LINE('No students found to calculate average.');
    END IF;

END;

--5
DECLARE
    
    TYPE t_country_capitals IS TABLE OF VARCHAR2(50) INDEX BY VARCHAR2(50);
    v_capitals t_country_capitals;

    v_input_country VARCHAR2(50) := '&country'; 
    v_capital VARCHAR2(50);
    
BEGIN
    
    v_capitals('India') := 'New Delhi';
    v_capitals('United States') := 'Washington, D.C.';
    v_capitals('Japan') := 'Tokyo';
    v_capitals('Germany') := 'Berlin';
    v_capitals('France') := 'Paris';
    v_capitals('Australia') := 'Canberra';

    
    IF v_capitals.EXISTS(v_input_country) THEN
        
        v_capital := v_capitals(v_input_country);
        DBMS_OUTPUT.PUT_LINE('The capital of ' || v_input_country || ' is ' || v_capital);
    ELSE
        
        DBMS_OUTPUT.PUT_LINE('Country not found.');
    END IF;

END;  
