CLASS lcl_alv DEFINITION.
  PUBLIC SECTION.

    DATA: lo_alv     TYPE REF TO cl_salv_table,
          lo_cols    TYPE REF TO cl_salv_columns_table.

    METHODS: get_data,                                       " Seleciona os Projetos
             display_report CHANGING VALUE(lt_alv) TYPE any, " Exibe o Relatório
             set_fieldcat,                                   " Modifica as Colunas
             set_color,                                      " Modifica a Cor
             fieldcat_change IMPORTING _column    TYPE lvc_fname
                                       _longtxt   TYPE scrtext_l         OPTIONAL
                                       _position  TYPE int4              OPTIONAL
                                       _outputlen TYPE lvc_outlen        OPTIONAL
                                       _display   TYPE sap_bool          DEFAULT abap_true
                                       _align     TYPE salv_de_alignment OPTIONAL
                             .


ENDCLASS.

CLASS lcl_alv IMPLEMENTATION.

  METHOD get_data.
    " Vai ser sobrescrito
  ENDMETHOD.

  METHOD display_report.

    cl_salv_table=>factory(
      IMPORTING
        r_salv_table = lo_alv
      CHANGING
        t_table = lt_alv
    ).

    lo_cols = lo_alv->get_columns( ).

    set_fieldcat( ).
    set_color( ).

    lo_alv->display( ).

  ENDMETHOD.

  METHOD set_fieldcat.
    " Vai ser sobrescrito
  ENDMETHOD.

  METHOD set_color.

    TRY.
        lo_cols->set_color_column( EXPORTING value = 'COLOR' ).
      CATCH cx_salv_data_error.
    ENDTRY.

  ENDMETHOD.

  METHOD fieldcat_change.

    " Buscando a Coluna Informada
    DATA(lo_column) = lo_cols->get_column( _column ).

    " Modifica Texto Exibição
    lo_column->set_long_text( _longtxt ).

    " Modifica Visibilidade
    lo_column->set_visible( _display ).

    " 1 - Esquerda | 2 - Direita | 3 - Meio
    lo_column->set_alignment( COND #( WHEN _align IS NOT INITIAL THEN _align ELSE 1 ) ).

    " Modifica Tamanho Exibição
    lo_column->set_output_length( _outputlen ).

    " Modifica Ordem de Exibição
    lo_cols->set_column_position( columnname = _column
                                  position   = _position ).

  ENDMETHOD.

ENDCLASS.
