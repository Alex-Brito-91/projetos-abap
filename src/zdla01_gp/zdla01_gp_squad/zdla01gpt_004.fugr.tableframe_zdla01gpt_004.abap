*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZDLA01GPT_004
*   generation date: 05.08.2024 at 08:34:06
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZDLA01GPT_004      .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
