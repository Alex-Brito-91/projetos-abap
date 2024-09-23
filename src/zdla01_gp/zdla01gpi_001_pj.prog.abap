CLASS lcl_business_pj DEFINITION.
  PUBLIC SECTION.

    DATA: lt_projetos TYPE TABLE OF zdla01gpt_003,
          lo_projeto  TYPE REF TO  zdla01gpcl_002.

    METHODS: constructor,
      get_projetos,
      set_projetos       IMPORTING VALUE(it_projetos) TYPE any,
      deleted_projetos   IMPORTING VALUE(it_deleted_rows) TYPE lvc_t_moce.

ENDCLASS.

CLASS lcl_business_pj IMPLEMENTATION.

  METHOD constructor.

    lo_projeto = NEW zdla01gpcl_002( iv_table = `ZDLA01GPT_003` ).

  ENDMETHOD.

  METHOD get_projetos.

    lo_projeto->read( IMPORTING et_data = lt_projetos ).

  ENDMETHOD.

  METHOD set_projetos.

    CHECK it_projetos IS NOT INITIAL.


    GET TIME STAMP FIELD DATA(lv_timestamp).

    DATA(lt_mod_projetos) = CORRESPONDING zdla01gptt_003( it_projetos ).

    LOOP AT lt_mod_projetos INTO DATA(ls_projeto).

      IF ls_projeto-id EQ space.
        DATA(ls_return_create) = lo_projeto->create( CHANGING cs_data = ls_projeto ).
      ELSE.
        DATA(ls_return_update) = lo_projeto->update( CHANGING cs_data = ls_projeto ).
      ENDIF.

      MESSAGE ls_return_create-message TYPE ls_return_create-type.

    ENDLOOP.

    MESSAGE `Registros processados com sucesso!` TYPE 'S'.

    COMMIT WORK.

  ENDMETHOD.

  METHOD deleted_projetos.

    CHECK it_deleted_rows[] IS NOT INITIAL.

    LOOP AT it_deleted_rows INTO DATA(ls_deleted_rows).

      DATA(ls_projeto) = lt_projetos[ ls_deleted_rows-row_id ].

      DATA(ls_return_delete) = lo_projeto->delete( EXPORTING is_data = ls_projeto ).

      CLEAR ls_projeto.

    ENDLOOP.

    MESSAGE `Registros deletados com sucesso!` TYPE 'S'.

    COMMIT WORK.

  ENDMETHOD.

ENDCLASS.
