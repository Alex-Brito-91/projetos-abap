*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 24.08.2024 at 00:56:26
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01GPT_008...................................*
DATA:  BEGIN OF STATUS_ZDLA01GPT_008                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01GPT_008                 .
CONTROLS: TCTRL_ZDLA01GPT_008
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01GPT_008                 .
TABLES: ZDLA01GPT_008                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
