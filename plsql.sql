-- retrive the student details for a specific students
-- variable declaretion and print value
set serveroutput ON

declare 
     v_student_name students.student_name%type;
     v_hall_name halls.hall_name%type;


BEGIN
    select s.student_name ,h.hall_name into v_student_name ,v_hall_name
    from students s join halls h on 
    s.HALL_ID=h.HALL_ID
     where s.STUDENT_ID=1907053;

dbms_output.put_line ('student_name :' || v_student_name ||' hall name ' || v_hall_name);
end;
/


--for loop print all the student name 
DECLARE
  CURSOR c_students IS SELECT student_name FROM students;
  v_student_name students.student_name%TYPE;
BEGIN
  FOR student_rec IN c_students LOOP
    v_student_name := student_rec.student_name;
    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_student_name);
  END LOOP;
END;
/

--if else
DECLARE
  v_hall_id NUMBER := 1;
  v_hall_status halls.status%TYPE;
BEGIN
  -- Check if hall exists
  SELECT status INTO v_hall_status FROM halls WHERE hall_id = v_hall_id;

  -- Check hall status
  IF v_hall_status = 'Available' THEN
    DBMS_OUTPUT.PUT_LINE('Hall is available. You can proceed with booking.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Hall is not available. Please choose another hall.');
  END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Hall not found.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/



-- while loop for hall name 
DECLARE
  v_counter NUMBER := 1;
  v_hall_name halls.hall_name%TYPE;
BEGIN
  WHILE v_counter <= 5 LOOP
    SELECT hall_name INTO v_hall_name FROM halls WHERE hall_id = v_counter;
    DBMS_OUTPUT.PUT_LINE('Hall Name: ' || v_hall_name);
    v_counter := v_counter + 1;
  END LOOP;
END;
/



CREATE OR REPLACE FUNCTION calculate_discount(price NUMBER) RETURN NUMBER IS
    discount NUMBER;
BEGIN
    IF price >= 1000 THEN
        discount := price * 0.1;
    ELSE
        discount := price * 0.05;
    END IF;
    RETURN discount;
END;
/

-- Usage of the function
DECLARE
    total_price NUMBER := 1200;
    total_discount NUMBER;
BEGIN
    total_discount := calculate_discount(total_price);
    dbms_output.put_line('Total Discount: ' || total_discount);
END;
/
--cursor 
DECLARE
  CURSOR c_halls IS
    SELECT hall_id, hall_name
    FROM halls;
  
  v_hall_id NUMBER;
  v_hall_name VARCHAR2(100);
  v_student_count NUMBER;
BEGIN
  OPEN c_halls;
  
  LOOP
    FETCH c_halls INTO v_hall_id, v_hall_name;
    EXIT WHEN c_halls%NOTFOUND;
    
    SELECT COUNT(*) INTO v_student_count
    FROM students
    WHERE hall_id = v_hall_id;
    
    DBMS_OUTPUT.PUT_LINE('Hall: ' || v_hall_name || ', Student Count: ' || v_student_count);
  END LOOP;
  
  CLOSE c_halls;
END;
/


-- PL/SQL procedure to update the status of a hall

CREATE OR REPLACE PROCEDURE update_hall_status(
  p_hall_id NUMBER,
  p_new_status VARCHAR2
) IS
BEGIN
  -- Update the status of the hall
  UPDATE halls
  SET status = p_new_status
  WHERE hall_id = p_hall_id;

  DBMS_OUTPUT.PUT_LINE('Hall status updated successfully.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Hall not found.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

DECLARE
  v_hall_id NUMBER := 4; -- Provide the hall ID you want to update
  v_new_status VARCHAR2(20) := 'Reserved'; -- Provide the new status

BEGIN
  update_hall_status(v_hall_id, v_new_status);
  COMMIT;
END;
/

select *from halls;


















