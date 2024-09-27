FORM modify_register.

  CHECK zdla01_pe_tbatv-criado_por IS NOT INITIAL.

  GET TIME STAMP FIELD DATA(lv_timestampl).

  zdla01_pe_tbatv-modificado_por = sy-uname.
  zdla01_pe_tbatv-modificado_em  = lv_timestampl.

ENDFORM.
