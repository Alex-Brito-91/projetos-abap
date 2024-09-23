class ZDLA01GPCL_002 definition
  public
  inheriting from ZDLA01GPCL_001
  final
  create public .

public section.

  methods READ
    redefinition .
  methods VALIDATE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZDLA01GPCL_002 IMPLEMENTATION.


  METHOD VALIDATE.

    DATA(ls_projeto) = CORRESPONDING zdla01gpt_003( is_data ).

    " Não pode salvar projeto sem ID
    IF ls_projeto-id IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_id
      ).
    ENDIF.

    " Só continua as validações caso não seja deleção.
    CHECK iv_is_delete IS INITIAL.

    " Não pode salvar projeto sem Título
    IF ls_projeto-titulo IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_title
      ).
    ENDIF.

    " Não pode salvar projeto sem Equipe
    IF ls_projeto-equipe IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_squad
      ).
    ENDIF.

    " Não pode salvar projeto sem Descrição
    IF ls_projeto-descricao IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_description
      ).
    ENDIF.

    " Não pode salvar projeto sem Responsável
    IF ls_projeto-responsavel IS INITIAL.
      RAISE EXCEPTION NEW zdla01gpcl_003(
       textid = zdla01gpcl_003=>has_no_owner
      ).
    ENDIF.

  ENDMETHOD.


  METHOD read.

    SELECT *
      FROM (lv_table)
      INTO TABLE et_data.

  ENDMETHOD.
ENDCLASS.
