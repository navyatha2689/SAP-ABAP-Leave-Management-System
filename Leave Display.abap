REPORT zemp_leave_display.

DATA: it_leave TYPE TABLE OF zemp_leave,
      wa_leave TYPE zemp_leave.

START-OF-SELECTION.

  SELECT * FROM zemp_leave INTO TABLE it_leave.

  WRITE: / 'EMP_ID', 10 'NAME', 25 'TYPE', 40 'STATUS'.
  ULINE.

  LOOP AT it_leave INTO wa_leave.

    WRITE: / wa_leave-emp_id,
             10 wa_leave-emp_name,
             25 wa_leave-leave_type,
             40 wa_leave-status.

  ENDLOOP.
