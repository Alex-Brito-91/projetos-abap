class ZDLA01GPCL_010 definition
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



CLASS ZDLA01GPCL_010 IMPLEMENTATION.


  METHOD VALIDATE.

    DATA(ls_file) = CORRESPONDING zdla01gpt_012( is_data ).

    " Não pode salvar Arquivo sem ID
    IF ls_file-id IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_id
      ).
    ENDIF.

    " Só continua as validações caso não seja deleção.
    CHECK iv_is_delete IS INITIAL.

    " Não pode salvar Arquivo sem Ticket
    IF ls_file-ticket IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_ticket
      ).
    ENDIF.

    " Não pode salvar Arquivo sem Binário
    IF ls_file-binario IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_binary
      ).
    ENDIF.

    " Não pode salvar Arquivo sem Tipo Documento
    IF ls_file-tipo_documento IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_type_file
      ).
    ENDIF.

    " Não pode salvar Arquivo sem Nome
    IF ls_file-nome_arquivo IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_name_file
      ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
