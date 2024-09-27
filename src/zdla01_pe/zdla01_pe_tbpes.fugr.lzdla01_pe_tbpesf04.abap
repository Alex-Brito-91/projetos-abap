FORM modify_register.

  CHECK zdla01_pe_tbpes-criado_por IS NOT INITIAL.

  GET TIME STAMP FIELD DATA(lv_timestamp).

  zdla01_pe_tbpes-modificado_por = sy-uname.
  zdla01_pe_tbpes-modificado_em = lv_timestamp.

ENDFORM.
