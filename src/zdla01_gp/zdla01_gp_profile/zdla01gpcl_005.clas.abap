CLASS zdla01gpcl_005 DEFINITION
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



CLASS zdla01gpcl_005 IMPLEMENTATION.


  METHOD validate.

    DATA(ls_perfil) = CORRESPONDING zdla01gpt_006( is_data ).

    " Não pode salvar perfil sem ID
    IF ls_perfil-id IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003( textid = zdla01gpcl_003=>has_no_id
                                          ).
    ENDIF.

    " Não pode salvar perfil sem Descrição
    IF ls_perfil-descricao IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003( textid = zdla01gpcl_003=>has_no_description
                                          ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
