*&---------------------------------------------------------------------*
*& Report zdla01gprp_005
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdla01gprp_005.

TABLES zdla01gpt_003.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS s_proj FOR zdla01gpt_003-id.
SELECTION-SCREEN END OF BLOCK b1.

CLASS lcl_main DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    DATA lo_ida TYPE REF TO if_salv_gui_table_ida.

    CLASS-METHODS create
      RETURNING VALUE(r_result) TYPE REF TO lcl_main.

    METHODS run.
    METHODS set_fieldcat.

ENDCLASS.


CLASS lcl_main IMPLEMENTATION.
  METHOD create.
    r_result = NEW #( ).
  ENDMETHOD.

  METHOD run.
    lo_ida = cl_salv_gui_table_ida=>create_for_cds_view( `ZI_PROGRESSO_PROJETO` ).

    set_fieldcat( ).

    lo_ida->fullscreen( )->display( ).
  ENDMETHOD.

  METHOD set_fieldcat.
    DATA(lt_field_names) = VALUE if_salv_gui_types_ida=>yts_field_name( ( CONV string( 'ID' ) )
                                                                        ( CONV string( 'TITULO' ) )
                                                                        ( CONV string( 'TOTALHORASAPONTADAS' ) )
                                                                        ( CONV string( 'TOTALHORAS' ) )
                                                                        ( CONV string( 'PROGRESSO' ) ) ).
    lo_ida->field_catalog( )->set_available_fields( lt_field_names ).
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  lcl_main=>create( )->run( ).
