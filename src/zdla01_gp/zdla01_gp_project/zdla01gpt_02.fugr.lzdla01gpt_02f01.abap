
FORM modify_register.

  CHECK zdla01gpt_002-criado_por IS NOT INITIAL.

  GET TIME STAMP FIELD DATA(lv_timestamp).

  zdla01gpt_002-modificado_por = sy-uname.
  zdla01gpt_002-modificado_em  = lv_timestamp.

ENDFORM.

FORM create_register.

  GET TIME STAMP FIELD DATA(lv_timestamp).

  zdla01gpt_002-criado_por = sy-uname.
  zdla01gpt_002-criado_em  = lv_timestamp.

ENDFORM.
