*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 28.07.2024 at 17:54:56
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01GPT_003...................................*
DATA:  BEGIN OF STATUS_ZDLA01GPT_003                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01GPT_003                 .
CONTROLS: TCTRL_ZDLA01GPT_003
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01GPT_003                 .
TABLES: ZDLA01GPT_003                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
