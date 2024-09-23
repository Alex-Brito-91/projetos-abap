class ZDLA01GPCL_008 definition
  public
  inheriting from ZDLA01GPCL_001
  final
  create public .

public section.

  methods VALIDATE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZDLA01GPCL_008 IMPLEMENTATION.


  METHOD VALIDATE.

    DATA(ls_comments) = CORRESPONDING zdla01gpt_010( is_data ).

    " Não pode salvar Comments sem ID
    IF ls_comments-id IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_id
      ).
    ENDIF.

    " Só continua as validações caso não seja deleção.
    CHECK iv_is_delete IS INITIAL.

    " Não pode salvar Comments sem Comentário
    IF ls_comments-comentario IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_comment
      ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
