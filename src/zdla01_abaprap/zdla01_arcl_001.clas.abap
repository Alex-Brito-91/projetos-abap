CLASS zdla01_arcl_001 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_sadl_exit.
    INTERFACES if_sadl_exit_calc_element_read.
ENDCLASS.


CLASS zdla01_arcl_001 IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA lt_original_data TYPE TABLE OF zi_dla01_flight_detail WITH DEFAULT KEY.

    lt_original_data = CORRESPONDING #( it_original_data ).

    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<fs>).
      <fs>-DayOfWeek = 'Segunda-Feira'.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_original_data ).
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    LOOP AT it_requested_calc_elements ASSIGNING FIELD-SYMBOL(<fs>).
      IF <fs> = 'DayOfWeek'.
        APPEND 'FlightDate' TO et_requested_orig_elements.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
