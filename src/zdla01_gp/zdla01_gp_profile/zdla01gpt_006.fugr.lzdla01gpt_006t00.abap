*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 07.08.2024 at 05:41:58
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01GPT_006...................................*
DATA:  BEGIN OF STATUS_ZDLA01GPT_006                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01GPT_006                 .
CONTROLS: TCTRL_ZDLA01GPT_006
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01GPT_006                 .
TABLES: ZDLA01GPT_006                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
