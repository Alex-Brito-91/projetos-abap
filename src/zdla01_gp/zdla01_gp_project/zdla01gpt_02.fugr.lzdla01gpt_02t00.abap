*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 28.07.2024 at 11:01:47
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01GPT_002...................................*
DATA:  BEGIN OF STATUS_ZDLA01GPT_002                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01GPT_002                 .
CONTROLS: TCTRL_ZDLA01GPT_002
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01GPT_002                 .
TABLES: ZDLA01GPT_002                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
