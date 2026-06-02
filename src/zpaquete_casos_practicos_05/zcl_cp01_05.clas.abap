CLASS zcl_cp01_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   INTERFACES if_oo_adt_classrun .

   TYPES: BEGIN OF ty_vuelo,
             Aerolinea   TYPE c LENGTH 2,
             Vuelo  TYPE c LENGTH 4,
             Origen   TYPE c LENGTH 3,
             Destino     TYPE c LENGTH 3,
             Precio      TYPE p LENGTH 8 DECIMALS 2,
             Plazas_Libres TYPE i,
           END OF ty_vuelo.

           TYPES: ty_t_vuelos TYPE STANDARD TABLE OF ty_vuelo WITH EMPTY KEY.
           DATA zvuelos_05 TYPE ty_t_vuelos.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_cp01_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    zvuelos_05 = VALUE #(

         ( Aerolinea = 'LH'  Vuelo = '0400'  Origen = 'FRA'  Destino = 'JFK'  Precio =  '899.00'  Plazas_Libres = 15 )
         ( Aerolinea = 'AA'  Vuelo = '0017'  Origen = 'JFK'  Destino = 'SFO'  Precio =  '450.50'  Plazas_Libres =  0 )
         ( Aerolinea = 'IB'  Vuelo = '3740'  Origen = 'MAD'  Destino = 'BCN'  Precio =  '120.00'  Plazas_Libres = 42 )
         ( Aerolinea = 'LH'  Vuelo = '0455'  Origen = 'FRA'  Destino = 'MAD'  Precio =  '310.75'  Plazas_Libres =  8 )
         ( Aerolinea = 'AA'  Vuelo = '0064'  Origen = 'SFO'  Destino = 'JFK'  Precio =  '510.00'  Plazas_Libres =  3 )
         ( Aerolinea = 'IB'  Vuelo = '3950'  Origen = 'BCN'  Destino = 'LHR'  Precio =  '275.30'  Plazas_Libres =  0 )
         ( Aerolinea = 'LH'  Vuelo = '2030'  Origen = 'MUC'  Destino = 'FRA'  Precio =   '95.00'  Plazas_Libres = 60 )
         ( Aerolinea = 'SQ'  Vuelo = '0026'  Origen = 'SIN'  Destino = 'FRA'  Precio = '1250.00'  Plazas_Libres =  5 )
       ).
out->write( '' ).
    out->write( '=== TAREA 1.1 – Clasificación por precio ===' ).
out->write( '' ).
    LOOP AT zvuelos_05 INTO DATA(ls_vuelo).
out->write( '' ).
      DATA(lv_categoria) = COND string(
        WHEN ls_vuelo-precio < 150               THEN 'Económico'
        WHEN ls_vuelo-precio >= 150
         AND ls_vuelo-precio <= 500              THEN 'Estándar'
        WHEN ls_vuelo-precio >  500
         AND ls_vuelo-precio <= 1000             THEN 'Premium'
        ELSE                                         'First Class'
      ).

      out->write(
        |{ ls_vuelo-aerolinea } { ls_vuelo-vuelo } | &
        |{ ls_vuelo-origen }→{ ls_vuelo-destino } | &
        |{ ls_vuelo-precio CURRENCY = 'EUR' } € → { lv_categoria }|
      ).

    ENDLOOP.
    out->write( '' ).
    out->write( '=== TAREA 1.2 – Vuelos filtrados ===' ).
out->write( '' ).
    DATA lt_filtrados TYPE ty_t_vuelos.

    LOOP AT zvuelos_05 INTO ls_vuelo
      WHERE Plazas_Libres > 0
        AND ( Origen = 'FRA' OR Destino = 'FRA' )
        AND precio <= 1000.
      APPEND ls_vuelo TO lt_filtrados.
      out->write(
        |{ ls_vuelo-origen }→{ ls_vuelo-destino }{ ls_vuelo-origen } | &
        |{ ls_vuelo-origen }→{ ls_vuelo-destino } | &
        |{ ls_vuelo-precio CURRENCY = 'EUR' } € | &
        |plazas: { ls_vuelo-plazas_libres }|
      ).
    ENDLOOP.


    out->write( '' ).
    out->write( '=== TAREA 1.3 – Transformación de cadenas ===' ).
    out->write( '' ).
    out->write( 'CÓDIGO        | destino_minus | longitud' ).
    out->write( '------------- | ------------- | --------' ).
    out->write( '' ).

    LOOP AT lt_filtrados INTO ls_vuelo.

     "1. Código de vuelo: aerolínea + '-' + número
      DATA(lv_codigo) = ls_vuelo-aerolinea && '-' && ls_vuelo-plazas_libres.

     "2. Destino en minúsculas
      DATA(lv_dest_lower) = to_lower( ls_vuelo-destino ).

      "3. Longitud del código
      DATA(lv_longitud) = strlen( lv_codigo ).

      out->write(
          |{ lv_codigo WIDTH = 13 } -> { lv_dest_lower WIDTH = 13 } -> { lv_longitud }|
      ).


    ENDLOOP.


    out->write( '' ).
    out->write( '=== TAREA 1.4 – Resumen numérico ===' ).
    out->write( '' ).

    DATA: lv_max_precio   TYPE p LENGTH 8 DECIMALS 2 VALUE 0,
          lv_min_precio   TYPE p LENGTH 8 DECIMALS 2 VALUE 99999,
          lv_sum_precio   TYPE p LENGTH 12 DECIMALS 2 VALUE 0,
          lv_total_libres TYPE i VALUE 0,
          lv_contador     TYPE i VALUE 0.

    LOOP AT zvuelos_05 INTO ls_vuelo.

      lv_contador     += 1.
      lv_total_libres += ls_vuelo-plazas_libres.
      lv_sum_precio   += ls_vuelo-precio.

      IF ls_vuelo-precio > lv_max_precio. lv_max_precio = ls_vuelo-precio. ENDIF.
      IF ls_vuelo-precio < lv_min_precio. lv_min_precio = ls_vuelo-precio. ENDIF.
    ENDLOOP.


    DATA(lv_max_price) = round( val = lv_max_precio dec = 2 ).
    DATA(lv_min_price) = round( val = lv_min_precio dec = 2 ).
    DATA(lv_sum_price) = round( val = lv_sum_precio dec = 2 ).


    out->write( |Precio máximo : { lv_max_price  CURRENCY = 'EUR' } €| ).
    out->write( |Precio mínimo : { lv_min_price  CURRENCY = 'EUR' } €| ).
    out->write( |Precio medio  : { lv_sum_price / lv_contador CURRENCY = 'EUR' }€| ).

    out->write( |Total vuelos  : { lv_contador }| ).
    out->write( '' ).
    out->write( |Total plazas  : { lv_total_libres }| ).
    out->write( '' ).


  ENDMETHOD.

ENDCLASS.
