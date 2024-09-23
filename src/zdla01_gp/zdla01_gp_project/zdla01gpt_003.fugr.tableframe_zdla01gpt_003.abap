*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZDLA01GPT_003
*   generation date: 28.07.2024 at 17:54:56
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZDLA01GPT_003      .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
