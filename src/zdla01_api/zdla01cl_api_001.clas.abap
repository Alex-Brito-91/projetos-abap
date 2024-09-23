CLASS zdla01cl_api_001 DEFINITION
  PUBLIC
  INHERITING FROM cl_rest_resource FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS if_rest_resource~get REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zdla01cl_api_001 IMPLEMENTATION.
  METHOD if_rest_resource~get.
    DATA: BEGIN OF ls_response,
            data TYPE dats,
            msg  TYPE string,
          END OF ls_response.

    " Preenchendo a estrutura
    ls_response-data = sy-datum.
    ls_response-msg  = 'Conectado com sucesso!'.

    " Transformando o ABAP em JSON
    DATA(ls_json) = /ui2/cl_json=>serialize( EXPORTING data = ls_response ).

    " Retornando a requisição
    DATA(lo_entity) = mo_response->create_entity( ).
    lo_entity->set_string_data( ls_json ).
    lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
    mo_response->set_status( cl_rest_status_code=>gc_success_accepted ).
  ENDMETHOD.
ENDCLASS.
