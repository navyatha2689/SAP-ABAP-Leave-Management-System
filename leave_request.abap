REPORT zemp_leave_load_data.

DATA: it_leave TYPE TABLE OF zemp_leave,
      wa_leave TYPE zemp_leave.

START-OF-SELECTION.

*-----------------------------
* Sample 20 Employee Records
*-----------------------------

DO 20 TIMES.

  wa_leave-emp_id = sy-index.
  CONCATENATE 'EMP' sy-index INTO wa_leave-emp_name.
  
  wa_leave-leave_type = 'CASUAL'.
  
  wa_leave-from_date = sy-datum.
  wa_leave-to_date   = sy-datum + 2.

  wa_leave-reason = 'General Leave'.
  wa_leave-status = 'PENDING'.

  INSERT zemp_leave FROM wa_leave.

ENDDO.

WRITE: / '20 Records Inserted Successfully'.
