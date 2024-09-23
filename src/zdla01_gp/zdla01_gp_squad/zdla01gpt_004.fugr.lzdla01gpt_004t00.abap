*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 05.08.2024 at 08:34:06
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01GPT_004...................................*
DATA:  BEGIN OF STATUS_ZDLA01GPT_004                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01GPT_004                 .
CONTROLS: TCTRL_ZDLA01GPT_004
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01GPT_004                 .
TABLES: ZDLA01GPT_004                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
