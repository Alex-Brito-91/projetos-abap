CLASS lcl_business_se DEFINITION.
  PUBLIC SECTION.

    DATA: lt_setor_empresa TYPE TABLE OF zdla01gpt_001.

    METHODS: get_setor_empresa,
             set_setor_empresa     IMPORTING VALUE(it_setor_empresa) TYPE any,
             deleted_setor_empresa IMPORTING VALUE(it_deleted_rows) TYPE lvc_t_moce.

ENDCLASS.

CLASS lcl_business_se IMPLEMENTATION.

  METHOD get_setor_empresa.

    SELECT *
      FROM zdla01gpt_001
      INTO TABLE lt_setor_empresa.

  ENDMETHOD.

  METHOD set_setor_empresa.

    CHECK it_setor_empresa IS NOT INITIAL.

    GET TIME STAMP FIELD DATA(lv_timestamp).

    DATA(lt_mod_setor_empresa) = CORRESPONDING zdla01gptt_001( it_setor_empresa ).

    LOOP AT lt_mod_setor_empresa INTO DATA(ls_setor_empresa).

      ls_setor_empresa-criado_em  = lv_timestamp.
      ls_setor_empresa-criado_por = sy-uname.

      ls_setor_empresa-modificado_em  = lv_timestamp.
      ls_setor_empresa-modificado_por = sy-uname.

      MODIFY zdla01gpt_001 FROM ls_setor_empresa.
    ENDLOOP.

    MESSAGE `Registros processados com sucesso!` TYPE 'S'.

    COMMIT WORK.

  ENDMETHOD.

  METHOD deleted_setor_empresa.

    CHECK it_deleted_rows[] IS NOT INITIAL.

    LOOP AT it_deleted_rows INTO DATA(ls_deleted_rows).

      DATA(ls_setor_empresa) = lt_setor_empresa[ ls_deleted_rows-row_id ].

      DELETE FROM zdla01gpt_001 WHERE setor = ls_setor_empresa-setor.
      CLEAR ls_setor_empresa.

    ENDLOOP.

    MESSAGE `Registros deletados com sucesso!` TYPE 'S'.

    COMMIT WORK.

  ENDMETHOD.

ENDCLASS.
