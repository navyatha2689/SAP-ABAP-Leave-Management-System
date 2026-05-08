REPORT zemp_leave_alv.

TABLES: zemp_leave.

TYPES: BEGIN OF ty_leave,
         emp_id     TYPE zemp_leave-emp_id,
         emp_name   TYPE zemp_leave-emp_name,
         leave_type TYPE zemp_leave-leave_type,
         from_date  TYPE zemp_leave-from_date,
         to_date    TYPE zemp_leave-to_date,
         reason     TYPE zemp_leave-reason,
         status     TYPE zemp_leave-status,
       END OF ty_leave.

DATA: it_leave TYPE TABLE OF ty_leave.

DATA: lt_fieldcat TYPE slis_t_fieldcat_alv,
      ls_fieldcat TYPE slis_fieldcat_alv.

DATA: lv_repid TYPE sy-repid.

START-OF-SELECTION.

  lv_repid = sy-repid.

  SELECT emp_id emp_name leave_type from_date to_date reason status
    FROM zemp_leave
    INTO TABLE it_leave.

* Field Catalog
  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'EMP_ID'.
  ls_fieldcat-seltext_m = 'Employee ID'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'EMP_NAME'.
  ls_fieldcat-seltext_m = 'Name'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'LEAVE_TYPE'.
  ls_fieldcat-seltext_m = 'Leave Type'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'STATUS'.
  ls_fieldcat-seltext_m = 'Status'.
  APPEND ls_fieldcat TO lt_fieldcat.

* Display ALV
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = lv_repid
      it_fieldcat        = lt_fieldcat
    TABLES
      t_outtab           = it_leave.
