CLASS zdla01gpcl_004 DEFINITION
  PUBLIC
  INHERITING FROM zdla01gpcl_001
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS validate
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdla01gpcl_004 IMPLEMENTATION.


  METHOD validate.

    DATA(ls_equipe) = CORRESPONDING zdla01gpt_004( is_data ).

     " Não pode salvar equipe sem ID
    IF ls_equipe-id IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_id
      ).
    ENDIF.

     " Não pode equipe sem Descrição
    IF ls_equipe-descricao IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_description
      ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
