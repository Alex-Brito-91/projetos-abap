FORM create_register.

  GET TIME STAMP FIELD DATA(lv_timestampl).

  zdla01_pe_tbatv-criado_por = sy-uname.
  zdla01_pe_tbatv-criado_em  = lv_timestampl.

ENDFORM.
