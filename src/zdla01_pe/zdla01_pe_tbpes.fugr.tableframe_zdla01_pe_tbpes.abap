*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZDLA01_PE_TBPES
*   generation date: 24.09.2024 at 07:51:53
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZDLA01_PE_TBPES    .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
