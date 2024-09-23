CLASS zdla01_api_handler DEFINITION
  PUBLIC
  INHERITING FROM cl_rest_http_handler FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS if_rest_application~get_root_handler REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zdla01_api_handler IMPLEMENTATION.
  METHOD if_rest_application~get_root_handler.
    DATA(lo_router) = NEW cl_rest_router( ).

    " Selecionar as Rotas
    SELECT * FROM zdla01_api_t001
      INTO TABLE @DATA(lt_api).

    LOOP AT lt_api REFERENCE INTO DATA(ls_api).

      lo_router->attach( iv_template      = |{ ls_api->rota }|
                         iv_handler_class = ls_api->classe ).

    ENDLOOP.

    ro_root_handler = lo_router.
  ENDMETHOD.
ENDCLASS.
