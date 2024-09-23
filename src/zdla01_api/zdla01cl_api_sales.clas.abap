CLASS zdla01cl_api_sales DEFINITION
  PUBLIC
  INHERITING FROM cl_rest_resource
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_customers .
    METHODS get_orders .
    METHODS post_order .
    METHODS put_order .
    METHODS delete_order .

    METHODS if_rest_resource~delete
        REDEFINITION .
    METHODS if_rest_resource~get
        REDEFINITION .
    METHODS if_rest_resource~post
        REDEFINITION .
    METHODS if_rest_resource~put
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdla01cl_api_sales IMPLEMENTATION.


  METHOD get_customers.
    DATA(lt_parameters) = mo_request->get_uri_query_parameters( ).

    " Variável de Filtro ID
    DATA(lv_filter_id) = VALUE #( lt_parameters[ name = 'id' ] OPTIONAL ).

    " Retorno
    DATA(lo_entity) = mo_response->create_entity( ).

    DATA(lv_return_text) = COND string( WHEN lv_filter_id IS INITIAL
                                        THEN 'Selecionando Clientes'
                                        ELSE |Selecionando Cliente { lv_filter_id-value }| ).

    lo_entity->set_string_data( lv_return_text ).
  ENDMETHOD.


  METHOD get_orders.
    DATA(lt_parameters) = mo_request->get_uri_query_parameters( ).

    " Variável de Filtro ID
    DATA(lv_filter_id) = VALUE #( lt_parameters[ name = 'id' ] OPTIONAL ).

    IF lv_filter_id IS NOT INITIAL.
      DATA(lv_id) = CONV vbeln( lv_filter_id-value ).
      lv_id = |{ lv_id ALPHA = IN }|.
      DATA(lr_ids) = VALUE rseloption( ( sign = 'I' option = 'EQ' low = lv_id ) ).
    ENDIF.

    SELECT * FROM zdla01_api_t002
      INTO TABLE @DATA(lt_orders)
      WHERE ordem IN @lr_ids.

    " Retorno
    DATA(lo_entity) = mo_response->create_entity( ).

    " Retornar Estrutura
    IF lines( lt_orders ) = 1.
      lo_entity->set_string_data( /ui2/cl_json=>serialize( data = lt_orders[ 1 ] ) ).
      lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
      RETURN.
    ENDIF.

    " Retornar Table
    lo_entity->set_string_data( /ui2/cl_json=>serialize( data = lt_orders ) ).
    lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
  ENDMETHOD.


  METHOD if_rest_resource~get.
    " Determina a Rota Atual
    DATA(lv_route) = mo_request->get_uri_path( ).
    lv_route = lv_route+7.
    " Prefixo /sales/

    " Jogar para caixa alta
    TRANSLATE lv_route TO UPPER CASE.

    " Chamar o Método Dinamicamente
    CALL METHOD (lv_route).
  ENDMETHOD.


  METHOD if_rest_resource~post.
    " Determina a Rota Atual
    DATA(lv_route) = mo_request->get_uri_path( ).
    lv_route = lv_route+7.
    " Prefixo /sales/

    " Jogar para caixa alta
    TRANSLATE lv_route TO UPPER CASE.

    IF lv_route NS 'POST'.
      DATA(lo_entity) = mo_response->create_entity( ).
      lo_entity->set_string_data( '{ "msg": "A rota desejada não é um POST!" }' ).
      lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
      RETURN.
    ENDIF.

    " Chamar o Método Dinamicamente
    CALL METHOD (lv_route).
  ENDMETHOD.


  METHOD if_rest_resource~put.
    " Determina a Rota Atual
    DATA(lv_route) = mo_request->get_uri_path( ).
    lv_route = lv_route+7.
    " Prefixo /sales/

    " Jogar para caixa alta
    TRANSLATE lv_route TO UPPER CASE.

    IF lv_route NS 'PUT'.
      DATA(lo_entity) = mo_response->create_entity( ).
      lo_entity->set_string_data( '{ "msg": "A rota desejada não é um PUT!" }' ).
      lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
      RETURN.
    ENDIF.

    " Chamar o Método Dinamicamente
    CALL METHOD (lv_route).
  ENDMETHOD.


  METHOD post_order.
    " TODO: variable is never used (ABAP cleaner)
    DATA: BEGIN OF ty_request,
            ordem        TYPE string,
            data_criacao TYPE string,
          END OF ty_request.
    DATA ls_request TYPE zdla01_api_t002.

    DATA(lo_entity) = mo_response->create_entity( ).

    " Captar os dados da requisição - Body
    DATA(ls_request_body) = mo_request->get_entity( )->get_string_data( ).
    /ui2/cl_json=>deserialize( EXPORTING json = ls_request_body
                               CHANGING  data = ls_request ).

    INSERT zdla01_api_t002 FROM ls_request.

    IF sy-subrc = 0.
      " Sucesso
      lo_entity->set_string_data( '{ "msg": "Sucesso ao criar a ordem!" }' ).
      lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
    ELSE.
      " Erro
      lo_entity->set_string_data( '{ "msg": "Ordem informada já existe!" }' ).
      lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
    ENDIF.
  ENDMETHOD.


  METHOD put_order.
    DATA: BEGIN OF ty_request,
            ordem        TYPE string,
            data_criacao TYPE string,
          END OF ty_request,
          ls_request TYPE zdla01_api_t002.

    DATA(lo_entity) = mo_response->create_entity( ).

    DATA(lt_parameters) = mo_request->get_uri_query_parameters( ).

    " Variável de Filtro ID
    DATA(ls_ordem) = VALUE #( lt_parameters[ name = 'ordem' ] OPTIONAL ).

    " Captar os dados da requisição - Body
    DATA(ls_request_body) = mo_request->get_entity( )->get_string_data( ).
    /ui2/cl_json=>deserialize( EXPORTING json = ls_request_body
                               CHANGING  data = ls_request ).

    ls_request-ordem = ls_ordem-value.

    UPDATE zdla01_api_t002 FROM ls_request.

    IF sy-subrc = 0.
      " Sucesso
      lo_entity->set_string_data( '{ "msg": "Sucesso ao modificar a ordem!" }' ).
      lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
    ELSE.
      " Erro
      lo_entity->set_string_data( |\{ "msg": "Ordem { ls_request-ordem } informada não encontrada!" \}| ).
      lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
    ENDIF.
  ENDMETHOD.


  METHOD if_rest_resource~delete.
    " Determina a Rota Atual
    DATA(lv_route) = mo_request->get_uri_path( ).
    lv_route = lv_route+7.
    " Prefixo /sales/

    " Jogar para caixa alta
    TRANSLATE lv_route TO UPPER CASE.

    IF lv_route NS 'DELETE'.
      DATA(lo_entity) = mo_response->create_entity( ).
      lo_entity->set_string_data( '{ "msg": "A rota desejada não é um DELETE!" }' ).
      lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
      RETURN.
    ENDIF.

    " Chamar o Método Dinamicamente
    CALL METHOD (lv_route).
  ENDMETHOD.


  METHOD delete_order.
    DATA(lo_entity) = mo_response->create_entity( ).

    DATA(lt_parameters) = mo_request->get_uri_query_parameters( ).

    " Variável de Filtro ID
    DATA(ls_ordem) = VALUE #( lt_parameters[ name = 'ordem' ] OPTIONAL ).

    DELETE FROM zdla01_api_t002 WHERE ordem = ls_ordem-value.

    IF sy-subrc = 0.
      " Sucesso
      lo_entity->set_string_data( '{ "msg": "Sucesso ao deletar a ordem!" }' ).
      lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
    ELSE.
      " Erro
      lo_entity->set_string_data( |\{ "msg": "Ordem { ls_ordem-value } informada não encontrada!" \}| ).
      lo_entity->set_content_type( 'application/json; charset=UTF-8' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
