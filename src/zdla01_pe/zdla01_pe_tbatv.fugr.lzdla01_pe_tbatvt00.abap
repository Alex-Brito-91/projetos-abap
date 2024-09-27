*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 24.09.2024 at 14:02:20
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01_PE_TBATV.................................*
DATA:  BEGIN OF STATUS_ZDLA01_PE_TBATV               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01_PE_TBATV               .
CONTROLS: TCTRL_ZDLA01_PE_TBATV
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01_PE_TBATV               .
TABLES: ZDLA01_PE_TBATV                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
