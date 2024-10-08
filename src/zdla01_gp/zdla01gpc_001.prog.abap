*&---------------------------------------------------------------------*
*& Report ZDLA01GPC_001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdla01gpc_001.

" Equipe         - ZDLA01GPT_004
" Equipes Perfil - ZDLA01GPT_005

" Projeto        - ZDLA01GPT_003

" Tickets        - ZDLA01GPT_007

" Horas          - ZDLA01GPT_009

SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE TEXT-001.
  PARAMETERS cb_clear AS CHECKBOX.
SELECTION-SCREEN END OF BLOCK b0.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-002.
  PARAMETERS cb_gener AS CHECKBOX.
SELECTION-SCREEN END OF BLOCK b1.

CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    TYPES tyt_ids TYPE TABLE OF zdla01gpel_004 WITH EMPTY KEY.

    METHODS run.
    METHODS clear_tables.
    METHODS generate_data.
    METHODS generate_squads RETURNING VALUE(rv_squad_id) TYPE zdla01gpel_004.

    METHODS generate_project IMPORTING iv_squad_id          TYPE zdla01gpel_004
                             RETURNING VALUE(rv_project_id) TYPE zdla01gpel_004.

    METHODS generate_tickets IMPORTING iv_project_id     TYPE zdla01gpel_004
                             RETURNING VALUE(rt_tickets) TYPE tyt_ids.

    METHODS generate_hours IMPORTING it_tickets_id TYPE tyt_ids.

ENDCLASS.


CLASS lcl_main IMPLEMENTATION.
  METHOD run.
    clear_tables( ).
    generate_data( ).
  ENDMETHOD.

  METHOD clear_tables.
    CHECK cb_clear = abap_true.

    DELETE FROM zdla01gpt_003. " Projeto
    DELETE FROM zdla01gpt_004. " Equipe
    DELETE FROM zdla01gpt_005. " Equipe Perfil
    DELETE FROM zdla01gpt_007. " Ticket
    DELETE FROM zdla01gpt_009. " Hora

    COMMIT WORK AND WAIT.
  ENDMETHOD.

  METHOD generate_data.
    CHECK cb_gener = abap_true.
    DATA(lv_squad_id)   = generate_squads( ).

    DATA(lv_project_id) = generate_project( lv_squad_id ).
    DATA(lt_tickets)    = generate_tickets( lv_project_id ).
    generate_hours( lt_tickets ).
  ENDMETHOD.

  METHOD generate_squads.
    DATA(lo_squad) = NEW zdla01gpcl_004( `ZDLA01GPT_004` ).

    " Criar Equipe
    DATA(ls_squad_1) = VALUE zdla01gpt_004( descricao = `Equipe Carga Dados 1` ).
    DATA(ls_return_squad_1) = lo_squad->create( CHANGING cs_data = ls_squad_1 ).

    rv_squad_id = ls_return_squad_1-message_v1.

    " Adicionar Consultores
    DATA(ls_squad_profile_1) = VALUE zdla01gpt_005( equipe     = rv_squad_id
                                                    usuario    = `CONSULTANT`
                                                    perfil     = '2'
                                                    criado_por = sy-uname
                                                    criado_em  = sy-datum ).
    MODIFY zdla01gpt_005 FROM ls_squad_profile_1.

    " Adicionar Admin
    DATA(ls_squad_profile_2) = VALUE zdla01gpt_005( equipe     = rv_squad_id
                                                    usuario    = `ADMIN`
                                                    perfil     = '1'
                                                    criado_por = sy-uname
                                                    criado_em  = sy-datum ).
    MODIFY zdla01gpt_005 FROM ls_squad_profile_2.
  ENDMETHOD.

  METHOD generate_project.
    DATA(lo_project) = NEW zdla01gpcl_002( `ZDLA01GPT_003` ).

    DATA(ls_project) = VALUE zdla01gpt_003( titulo      = `Projeto Carga`
                                            descricao   = `Testando Carga`
                                            modulo      = `FI`
                                            setor       = '4'
                                            equipe      = iv_squad_id
                                            responsavel = sy-uname
                                            data_inicio = sy-datum
                                            data_fim    = sy-datum + 10 ).

    DATA(ls_return) = lo_project->create( CHANGING cs_data = ls_project ).
    rv_project_id = ls_return-message_v1.
  ENDMETHOD.

  METHOD generate_tickets.
    DATA(lo_ticket) = NEW zdla01gpcl_006( `ZDLA01GPT_007` ).

    DATA(ls_ticket_1) = VALUE zdla01gpt_007( titulo         = `Task Carga de Dados 1`
                                             descricao      = `Ticket 1`
                                             projeto        = iv_project_id
                                             responsavel    = sy-uname
                                             hours_expected = `20`
                                             status         = '1' ).

    DATA(ls_return) = lo_ticket->create( CHANGING cs_data = ls_ticket_1 ).
    APPEND ls_return-message_v1 TO rt_tickets.

    DATA(ls_ticket_2) = VALUE zdla01gpt_007( titulo         = `Task Carga de Dados 2`
                                             descricao      = `Ticket 2`
                                             projeto        = iv_project_id
                                             responsavel    = sy-uname
                                             hours_expected = `30`
                                             status         = '1' ).

    DATA(ls_return_2) = lo_ticket->create( CHANGING cs_data = ls_ticket_2 ).
    APPEND ls_return_2-message_v1 TO rt_tickets.
  ENDMETHOD.

  METHOD generate_hours.
    DATA(lo_hour) = NEW zdla01gpcl_007( `ZDLA01GPT_009` ).

    DATA(lv_hour_1) = VALUE zdla01gpt_009( ticket    = it_tickets_id[ 1 ]
                                           usuario   = `CONSULTANT`
                                           horas     = '1'
                                           descricao = `Horas Apontadas 1` ).
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA(ls_return_1) = lo_hour->create( CHANGING cs_data = lv_hour_1 ).
    lo_hour->approve_hour( EXPORTING iv_approve = 'A'
                           CHANGING  cs_data    = lv_hour_1 ).

    DATA(lv_hour_2) = VALUE zdla01gpt_009( ticket    = it_tickets_id[ 1 ]
                                           usuario   = `CONSULTANT`
                                           horas     = '5'
                                           descricao = `Horas Apontadas 2` ).
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA(ls_return_2) = lo_hour->create( CHANGING cs_data = lv_hour_2 ).
    lo_hour->approve_hour( EXPORTING iv_approve = 'A'
                           CHANGING  cs_data    = lv_hour_2 ).

    DATA(lv_hour_3) = VALUE zdla01gpt_009( ticket    = it_tickets_id[ 1 ]
                                           usuario   = `CONSULTANT`
                                           horas     = '10'
                                           descricao = `Horas Apontadas 3` ).
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA(ls_return_3) = lo_hour->create( CHANGING cs_data = lv_hour_3 ).
    lo_hour->approve_hour( EXPORTING iv_approve = 'R'
                           CHANGING  cs_data    = lv_hour_3 ).

    DATA(lv_hour_4) = VALUE zdla01gpt_009( ticket    = it_tickets_id[ 2 ]
                                           usuario   = `CONSULTANT`
                                           horas     = '2'
                                           descricao = `Horas Apontadas 4` ).
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA(ls_return_4) = lo_hour->create( CHANGING cs_data = lv_hour_4 ).
    lo_hour->approve_hour( EXPORTING iv_approve = 'A'
                           CHANGING  cs_data    = lv_hour_4 ).

    DATA(lv_hour_5) = VALUE zdla01gpt_009( ticket    = it_tickets_id[ 2 ]
                                           usuario   = `CONSULTANT`
                                           horas     = '10'
                                           descricao = `Horas Apontadas 5` ).
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA(ls_return_5) = lo_hour->create( CHANGING cs_data = lv_hour_5 ).
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA(lo_main) = NEW lcl_main( ).
  lo_main->run( ).
