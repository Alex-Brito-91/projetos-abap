*&---------------------------------------------------------------------*
*& Report zdla01gprp_002
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdla01gprp_002.

TABLES: zdla01gpt_003, zdla01gpt_004, zdla01gpt_009.
INCLUDE zdla01gprp_003.

SELECTION-SCREEN BEGIN OF BLOCK b1
  WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS s_squad FOR zdla01gpt_004-id.
SELECTION-SCREEN END OF BLOCK b1.

CLASS lcl_main DEFINITION INHERITING FROM lcl_alv CREATE PRIVATE.

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_alv,
             equipe              TYPE zdla01gpt_004-id,
             equipe_desc         TYPE zdla01gpt_004-descricao,
             qtd_projetos        TYPE int4,
             projetos_prazo      TYPE int4,
             projetos_fora_prazo TYPE int4,
             eficacia_equipe     TYPE string,
             eficacia_equipe_txt TYPE string,
             color               TYPE lvc_t_scol,
           END OF ty_alv.

    DATA lt_alv TYPE TABLE OF ty_alv.

    CLASS-METHODS create
      RETURNING VALUE(r_result) TYPE REF TO lcl_main.

    METHODS run.
    METHODS get_data     REDEFINITION.
    METHODS set_fieldcat REDEFINITION.

ENDCLASS.


CLASS lcl_main IMPLEMENTATION.
  METHOD create.
    r_result = NEW #( ).
  ENDMETHOD.

  METHOD run.
    get_data( ).
    display_report( CHANGING lt_alv = lt_alv ).
  ENDMETHOD.

  METHOD get_data.
    " BREAK DLA001.

    " Selecionar as Equipes
    SELECT * FROM zdla01gpt_004
      INTO TABLE @DATA(lt_squads)
      WHERE id IN @s_squad.

    " Selecionar os Projetos e as Horas Estimadas
    SELECT z003~id,
           z003~equipe,
           SUM( z007~hours_expected ) AS expected
      FROM zdla01gpt_003 AS z003
             JOIN
               zdla01gpt_007 AS z007 ON z003~id = z007~projeto
                 JOIN
                   zdla01gpt_004 AS z004 ON z003~equipe = z004~id
      INTO TABLE @DATA(lt_projects)
      WHERE z003~equipe IN @s_squad
      GROUP BY z003~id,
               z003~equipe.

    " Selecionar o somatório das Horas Apontadas de Cada Projeto
    IF lt_projects[] IS NOT INITIAL.

      SELECT z007~projeto,
             SUM( z009~horas ) AS horas
        FROM zdla01gpt_009 AS z009
               JOIN
                 zdla01gpt_007 AS z007 ON z009~ticket = z007~id
        INTO TABLE @DATA(lt_hours_by_project)

        GROUP BY z007~projeto.

    ENDIF.

    " Alimentar o ALV de Saída
    LOOP AT lt_squads REFERENCE INTO DATA(lrf_squads).

      " Quantidade de Projetos da Equipe
      DATA(lv_qtd_projetos_equipe) = REDUCE i( INIT count = 0
                                               FOR ls_project IN lt_projects
                                               WHERE ( equipe = lrf_squads->id )
                                               NEXT count += 1 ).

      " Projetos no Prazo
      DATA(lv_qtd_projetos_prazo)      = 0.

      " Projetos Fora do Prazo
      DATA(lv_qtd_projetos_fora_prazo) = 0.

      LOOP AT lt_projects REFERENCE
           INTO DATA(lrf_project)
           WHERE equipe = lrf_squads->id.

        " Total de Horas Apontadas no Projeto
        DATA(ls_hour) = VALUE #( lt_hours_by_project[ projeto = lrf_project->id ] OPTIONAL ).

        IF ls_hour-horas <= lrf_project->expected.
          lv_qtd_projetos_prazo += 1.
        ELSE.
          lv_qtd_projetos_fora_prazo += 1.
        ENDIF.

        CLEAR ls_hour.

      ENDLOOP.

      DATA(lv_eficacia) = ( lv_qtd_projetos_prazo * 100 ) / lv_qtd_projetos_equipe.

      DATA(lv_color) = COND #( WHEN lv_eficacia >= 1 AND lv_eficacia < 99 THEN 3
                               WHEN lv_eficacia = 100                     THEN 5
                               ELSE                                            6 ).

      DATA(lt_color_column) = VALUE lvc_t_scol( ( fname     = `EFICACIA_EQUIPE_TXT`
                                                  color-col = lv_color
                                                  color-int = 0
                                                  color-inv = 0 ) ).

      APPEND VALUE ty_alv( equipe              = lrf_squads->id
                           equipe_desc         = lrf_squads->descricao
                           qtd_projetos        = lv_qtd_projetos_equipe
                           projetos_prazo      = lv_qtd_projetos_prazo
                           projetos_fora_prazo = lv_qtd_projetos_fora_prazo
                           eficacia_equipe     = lv_eficacia
                           eficacia_equipe_txt = |{ lv_eficacia }%|
                           color               = lt_color_column )
             TO lt_alv.

    ENDLOOP.
  ENDMETHOD.

  METHOD set_fieldcat.
    fieldcat_change( _column   = `EQUIPE`
                     _longtxt  = `Equipe`
                     _position = 1 ).

    fieldcat_change( _column    = `EQUIPE_DESC`
                     _longtxt   = `Descrição`
                     _position  = 2
                     _outputlen = 25 ).

    fieldcat_change( _column    = `QTD_PROJETOS`
                     _longtxt   = `Qtd Projetos`
                     _position  = 3
                     _outputlen = 15
                     _align     = 3 ).

    fieldcat_change( _column    = `PROJETOS_PRAZO`
                     _longtxt   = `Projetos no Prazo`
                     _position  = 4
                     _outputlen = 15
                     _align     = 3 ).

    fieldcat_change( _column    = `PROJETOS_FORA_PRAZO`
                     _longtxt   = `Projetos Fora Prazo`
                     _position  = 5
                     _outputlen = 15
                     _align     = 3 ).

    fieldcat_change( _column  = `EFICACIA_EQUIPE`
                     _display = abap_false ).

    fieldcat_change( _column    = `EFICACIA_EQUIPE_TXT`
                     _longtxt   = `Eficácia %`
                     _position  = 6
                     _outputlen = 15
                     _align     = 3 ).
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  lcl_main=>create( )->run( ).
