*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 19.08.2024 at 09:02:46
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01GPT_009...................................*
DATA:  BEGIN OF STATUS_ZDLA01GPT_009                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01GPT_009                 .
CONTROLS: TCTRL_ZDLA01GPT_009
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01GPT_009                 .
TABLES: ZDLA01GPT_009                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
