*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 19.08.2024 at 09:09:12
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01GPT_007...................................*
DATA:  BEGIN OF STATUS_ZDLA01GPT_007                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01GPT_007                 .
CONTROLS: TCTRL_ZDLA01GPT_007
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01GPT_007                 .
TABLES: ZDLA01GPT_007                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
