*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 31.08.2024 at 08:25:43
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01_API_T001.................................*
DATA:  BEGIN OF STATUS_ZDLA01_API_T001               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA01_API_T001               .
CONTROLS: TCTRL_ZDLA01_API_T001
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA01_API_T001               .
TABLES: ZDLA01_API_T001                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
