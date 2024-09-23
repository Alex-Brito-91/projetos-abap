CLASS lcl_business_ms DEFINITION.
  PUBLIC SECTION.

    DATA: lt_modulos_sap TYPE TABLE OF zdla01gpt_002,
          lo_modulos_sap TYPE REF TO zdla01gpcl_002.

    METHODS: constructor,
      get_modulos_sap,
      set_modulos_sap       IMPORTING VALUE(it_modulos_sap) TYPE any,
      deleted_modulos_sap   IMPORTING VALUE(it_deleted_rows) TYPE lvc_t_moce.

ENDCLASS.

CLASS lcl_business_ms IMPLEMENTATION.

  METHOD constructor.

    lo_modulos_sap = NEW zdla01gpcl_002( iv_table = `ZDLA01GPT_002` ).

  ENDMETHOD.

  METHOD get_modulos_sap.

    lo_modulos_sap->read( IMPORTING et_data = lt_modulos_sap ).

  ENDMETHOD.

  METHOD set_modulos_sap.

    CHECK it_modulos_sap IS NOT INITIAL.

    GET TIME STAMP FIELD DATA(lv_timestamp).

    DATA(lt_mod_modulos_sap) = CORRESPONDING zdla01gptt_002( it_modulos_sap ).

    LOOP AT lt_mod_modulos_sap INTO DATA(ls_modulos_sap).

      ls_modulos_sap-criado_em  = lv_timestamp.
      ls_modulos_sap-criado_por = sy-uname.

      ls_modulos_sap-modificado_em  = lv_timestamp.
      ls_modulos_sap-modificado_por = sy-uname.

      MODIFY zdla01gpt_002 FROM ls_modulos_sap.
    ENDLOOP.

    MESSAGE `Registros processados com sucesso!` TYPE 'S'.

    COMMIT WORK.

  ENDMETHOD.

  METHOD deleted_modulos_sap.

    CHECK it_deleted_rows[] IS NOT INITIAL.

    LOOP AT it_deleted_rows INTO DATA(ls_deleted_rows).

      DATA(ls_modulos_sap) = lt_modulos_sap[ ls_deleted_rows-row_id ].

      DELETE FROM zdla01gpt_002 WHERE modulo = ls_modulos_sap-modulo.

      CLEAR ls_modulos_sap.

    ENDLOOP.

    MESSAGE `Registros deletados com sucesso!` TYPE 'S'.

    COMMIT WORK.

  ENDMETHOD.

ENDCLASS.
