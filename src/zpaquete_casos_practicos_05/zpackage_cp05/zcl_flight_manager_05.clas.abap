CLASS zcl_flight_manager_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_flight_manager_05.

    ALIASES ty_vuelo   FOR zif_flight_manager_05~ty_vuelo.
    ALIASES ty_t_vuelos FOR zif_flight_manager_05~ty_t_vuelos.

    METHODS constructor
      IMPORTING
        it_vuelos TYPE ty_t_vuelos OPTIONAL.

  PRIVATE SECTION.
    DATA mt_vuelos TYPE ty_t_vuelos.

ENDCLASS.


CLASS zcl_flight_manager_05 IMPLEMENTATION.

  METHOD constructor.
    IF it_vuelos IS SUPPLIED.
      mt_vuelos = it_vuelos.
    ENDIF.
  ENDMETHOD.

  METHOD zif_flight_manager_05~add_flight.

    "1. Validar precio positivo
    IF is_vuelo-precio <= 0.
      RAISE EXCEPTION NEW zcx_flight_error_05(
        iv_mensaje = |Precio inválido: { is_vuelo-precio }. Debe ser positivo.|
      ).
    ENDIF.

    "2. Validar vuelo duplicado (misma aerolínea + número)
    READ TABLE mt_vuelos TRANSPORTING NO FIELDS
      WITH KEY aerolinea = is_vuelo-aerolinea
               num_vuelo = is_vuelo-num_vuelo.
    IF sy-subrc = 0.
      RAISE EXCEPTION NEW zcx_flight_error_05(
        iv_mensaje = |Vuelo duplicado: { is_vuelo-aerolinea }{ is_vuelo-num_vuelo } ya existe.|
      ).
    ENDIF.

    "3. Insertar vuelo
    APPEND is_vuelo TO mt_vuelos.

  ENDMETHOD.

 METHOD zif_flight_manager_05~get_flights_by_airline.

  rt_vuelos = VALUE #(
    FOR ls_vuelo IN mt_vuelos
    WHERE ( aerolinea = iv_aerolinea )
    ( ls_vuelo )
  ).

ENDMETHOD.

  METHOD zif_flight_manager_05~get_cheapest_flight.

    "Si no hay vuelos lanzamos excepción
    IF mt_vuelos IS INITIAL.
      RAISE EXCEPTION NEW zcx_flight_error_05(
        iv_mensaje = 'No hay vuelos disponibles.'
      ).
    ENDIF.

    "REDUCE para encontrar el vuelo con precio mínimo
    rs_vuelo = REDUCE #(
      INIT resultado = mt_vuelos[ 1 ]
      FOR  ls_vuelo IN mt_vuelos
      NEXT resultado = COND #(
        WHEN ls_vuelo-precio < resultado-precio
        THEN ls_vuelo
        ELSE resultado
      )
    ).

  ENDMETHOD.

METHOD zif_flight_manager_05~get_total_revenue.

  rv_total = REDUCE decfloat16(
    INIT total = CONV decfloat16( 0 )
    FOR  ls_vuelo IN mt_vuelos
    NEXT total = total + ls_vuelo-precio
  ).

ENDMETHOD.

ENDCLASS.
