*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 04.09.2024 at 09:17:15
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01_API_T002.................................*
DATA:  BEGIN OF STATUS_ZDLA01_API_T002               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01_API_T002               .
CONTROLS: TCTRL_ZDLA01_API_T002
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01_API_T002               .
TABLES: ZDLA01_API_T002                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
