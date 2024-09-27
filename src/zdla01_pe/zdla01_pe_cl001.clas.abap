CLASS zdla01_pe_cl001 DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA av_table TYPE string .

    METHODS constructor
      IMPORTING
        !iv_table TYPE string .
    METHODS read .
    METHODS create
      CHANGING
        !is_data TYPE any .
    METHODS update
      CHANGING
        !is_data TYPE any .
    METHODS delete
      IMPORTING
        !is_data TYPE any .
    METHODS validate
      IMPORTING
        !is_data            TYPE any
      RETURNING
        VALUE(can_excecute) TYPE xfeld .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdla01_pe_cl001 IMPLEMENTATION.


  METHOD create.

    GET TIME STAMP FIELD DATA(lv_timestamp).

    ASSIGN COMPONENT `ID` OF STRUCTURE is_data TO FIELD-SYMBOL(<fs_id>).
    ASSIGN COMPONENT `CRIADO_POR` OF STRUCTURE is_data TO FIELD-SYMBOL(<fs_criado_por>).
    ASSIGN COMPONENT `CRIADO_EM`  OF STRUCTURE is_data TO FIELD-SYMBOL(<fs_criado_em>).

    IF <fs_id> IS ASSIGNED.
      <fs_id> = cl_system_uuid=>create_uuid_x16_static( ).
    ENDIF.

    IF <fs_criado_por> IS ASSIGNED.
      <fs_criado_por> = sy-uname.
    ENDIF.

    IF <fs_criado_por> IS ASSIGNED.
      <fs_criado_em>  = lv_timestamp.
    ENDIF.

    CHECK me->validate( is_data ) EQ abap_true.

    MODIFY (av_table) FROM is_data.

  ENDMETHOD.


  METHOD delete.

*    CHECK me->validate( is_data ) EQ abap_true.
*
*    DELETE FROM (av_table) WHERE is_data.

  ENDMETHOD.


  METHOD read.
  ENDMETHOD.


  METHOD update.

    CHECK me->validate( is_data ) EQ abap_true.

    MODIFY (av_table) FROM is_data.

  ENDMETHOD.


  METHOD validate.

    can_excecute = abap_true.

  ENDMETHOD.


  METHOD constructor.

    me->av_table = iv_table.

  ENDMETHOD.
ENDCLASS.
