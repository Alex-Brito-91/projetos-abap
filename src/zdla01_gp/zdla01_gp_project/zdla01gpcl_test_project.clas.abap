class ZDLA01GPCL_TEST_PROJECT definition
  public
  final
  create public
  for testing
  risk level harmless .

public section.

  data GO_PROJECT type ref to ZDLA01GPCL_002 .
  PROTECTED SECTION.
private section.

  methods SETUP .
  methods TEARDOWN .
  methods FILLED
  for testing
    raising
      ZDLA01GPCL_003 .
  methods HAS_NO_OWNER
  for testing
    raising
      ZDLA01GPCL_003 .
  methods HAS_NO_SQUAD
  for testing
    raising
      ZDLA01GPCL_003 .
  methods HAS_NO_TITLE
  for testing
    raising
      ZDLA01GPCL_003 .
  methods HAS_NO_DESCRIPTION
  for testing
    raising
      ZDLA01GPCL_003 .
  methods EDIT
  for testing
    raising
      ZDLA01GPCL_003 .
  methods DELETE
  for testing
    raising
      ZDLA01GPCL_003 .
ENDCLASS.



CLASS ZDLA01GPCL_TEST_PROJECT IMPLEMENTATION.


  METHOD filled.

    DATA(project) = VALUE zdla01gpt_003(
      titulo        = `Projeto Teste`
      descricao     = `Descrição`
      modulo        = `FI`
      setor         = '1'
      equipe        = '1'
      responsavel   = `DLA001`
      data_inicio   = `20240804`
      data_fim      = `20240831`
      data_fim_real = ''
    ).

    DATA(ls_result) = me->go_project->create(
      CHANGING
        cs_data = project
    ).

    cl_abap_unit_assert=>assert_equals( act = ls_result-type exp = 'S' msg = ls_result-message ).

  ENDMETHOD.


  METHOD has_no_description.

    DATA(project) = VALUE zdla01gpt_003(
      titulo        = `Projeto Teste`
      modulo        = `FI`
      setor         = '1'
      equipe        = '1'
      responsavel   = `DLA001`
      data_inicio   = `20240804`
      data_fim      = `20240831`
      data_fim_real = ''
    ).

    DATA(ls_result) = me->go_project->create(
                        CHANGING cs_data = project
                      ).

    cl_abap_unit_assert=>assert_equals( act = ls_result-type exp = 'E' msg = ls_result-message ).

  ENDMETHOD.


  METHOD has_no_owner.

    DATA(project) = VALUE zdla01gpt_003(
      titulo        = `Projeto Teste`
      descricao     = `Descrição`
      modulo        = `FI`
      setor         = '1'
      equipe        = '1'
      data_inicio   = `20240804`
      data_fim      = `20240831`
      data_fim_real = ''
    ).

    DATA(ls_result) = me->go_project->create(
                        CHANGING cs_data = project
                      ).

    cl_abap_unit_assert=>assert_equals( act = ls_result-type exp = 'E' msg = ls_result-message ).

  ENDMETHOD.


  METHOD has_no_squad.

    DATA(project) = VALUE zdla01gpt_003(
      titulo        = `Projeto Teste`
      descricao     = `Descrição`
      modulo        = `FI`
      setor         = '1'
      responsavel   = `DLA001`
      data_inicio   = `20240804`
      data_fim      = `20240831`
      data_fim_real = ''
    ).

    DATA(ls_result) = me->go_project->create(
                        CHANGING cs_data = project
                      ).

    cl_abap_unit_assert=>assert_equals( act = ls_result-type exp = 'E' msg = ls_result-message ).

  ENDMETHOD.


  METHOD has_no_title.

    DATA(project) = VALUE zdla01gpt_003(
      descricao     = `Descrição`
      modulo        = `FI`
      setor         = '1'
      equipe        = '1'
      responsavel   = `DLA001`
      data_inicio   = `20240804`
      data_fim      = `20240831`
      data_fim_real = ''
    ).

    DATA(ls_result) = me->go_project->create(
                        CHANGING cs_data = project
                      ).

    cl_abap_unit_assert=>assert_equals( act = ls_result-type exp = 'E' msg = ls_result-message ).

  ENDMETHOD.


  METHOD setup.

    me->go_project = NEW zdla01gpcl_002( `zdla01gpt_003` ).

  ENDMETHOD.


  METHOD teardown.

    FREE: me->go_project.

  ENDMETHOD.


  method DELETE.

*    Declarar um Sucesso
     DATA(project) = VALUE zdla01gpt_003(
        titulo        = `Projeto Teste`
        descricao     = `Descrição`
        modulo        = `FI`
        setor         = '1'
        equipe        = '1'
        responsavel   = `DLA001`
        data_inicio   = `20240804`
        data_fim      = `20240831`
        data_fim_real = ''
    ).

*   Criar um Projeto
    DATA(ls_result_create) = me->go_project->create(
      CHANGING
        cs_data = project
    ).

*    Modificar o Projeto
    project-id        = ls_result_create-message_v1.
    project-descricao = `Deleted`.

    DATA(ls_result_delete) = me->go_project->delete( project ).

    cl_abap_unit_assert=>assert_equals( act = ls_result_delete-type exp = 'S' msg = ls_result_delete-message ).

  endmethod.


  method EDIT.

*    Declarar um Sucesso
     DATA(project) = VALUE zdla01gpt_003(
      titulo        = `Projeto Teste`
      descricao     = `Descrição`
      modulo        = `FI`
      setor         = '1'
      equipe        = '1'
      responsavel   = `DLA001`
      data_inicio   = `20240804`
      data_fim      = `20240831`
      data_fim_real = ''
    ).

*   Criar um Projeto
    DATA(ls_result_create) = me->go_project->create(
      CHANGING
        cs_data = project
    ).

*    Modificar o Projeto
    project-id        = ls_result_create-message_v1.
    project-descricao = `Modified`.

    DATA(ls_result_update) = me->go_project->update(
      CHANGING
        CS_DATA = project
    ).

    cl_abap_unit_assert=>assert_equals( act = ls_result_update-type exp = 'S' msg = ls_result_update-message ).

  endmethod.
ENDCLASS.
