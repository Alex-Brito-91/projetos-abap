*&---------------------------------------------------------------------*
*& Report Z_RP_CATIVIDADES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDLA01_PE_RPCDATV.

  SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
      SELECTION-SCREEN COMMENT 6(14) FOR FIELD P_BIM.
      PARAMETERS: p_bim TYPE zst_model_atividades-bimestre OBLIGATORY.
      SELECTION-SCREEN COMMENT 35(11) FOR FIELD P_TRM.
      PARAMETERS: p_trm TYPE zst_model_atividades-turma OBLIGATORY.
      SELECTION-SCREEN COMMENT 62(16) FOR FIELD P_DIS.
      PARAMETERS: p_dis TYPE zst_model_atividades-disciplina OBLIGATORY.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
      SELECTION-SCREEN COMMENT 6(11) FOR FIELD P_ALN.
      PARAMETERS: p_aln TYPE zst_model_atividades-aluno OBLIGATORY.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
      SELECTION-SCREEN COMMENT 6(12) FOR FIELD P_NT1.
      PARAMETERS: p_nt1 TYPE zst_model_atividades-nota1.
      SELECTION-SCREEN COMMENT 28(12) FOR FIELD P_NT2.
      PARAMETERS: p_nt2 TYPE zst_model_atividades-nota2.
      SELECTION-SCREEN COMMENT 50(12) FOR FIELD P_NT3.
      PARAMETERS: p_nt3 TYPE zst_model_atividades-nota3.
      SELECTION-SCREEN COMMENT 72(12) FOR FIELD P_NT4.
      PARAMETERS: p_nt4 TYPE zst_model_atividades-nota4.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN PUSHBUTTON /6(14) pb_cdt USER-COMMAND pb1.
    SELECTION-SCREEN PUSHBUTTON 72(17) pb_lst USER-COMMAND pb2.

    SELECTION-SCREEN SKIP 1.

  SELECTION-SCREEN END OF BLOCK b1.

  INITIALIZATION.
    pb_cdt = '@ME@ Cadastrar'.
    pb_lst = '@UI@ Exibir Lista'.

  AT SELECTION-SCREEN.

    DATA: st_atividades TYPE zst_model_atividades.

    st_atividades = VALUE #(
      ano        = sy-datum(4)
      bimestre   = p_bim
      turma      = p_trm
      disciplina = p_dis
      aluno      = p_aln
      nota1      = p_nt1
      nota2      = p_nt2
      nota3      = p_nt3
      nota4      = p_nt4
    ).
