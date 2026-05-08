REPORT zemp_leave_approval.

PARAMETERS: p_empid TYPE zemp_leave-emp_id,
            p_stat  TYPE zemp_leave-status.

START-OF-SELECTION.

  UPDATE zemp_leave
    SET status = p_stat
    WHERE emp_id = p_empid.

  IF sy-subrc = 0.
    WRITE: / 'Status Updated Successfully'.
  ELSE.
    WRITE: / 'Record Not Found'.
  ENDIF.
