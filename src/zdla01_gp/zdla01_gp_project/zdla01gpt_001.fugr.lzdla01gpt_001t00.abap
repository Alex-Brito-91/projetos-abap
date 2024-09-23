*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 20.07.2024 at 23:59:29
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01GPT_001...................................*
DATA:  BEGIN OF STATUS_ZDLA01GPT_001                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01GPT_001                 .
CONTROLS: TCTRL_ZDLA01GPT_001
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01GPT_001                 .
TABLES: ZDLA01GPT_001                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
