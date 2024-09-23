class ZDLA01GPCL_007 definition
  public
  inheriting from ZDLA01GPCL_001
  final
  create public .

public section.

  methods APPROVE_HOUR
    importing
      !IV_APPROVE type ZDLA01GPEL_011
    changing
      !CS_DATA type ZDLA01GPT_009
    returning
      value(RS_RESULT) type BAPIRET2 .

  methods VALIDATE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZDLA01GPCL_007 IMPLEMENTATION.


  METHOD VALIDATE.

    DATA(ls_hour) = CORRESPONDING zdla01gpt_009( is_data ).

    " Não pode salvar hour sem ID
    IF ls_hour-id IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_id
      ).
    ENDIF.

    " Só continua as validações caso não seja deleção.
    CHECK iv_is_delete IS INITIAL.

    " Não pode salvar hour sem Descrição
    IF ls_hour-descricao IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_description
      ).
    ENDIF.

  ENDMETHOD.


  METHOD approve_hour.

    " Só aprova ou reprova
    CHECK iv_approve CA 'AR'.

    " Modifica o valor de entrada
    cs_data-aprovacao     = iv_approve.
    cs_data-aprovacao_em  = sy-datum.
    cs_data-aprovacao_por = sy-uname.

    MODIFY zdla01gpt_009 FROM cs_data.

  ENDMETHOD.
ENDCLASS.
