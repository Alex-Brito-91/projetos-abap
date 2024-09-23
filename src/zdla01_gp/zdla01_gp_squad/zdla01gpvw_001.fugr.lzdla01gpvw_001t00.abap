*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 05.08.2024 at 08:38:10
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA01GPVW_001..................................*
TABLES: ZDLA01GPVW_001, *ZDLA01GPVW_001. "view work areas
CONTROLS: TCTRL_ZDLA01GPVW_001
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_ZDLA01GPVW_001. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZDLA01GPVW_001.
* Table for entries selected to show on screen
DATA: BEGIN OF ZDLA01GPVW_001_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZDLA01GPVW_001.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZDLA01GPVW_001_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZDLA01GPVW_001_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZDLA01GPVW_001.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZDLA01GPVW_001_TOTAL.

*.........table declarations:.................................*
TABLES: ZDLA01GPT_004                  .
