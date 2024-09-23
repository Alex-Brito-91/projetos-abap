FORM MODIFY_REGISTER.

  CHECK zdla01gpt_003-criado_por IS NOT INITIAL.

  GET TIME STAMP FIELD DATA(lv_timestamp).

  zdla01gpt_003-modificado_por = sy-uname.
  zdla01gpt_003-modificado_em  = lv_timestamp.

ENDFORM.

FORM CREATE_REGISTER.

  GET TIME STAMP FIELD DATA(lv_timestamp).

  zdla01gpt_003-id         = cl_system_uuid=>create_uuid_c32_static( ).
  zdla01gpt_003-criado_por = sy-uname.
  zdla01gpt_003-criado_em  = lv_timestamp.

ENDFORM.
