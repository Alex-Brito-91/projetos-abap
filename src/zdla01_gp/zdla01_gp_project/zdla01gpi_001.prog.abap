*&---------------------------------------------------------------------*
*& Modulpool ZDLA01GPI_001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM zdla01gpi_001.

" Declarações Globais
DATA: go_custom_control TYPE REF TO cl_gui_custom_container, " Componente de tela (Quadrado)
      go_grid           TYPE REF TO cl_gui_alv_grid,         " Lista
      gt_fieldcat       TYPE lvc_t_fcat,                     " Características da Coluna
      gs_layout         TYPE lvc_s_layo                      " Catacterísticas da Lista
      .

INCLUDE: zdla01gpi_001_se,
         zdla01gpi_001_ms,
         zdla01gpi_001_pj
         .

" Classe Negócio
CLASS lcl_business DEFINITION.

  PUBLIC SECTION.

    DATA: lo_business_se TYPE REF TO lcl_business_se,
          lo_business_ms TYPE REF TO lcl_business_ms,
          lo_business_pj TYPE REF TO lcl_business_pj.

    DATA: lv_screen        TYPE string.

    METHODS: constructor IMPORTING VALUE(iv_screen) TYPE string,
      run,
      run_project,
      run_setor_empresa,
      run_modulo_sap,
      refresh,
      active_change_handle,
      handle_data_changed   FOR EVENT data_changed OF cl_gui_alv_grid
                            IMPORTING er_data_changed
      .

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_business IMPLEMENTATION.

  METHOD constructor.

    lv_screen = iv_screen.
    lo_business_se = NEW lcl_business_se( ).
    lo_business_ms = NEW lcl_business_ms( ).
    lo_business_pj = NEW lcl_business_pj( ).

  ENDMETHOD.

  METHOD run.

    CALL METHOD (lv_screen).

  ENDMETHOD.

  METHOD run_project.

    CHECK go_custom_control IS INITIAL.

    " Atrelando um componente de tela a um objeto ABAP
    go_custom_control = NEW cl_gui_custom_container( `CC_PROJETOS` ).

    " Atrelando a GRID a um objeto ABAP de tela
    go_grid = NEW cl_gui_alv_grid( i_parent = go_custom_control ).

    " Carregamos configurações padrão das colunas
    CALL FUNCTION `LVC_FIELDCATALOG_MERGE`
      EXPORTING
        i_structure_name = `ZDLA01GPT_003`
      CHANGING
        ct_fieldcat      = gt_fieldcat.

    LOOP AT gt_fieldcat ASSIGNING FIELD-SYMBOL(<fs_fieldcat>).
      CASE <fs_fieldcat>-fieldname.
        WHEN `TITULO`.
          <fs_fieldcat>-outputlen = 15.
          <fs_fieldcat>-edit      = abap_true.
        WHEN `DESCRICAO`.
          <fs_fieldcat>-outputlen = 15.
          <fs_fieldcat>-edit      = abap_true.
        WHEN `MODULO`.
          <fs_fieldcat>-outputlen = 6.
          <fs_fieldcat>-edit      = abap_true.
        WHEN `SETOR`.
          <fs_fieldcat>-outputlen = 12.
          <fs_fieldcat>-edit      = abap_true.
        WHEN `EQUIPE`.
          <fs_fieldcat>-outputlen = 8.
          <fs_fieldcat>-edit      = abap_true.
        WHEN `RESPONSAVEL`.
          <fs_fieldcat>-outputlen = 11.
          <fs_fieldcat>-edit      = abap_true.
        WHEN `DATA_INICIO`.
          <fs_fieldcat>-outputlen = 10.
          <fs_fieldcat>-edit      = abap_true.
        WHEN `DATA_FIM`.
          <fs_fieldcat>-outputlen = 10.
          <fs_fieldcat>-edit      = abap_true.
        WHEN `DATA_FIM_REAL`.
          <fs_fieldcat>-outputlen = 10.
          <fs_fieldcat>-edit      = abap_true.
        WHEN OTHERS.
          <fs_fieldcat>-no_out    = abap_true.
      ENDCASE.
    ENDLOOP.

    " Iniciamos nossa GRID
    go_grid->set_table_for_first_display(
      EXPORTING
        i_structure_name = `ZDLA01GPT_003`
        is_layout        = gs_layout
      CHANGING
        it_fieldcatalog  = gt_fieldcat
        it_outtab        = lo_business_pj->lt_projetos
    ).

    SET HANDLER handle_data_changed FOR go_grid.

    refresh( ).

  ENDMETHOD.

  METHOD run_setor_empresa.

    CHECK go_custom_control IS INITIAL.

    " Atrelando um componente de tela a um objeto ABAP
    go_custom_control = NEW cl_gui_custom_container( `CC_SETOR_EMPRESA` ).

    " Atrelando a GRID a um objeto ABAP de tela
    go_grid = NEW cl_gui_alv_grid( i_parent = go_custom_control ).

    " Carregamos configurações padrão das colunas
    CALL FUNCTION `LVC_FIELDCATALOG_MERGE`
      EXPORTING
        i_structure_name = `ZDLA01GPT_001`
      CHANGING
        ct_fieldcat      = gt_fieldcat.

    LOOP AT gt_fieldcat ASSIGNING FIELD-SYMBOL(<fs_fieldcat>).
      CASE <fs_fieldcat>-fieldname.
        WHEN `SETOR`.
          <fs_fieldcat>-just      = 'C'.
          <fs_fieldcat>-edit      = abap_true.
        WHEN `DESCRICAO`.
          <fs_fieldcat>-outputlen = 15.
          <fs_fieldcat>-edit      = abap_true.
        WHEN `MODIFICADO_EM`.
          <fs_fieldcat>-outputlen = 15.
          <fs_fieldcat>-scrtext_s = `Mod. Em`.
          <fs_fieldcat>-scrtext_m = `Modificado Em`.
          <fs_fieldcat>-scrtext_l = `Modificado Em`.
        WHEN `MODIFICADO_POR`.
          <fs_fieldcat>-scrtext_s = `Mod. Por`.
          <fs_fieldcat>-scrtext_m = `Modificado Por`.
          <fs_fieldcat>-scrtext_l = `Modificado Por`.
        WHEN OTHERS.
          <fs_fieldcat>-no_out    = abap_true.
      ENDCASE.
    ENDLOOP.

    " Iniciamos nossa GRID
    go_grid->set_table_for_first_display(
      EXPORTING
        i_structure_name = `ZDLA01GPT_001`
        is_layout        = gs_layout
      CHANGING
        it_fieldcatalog  = gt_fieldcat
        it_outtab        = lo_business_se->lt_setor_empresa
    ).

    SET HANDLER handle_data_changed FOR go_grid.

    refresh( ).

  ENDMETHOD.

  METHOD run_modulo_sap.

    CHECK go_custom_control IS INITIAL.

    " Atrelando um componente de tela a um objeto ABAP
    go_custom_control = NEW cl_gui_custom_container( `CC_MODULO_SAP` ).

    " Atrelando a GRID a um objeto ABAP de tela
    go_grid = NEW cl_gui_alv_grid( i_parent = go_custom_control ).

    " Carregamos configurações padrão das colunas
    CALL FUNCTION `LVC_FIELDCATALOG_MERGE`
      EXPORTING
        i_structure_name = `ZDLA01GPT_002`
      CHANGING
        ct_fieldcat      = gt_fieldcat.

    LOOP AT gt_fieldcat ASSIGNING FIELD-SYMBOL(<fs_fieldcat>).
      CASE <fs_fieldcat>-fieldname.
        WHEN `MODULO`.
          <fs_fieldcat>-outputlen = 10.
          <fs_fieldcat>-edit      = abap_true.
        WHEN `MODIFICADO_EM`.
          <fs_fieldcat>-outputlen = 15.
          <fs_fieldcat>-scrtext_s = `Mod. Em`.
          <fs_fieldcat>-scrtext_m = `Modificado Em`.
          <fs_fieldcat>-scrtext_l = `Modificado Em`.
        WHEN `MODIFICADO_POR`.
          <fs_fieldcat>-scrtext_s = `Mod. Por`.
          <fs_fieldcat>-scrtext_m = `Modificado Por`.
          <fs_fieldcat>-scrtext_l = `Modificado Por`.
        WHEN OTHERS.
          <fs_fieldcat>-no_out    = abap_true.
      ENDCASE.
    ENDLOOP.

    " Iniciamos nossa GRID
    go_grid->set_table_for_first_display(
      EXPORTING
        i_structure_name = `ZDLA01GPT_002`
        is_layout        = gs_layout
      CHANGING
        it_fieldcatalog  = gt_fieldcat
        it_outtab        = lo_business_ms->lt_modulos_sap
    ).

    SET HANDLER handle_data_changed FOR go_grid.

    refresh( ).

  ENDMETHOD.

  METHOD refresh.

    go_grid->refresh_table_display( ).
    cl_gui_cfw=>flush( ).

  ENDMETHOD.

  METHOD handle_data_changed.

    ASSIGN er_data_changed->mp_mod_rows->* TO FIELD-SYMBOL(<modified_rows>).
    ASSIGN er_data_changed->mt_deleted_rows TO FIELD-SYMBOL(<deleted_rows>).

    CASE lv_screen.
      WHEN `RUN_SETOR_EMPRESA`.
        lo_business_se->set_setor_empresa( <modified_rows> ).
        lo_business_se->deleted_setor_empresa( <deleted_rows> ).
      WHEN `RUN_MODULO_SAP`.
        lo_business_ms->set_modulos_sap( <modified_rows> ).
        lo_business_ms->deleted_modulos_sap( <deleted_rows> ).
      WHEN `RUN_PROJECT`.
        lo_business_pj->set_projetos( <modified_rows> ).
        lo_business_pj->deleted_projetos( <deleted_rows> ).
    ENDCASE.

  ENDMETHOD.

  METHOD active_change_handle.

    go_grid->check_changed_data( ).

  ENDMETHOD.

ENDCLASS.

DATA: lo_business TYPE REF TO lcl_business.

" Antes de Exibir a Tela
MODULE set_status OUTPUT.

  IF lo_business IS INITIAL.
    lo_business = NEW lcl_business(
      COND #(
        WHEN sy-dynnr = `2001` THEN `RUN_PROJECT`
        WHEN sy-dynnr = `2002` THEN `RUN_SETOR_EMPRESA`
        ELSE `RUN_MODULO_SAP`
      )
    ).
  ENDIF.
  lo_business->run( ).

  SET PF-STATUS `STANDARD`.
  SET TITLEBAR sy-dynnr.
ENDMODULE.

" Depois de Exibir a Tela
MODULE user_command INPUT.

  CASE sy-ucomm.
      " Eventos de Saída da Transação
    WHEN `&F03` OR `&F15` OR `&F12`.
      LEAVE PROGRAM.
    WHEN `BTN_SETOR_EMPRESA`.
      lo_business->lo_business_se->get_setor_empresa( ).
      lo_business->refresh( ).
    WHEN `BTN_MODULO`.
      lo_business->lo_business_ms->get_modulos_sap( ).
      lo_business->refresh( ).
    WHEN `BTN_PROJECT`.
      lo_business->lo_business_pj->get_projetos( ).
      lo_business->refresh( ).
    WHEN `BTN_SE_SAVE` OR `BTN_PJ_SAVE` OR `BTN_MS_SAVE`.
      lo_business->active_change_handle( ).
  ENDCASE.

ENDMODULE.
