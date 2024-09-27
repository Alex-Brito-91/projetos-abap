*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 24.09.2024 at 07:51:54
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01_PE_TBPES.................................*
DATA:  BEGIN OF STATUS_ZDLA01_PE_TBPES               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01_PE_TBPES               .
CONTROLS: TCTRL_ZDLA01_PE_TBPES
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01_PE_TBPES               .
TABLES: ZDLA01_PE_TBPES                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
