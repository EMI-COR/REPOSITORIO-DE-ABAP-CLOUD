CLASS zcl_cp03_05 DEFINITION
  PUBLIC
 FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.

  PRIVATE SECTION.
  TYPES: BEGIN OF ty_vuelo,
           aerolinea  TYPE c LENGTH 2,
           num_vuelo  TYPE n LENGTH 4,
           origen     TYPE c LENGTH 3,
           destino    TYPE c LENGTH 3,
           precio     TYPE p LENGTH 8 DECIMALS 2,
           plazas     TYPE i,
         END OF ty_vuelo.
  TYPES ty_t_vuelos TYPE STANDARD TABLE OF ty_vuelo WITH KEY aerolinea num_vuelo.
ENDCLASS.



CLASS zcl_cp03_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "--- Alias local para comodidad ---
*    TYPES: ty_vuelo    TYPE zif_flight_manager_05~ty_vuelo,
*           ty_t_vuelos TYPE zif_flight_manager_05~ty_t_vuelos.

    "==========================================================
    " 1. CREAR INSTANCIA
    "==========================================================
    DATA(lo_manager) = NEW zcl_flight_manager_05( ).

    "==========================================================
    " 2. AÑADIR 5 VUELOS
    "==========================================================
    out->write( '=== Añadiendo vuelos ===' ).

   DATA lt_vuelos_iniciales TYPE ty_t_vuelos.
   lt_vuelos_iniciales = VALUE #(
      ( aerolinea = 'LH'  num_vuelo = '0400'  origen = 'FRA'  destino = 'JFK'  precio = '899.00'   plazas = 15 )
      ( aerolinea = 'AA'  num_vuelo = '0017'  origen = 'JFK'  destino = 'SFO'  precio = '450.50'   plazas =  0 )
      ( aerolinea = 'IB'  num_vuelo = '3740'  origen = 'MAD'  destino = 'BCN'  precio = '120.00'   plazas = 42 )
      ( aerolinea = 'LH'  num_vuelo = '0455'  origen = 'FRA'  destino = 'MAD'  precio = '310.75'   plazas =  8 )
      ( aerolinea = 'SQ'  num_vuelo = '0026'  origen = 'SIN'  destino = 'FRA'  precio = '1250.00'  plazas =  5 )
    ).

     LOOP AT lt_vuelos_iniciales INTO DATA(ls_vuelo).
      TRY.
        lo_manager->zif_flight_manager_05~add_flight( ls_vuelo ).
          out->write( |Vuelo { ls_vuelo-aerolinea }{ ls_vuelo-num_vuelo } añadido OK| ).
        CATCH zcx_flight_error_05 INTO DATA(lx_error).
          out->write( |ERROR: { lx_error->mv_mensaje }| ).
      ENDTRY.
    ENDLOOP.

    "==========================================================
    " 3. VUELO CON PRECIO NEGATIVO → excepción
    "==========================================================
    out->write( '' ).
    out->write( '=== Precio negativo ===' ).
    TRY.
        lo_manager->zif_flight_manager_05~add_flight(
          VALUE #( aerolinea = 'IB'  num_vuelo = '9999'
                   origen = 'MAD'  destino = 'LHR'
                   precio = '-50.00'  plazas = 10 )
        ).
      CATCH zcx_flight_error_05 INTO DATA(lx_neg).
        out->write( |Excepción capturada: { lx_neg->mv_mensaje }| ).
    ENDTRY.

    "==========================================================
    " 4. VUELO DUPLICADO → excepción
    "==========================================================
    out->write( '' ).
    out->write( '=== Vuelo duplicado ===' ).
    TRY.
        lo_manager->zif_flight_manager_05~add_flight(
          VALUE #( aerolinea = 'LH'  num_vuelo = '0400'
                   origen = 'FRA'  destino = 'JFK'
                   precio = '899.00'  plazas = 15 )
        ).
      CATCH zcx_flight_error_05 INTO DATA(lx_dup).
        out->write( |Excepción capturada: { lx_dup->mv_mensaje }| ).
    ENDTRY.

    "==========================================================
    " 5. VUELOS DE UNA AEROLÍNEA CONCRETA
    "==========================================================
    out->write( '' ).
    out->write( '=== Vuelos de LH ===' ).
    DATA(lt_lh) = lo_manager->zif_flight_manager_05~get_flights_by_airline( 'LH' ).
    LOOP AT lt_lh INTO DATA(ls_lh).
      out->write( |{ ls_lh-aerolinea }{ ls_lh-num_vuelo } { ls_lh-origen }->{ ls_lh-destino } { ls_lh-precio } €| ).
    ENDLOOP.

    "==========================================================
    " 6. VUELO MÁS BARATO
    "==========================================================
    out->write( '' ).
    out->write( '=== Vuelo más barato ===' ).
    TRY.
        DATA(ls_barato) = lo_manager->zif_flight_manager_05~get_cheapest_flight( ).
        out->write( |{ ls_barato-aerolinea }{ ls_barato-num_vuelo } | &&
                    |{ ls_barato-origen }->{ ls_barato-destino } | &&
                    |{ ls_barato-precio } €| ).
      CATCH zcx_flight_error_05 INTO DATA(lx_cheap).
        out->write( |ERROR: { lx_cheap->mv_mensaje }| ).
    ENDTRY.

    "==========================================================
    " 7. FACTURACIÓN TOTAL
    "==========================================================
    out->write( '' ).
    out->write( '=== Facturación total ===' ).
    DATA(lv_total) = lo_manager->zif_flight_manager_05~get_total_revenue( ).
    out->write( |Total facturado: { lv_total } €| ).



  ENDMETHOD.
ENDCLASS.
