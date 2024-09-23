class ZDLA01GPCL_001 definition
  public
  abstract
  create public .

public section.

  data LV_TABLE type STRING .

  methods CONSTRUCTOR
    importing
      !IV_TABLE type STRING .
  methods READ
    exporting
      !ET_DATA type ANY TABLE .
  methods CREATE
    changing
      !CS_DATA type ANY
    returning
      value(RS_RESULT) type BAPIRET2
    raising
      ZDLA01GPCL_003 .
  methods UPDATE
    changing
      !CS_DATA type ANY
    returning
      value(RS_RESULT) type BAPIRET2
    raising
      ZDLA01GPCL_003 .
  methods DELETE
    importing
      !IS_DATA type ANY
    returning
      value(RS_RESULT) type BAPIRET2
    raising
      ZDLA01GPCL_003 .
  methods VALIDATE
    importing
      !IS_DATA type ANY
      !IV_IS_DELETE type XFELD optional
    raising
      ZDLA01GPCL_003 .
protected section.
private section.
ENDCLASS.



CLASS ZDLA01GPCL_001 IMPLEMENTATION.


  METHOD CREATE.

    GET TIME STAMP FIELD DATA(lv_timestamp).

    " Preenchendo Criado Por
    ASSIGN COMPONENT `CRIADO_POR` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_criado_por>).
    IF <fs_criado_por> IS ASSIGNED.
      <fs_criado_por> = sy-uname.
    ENDIF.

    " Preenchendo Criado Em
    ASSIGN COMPONENT `CRIADO_EM` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_criado_em>).
    IF <fs_criado_em> IS ASSIGNED.
      <fs_criado_em> = lv_timestamp.
    ENDIF.

    " Preenchendo ID
    ASSIGN COMPONENT `ID` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_id>).
    IF <fs_id> IS ASSIGNED.
      <fs_id> = cl_system_uuid=>create_uuid_c32_static( ).
    ENDIF.

    TRY .
      me->validate( cs_data ).
    CATCH zdla01gpcl_003 INTO DATA(lx_exc).
      " Erro disparado!
      DATA(lv_msg) = lx_exc->get_text( ).
      rs_result = VALUE bapiret2(
        type    = 'E'
        message = lv_msg
      ).
      RETURN.
    ENDTRY.
*    Cria o Registro
    MODIFY (lv_table) FROM cs_data.

    rs_result = VALUE bapiret2(
      type       = 'S'
      message    = `Criado com Sucesso!`
      message_v1 = <fs_id>
    ).

  ENDMETHOD.


  METHOD DELETE.

    " Buscando Referência ID
    ASSIGN COMPONENT `ID` OF STRUCTURE is_data TO FIELD-SYMBOL(<fs_delete_id>).

    TRY .
      me->validate( EXPORTING is_data = is_data iv_is_delete = abap_true ).
    CATCH zdla01gpcl_003 INTO DATA(lx_exc).
      " Erro disparado!
      DATA(lv_msg) = lx_exc->get_text( ).

      rs_result = VALUE bapiret2(
        type    = 'E'
        message = lv_msg
      ).
      RETURN.
    ENDTRY.

*   Deleta o Registro
    DELETE (me->lv_table) FROM is_data.

    rs_result = VALUE bapiret2(
      type       = 'S'
      message    = `Deletado com Sucesso!`
      message_v1 = <fs_delete_id>
    ).


  ENDMETHOD.


  method READ.
  endmethod.


  METHOD update.

    GET TIME STAMP FIELD DATA(lv_timestamp).

    " Preenchendo Modificado Por
    ASSIGN COMPONENT `MODIFICADO_POR` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_por>).
    IF <fs_modificado_por> IS ASSIGNED.
      <fs_modificado_por> = sy-uname.
    ENDIF.

    " Preenchendo Modificado Em
    ASSIGN COMPONENT `MODIFICADO_EM` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_em>).
    IF <fs_modificado_em> IS ASSIGNED.
      <fs_modificado_em> = lv_timestamp.
    ENDIF.

    " Buscando Referência ID
    ASSIGN COMPONENT `ID` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_id>).

    TRY .
      me->validate( cs_data ).
    CATCH zdla01gpcl_003 INTO DATA(lx_exc).
      " Erro disparado!
      DATA(lv_msg) = lx_exc->get_text( ).

      rs_result = VALUE bapiret2(
        type    = 'E'
        message = lv_msg
      ).
      RETURN.
    ENDTRY.

*   Modifica o Registro
    MODIFY (lv_table) FROM cs_data.

    rs_result = VALUE bapiret2(
      type       = 'S'
      message    = `Modificado com Sucesso!`
      message_v1 = <fs_modificado_id>
    ).

ENDMETHOD.


  method VALIDATE.
  endmethod.


  method CONSTRUCTOR.

    me->lv_table = iv_table.

  endmethod.
ENDCLASS.
