class ZDLA01_PE_CL002 definition
  public
  inheriting from ZDLA01_PE_CL001
  final
  create public .

public section.

  methods VALIDATE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZDLA01_PE_CL002 IMPLEMENTATION.


  METHOD validate.

    can_excecute = abap_true.

    DATA(ls_pessoa) = CORRESPONDING zdla01_pe_tbpes( is_data ).

    " Não se pode cadastrar pessoa sem id
*    IF ls_pessoa-id IS INITIAL.
*      can_excecute = abap_false.
*    ENDIF.

  ENDMETHOD.
ENDCLASS.
