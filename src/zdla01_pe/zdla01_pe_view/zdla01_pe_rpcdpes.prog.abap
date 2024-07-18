*&---------------------------------------------------------------------*
*& Report Z_RP_CPESSOA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDLA01_PE_RPCDPES.

SELECTION-SCREEN BEGIN OF SCREEN 110 AS SUBSCREEN.
  SELECTION-SCREEN BEGIN OF BLOCK b1.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
      SELECTION-SCREEN COMMENT 5(10) FOR FIELD P_PNOME.
      PARAMETERS: p_pnome TYPE zst_model_pessoa-nome OBLIGATORY.
      SELECTION-SCREEN COMMENT 55(9) FOR FIELD P_PCPF.
      PARAMETERS: p_pcpf TYPE zst_model_pessoa-cpf OBLIGATORY.
      SELECTION-SCREEN COMMENT 80(21) FOR FIELD P_PDNASC.
      PARAMETERS: p_pdnasc TYPE zst_model_pessoa-data_nasc OBLIGATORY.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
      SELECTION-SCREEN COMMENT 5(15) FOR FIELD P_PTEL.
      PARAMETERS: p_ptel TYPE zst_model_pessoa-telefone OBLIGATORY.
      SELECTION-SCREEN COMMENT 56(10) FOR FIELD P_PEMAIL.
      PARAMETERS: p_pemail TYPE zst_model_pessoa-email OBLIGATORY.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
      SELECTION-SCREEN COMMENT 5(15) FOR FIELD P_PEND.
      PARAMETERS: p_pend TYPE zst_model_pessoa-endereco OBLIGATORY.
      SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
      SELECTION-SCREEN COMMENT 5(16) FOR FIELD P_PDISC.
      PARAMETERS: p_pdisc TYPE zst_model_pessoa-disciplina OBLIGATORY.
      SELECTION-SCREEN COMMENT 45(13) FOR FIELD P_PTURM.
      PARAMETERS: p_pturm TYPE zst_model_pessoa-turma OBLIGATORY.
      SELECTION-SCREEN COMMENT 78(13) FOR FIELD P_PTURM2.
      PARAMETERS: p_pturm2 TYPE zst_model_pessoa-turma.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
      SELECTION-SCREEN COMMENT 5(13) FOR FIELD P_PTURM3.
      PARAMETERS: p_pturm3 TYPE zst_model_pessoa-turma.
      SELECTION-SCREEN COMMENT 45(13) FOR FIELD P_PTURM4.
      PARAMETERS: p_pturm4 TYPE zst_model_pessoa-turma.
      SELECTION-SCREEN COMMENT 78(13) FOR FIELD P_PTURM5.
      PARAMETERS: p_pturm5 TYPE zst_model_pessoa-turma.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 2.

    SELECTION-SCREEN PUSHBUTTON /5(14) pb_cdtp USER-COMMAND pbp1.
    SELECTION-SCREEN PUSHBUTTON 30(17) pb_lstp USER-COMMAND pbp2.

  SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN END OF SCREEN 110.

SELECTION-SCREEN BEGIN OF SCREEN 120 AS SUBSCREEN.
  SELECTION-SCREEN BEGIN OF BLOCK b2.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
      SELECTION-SCREEN COMMENT 5(10) FOR FIELD P_ANOME.
      PARAMETERS: p_anome TYPE zst_model_pessoa-nome OBLIGATORY.
      SELECTION-SCREEN COMMENT 55(9) FOR FIELD P_ACPF.
      PARAMETERS: p_acpf TYPE zst_model_pessoa-cpf OBLIGATORY.
      SELECTION-SCREEN COMMENT 80(21) FOR FIELD P_ADNASC.
      PARAMETERS: p_adnasc TYPE zst_model_pessoa-data_nasc OBLIGATORY.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
      SELECTION-SCREEN COMMENT 5(15) FOR FIELD P_ATEL.
      PARAMETERS: p_atel TYPE zst_model_pessoa-telefone OBLIGATORY.
      SELECTION-SCREEN COMMENT 56(10) FOR FIELD P_AEMAIL.
      PARAMETERS: p_aemail TYPE zst_model_pessoa-email OBLIGATORY.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
      SELECTION-SCREEN COMMENT 5(15) FOR FIELD P_AEND.
      PARAMETERS: p_aend TYPE zst_model_pessoa-endereco OBLIGATORY.
      SELECTION-SCREEN COMMENT 65(13) FOR FIELD P_ATURM.
      PARAMETERS: p_aturm TYPE zst_model_pessoa-turma OBLIGATORY.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 2.

    SELECTION-SCREEN PUSHBUTTON /5(14) pb_cdta USER-COMMAND pba1.
    SELECTION-SCREEN PUSHBUTTON 30(17) pb_lsta USER-COMMAND pba2.

  SELECTION-SCREEN END OF BLOCK b2.
SELECTION-SCREEN END OF SCREEN 120.

SELECTION-SCREEN SKIP 1.


SELECTION-SCREEN BEGIN OF TABBED BLOCK tab_block FOR 14 LINES.
  SELECTION-SCREEN TAB (20) tab1 USER-COMMAND comm1 DEFAULT SCREEN 110.
  SELECTION-SCREEN TAB (20) tab2 USER-COMMAND comm2 DEFAULT SCREEN 120.
SELECTION-SCREEN END OF BLOCK tab_block.

INITIALIZATION.
  tab1                = 'Cadastro Professor'.
  tab2                = 'Cadastro Aluno'.
  tab_block-activetab = 'COMM1'.
  tab_block-dynnr     = 110.
  pb_cdtp             = '@ME@ Cadastrar'.
  pb_lstp             = '@UI@ Exibir Lista'.
  pb_cdta             = '@ME@ Cadastrar'.
  pb_lsta             = '@UI@ Exibir Lista'.

AT SELECTION-SCREEN.

  DATA: st_professor TYPE zst_model_pessoa,
        st_aluno     TYPE zst_model_pessoa.

  st_professor = VALUE #(
    nome       = p_pnome
    cpf        = p_pcpf
    data_nasc  = p_pdnasc
    telefone   = p_ptel
    email      = p_pemail
    endereco   = p_pend
    disciplina = p_pdisc
    turma      = p_pturm
    turma2     = p_pturm2
    turma3     = p_pturm3
    turma4     = p_pturm4
    turma5     = p_pturm5
  ).

  st_aluno = VALUE #(
    nome      = p_anome
    cpf       = p_acpf
    data_nasc = p_adnasc
    telefone  = p_atel
    email     = p_aemail
    endereco  = p_aend
    turma     = p_aturm
  ).
