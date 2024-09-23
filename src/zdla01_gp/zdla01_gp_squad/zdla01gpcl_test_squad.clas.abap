CLASS zdla01gpcl_test_squad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING RISK LEVEL HARMLESS.

  PUBLIC SECTION.

    DATA go_squad TYPE REF TO zdla01gpcl_004 .
  PROTECTED SECTION.
private section.

  methods SETUP .
  methods TEARDOWN .
  methods HAS_NO_DESCRIPTION
  for testing
    raising
      ZDLA01GPCL_003 .
  methods FILLED
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



CLASS ZDLA01GPCL_TEST_SQUAD IMPLEMENTATION.


  METHOD delete.

    DATA(squad) = VALUE zdla01gpt_004(
      descricao = `Equipe Top`
    ).

*   Criar uma Equipe
    DATA(ls_result_create) = me->go_squad->create(
      CHANGING
        cs_data = squad
    ).

*    Modificar uma Equipe
    squad-id        = ls_result_create-message_v1.
    squad-descricao = `Deleted`.

    DATA(ls_result_delete) = me->go_squad->delete( squad ).

    cl_abap_unit_assert=>assert_equals(
      act = ls_result_delete-type
      exp = 'S'
      msg = ls_result_delete-message
    ).

  ENDMETHOD.


  METHOD edit.

    DATA(squad) = VALUE zdla01gpt_004(
        descricao = `Equipe Top`
      ).

      DATA(ls_result) = me->go_squad->create(
        CHANGING
          cs_data = squad
      ).

      cl_abap_unit_assert=>assert_equals(
        act = ls_result-type
        exp = 'S'
        msg = ls_result-message
      ).

*   Criar uma Equipe
    DATA(ls_result_create) = me->go_squad->create(
      CHANGING
        cs_data = squad
    ).

*   Modificar uma Equipe
    squad-id        = ls_result_create-message_v1.
    squad-descricao = `Modified`.

    DATA(ls_result_update) = me->go_squad->update(
      CHANGING
        CS_DATA = squad
    ).

    cl_abap_unit_assert=>assert_equals( act = ls_result_update-type exp = 'S' msg = ls_result_update-message ).

  ENDMETHOD.


  METHOD filled.

    DATA(squad) = VALUE zdla01gpt_004(
      descricao = `Equipe Top`
    ).

    DATA(ls_result) = me->go_squad->create(
      CHANGING
        cs_data = squad
    ).

    cl_abap_unit_assert=>assert_equals(
      act = ls_result-type
      exp = 'S'
      msg = ls_result-message
    ).

  ENDMETHOD.


  METHOD has_no_description.

    DATA(squad) = VALUE zdla01gpt_004(
      descricao = ''
    ).

    DATA(ls_result)    = me->go_squad->create(
      CHANGING cs_data = squad
    ).

    cl_abap_unit_assert=>assert_equals(
      act = ls_result-type
      exp = 'E'
      msg = ls_result-message
    ).

  ENDMETHOD.


  METHOD setup.

    me->go_squad = NEW zdla01gpcl_004( `ZDLA01GPT_004` ).

  ENDMETHOD.


  METHOD teardown.

    FREE: me->go_squad.

  ENDMETHOD.
ENDCLASS.
