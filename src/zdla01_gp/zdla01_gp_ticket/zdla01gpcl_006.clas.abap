class ZDLA01GPCL_006 definition
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



CLASS ZDLA01GPCL_006 IMPLEMENTATION.


  METHOD VALIDATE.

    DATA(ls_ticket) = CORRESPONDING zdla01gpt_007( is_data ).

    " Não pode salvar ticket sem ID
    IF ls_ticket-id IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_id
      ).
    ENDIF.

    " Só continua as validações caso não seja deleção.
    CHECK iv_is_delete IS INITIAL.

    " Não pode salvar ticket sem Título
    IF ls_ticket-titulo IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_title
      ).
    ENDIF.

    " Não pode salvar ticket sem Descrição
    IF ls_ticket-descricao IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_description
      ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
