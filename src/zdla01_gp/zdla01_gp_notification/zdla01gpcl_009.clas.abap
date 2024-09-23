class ZDLA01GPCL_009 definition
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



CLASS ZDLA01GPCL_009 IMPLEMENTATION.


  METHOD VALIDATE.

    DATA(ls_notification) = CORRESPONDING zdla01gpt_011( is_data ).

    " Não pode salvar Notification sem ID
    IF ls_notification-id IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_id
      ).
    ENDIF.

    " Só continua as validações caso não seja deleção.
    CHECK iv_is_delete IS INITIAL.

    " Não pode salvar Notification sem Ticket
    IF ls_notification-ticket IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_ticket
      ).
    ENDIF.

    " Não pode salvar Notification sem Usuário
    IF ls_notification-usuario IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_user
      ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
