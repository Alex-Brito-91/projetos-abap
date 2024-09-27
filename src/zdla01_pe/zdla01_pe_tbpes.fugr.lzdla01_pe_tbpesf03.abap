FORM create_register.

  GET TIME STAMP FIELD DATA(lv_timestamp).

  zdla01_pe_tbpes-matricula = cl_system_uuid=>create_uuid_x16_static( ).
  zdla01_pe_tbpes-data_matric = sy-datum.

  zdla01_pe_tbpes-criado_por = sy-uname.
  zdla01_pe_tbpes-criado_em = lv_timestamp.

ENDFORM.
