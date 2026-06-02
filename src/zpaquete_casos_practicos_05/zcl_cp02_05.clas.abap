CLASS zcl_cp02_05 DEFINITION

*  Objetivos de aprendizaje
*•   Declarar tablas internas con diferentes tipos de clave (STANDARD, SORTED, HASHED).
*•   Dominar las operaciones básicas: APPEND, INSERT, MODIFY, DELETE.
*•   Realizar búsquedas con READ TABLE (INTO, REFERENCE INTO, TRANSPORTING NO FIELDS).
*•   Usar LOOP AT, FOR, FILTER y REDUCE para recorrer y agregar datos.
*•   Agrupar datos con GROUP BY.

  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .

     "--- Estructura de una reserva ---
    TYPES: BEGIN OF ty_reserva,
             id_reserva TYPE i,
             aerolinea  TYPE c LENGTH 2,
             num_vuelo  TYPE n LENGTH 4,
             pasajero   TYPE string,
             fecha      TYPE d,
             precio     TYPE p LENGTH 8 DECIMALS 2,
             estado     TYPE c LENGTH 1,
           END OF ty_reserva.


DATA lt_reserva TYPE ty_reserva.
DATA lt_reservas TYPE SORTED TABLE OF ty_reserva WITH UNIQUE KEY id_reserva.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_cp02_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    lt_reservas = VALUE #(

    ( id_reserva = 1  aerolinea = 'LH'  num_vuelo = '0400'  pasajero = 'Ana García'    fecha = '20260515'  precio = '899.00'   estado = 'A' )
    ( id_reserva = 2  aerolinea = 'IB'  num_vuelo = '3740'  pasajero = 'Carlos López'  fecha = '20260515'  precio = '120.00'   estado = 'A' )
      ( id_reserva = 3  aerolinea = 'AA'  num_vuelo = '0017'  pasajero = 'John Smith'    fecha = '20260520'  precio = '450.50'   estado = 'A' )
      ( id_reserva = 4  aerolinea = 'LH'  num_vuelo = '0455'  pasajero = 'María Pérez'   fecha = '20260520'  precio = '310.75'   estado = 'A' )
      ( id_reserva = 5  aerolinea = 'IB'  num_vuelo = '3740'  pasajero = 'Pedro Ruiz'    fecha = '20260515'  precio = '120.00'   estado = 'C' )
      ( id_reserva = 6  aerolinea = 'SQ'  num_vuelo = '0026'  pasajero = 'Lisa Tan'      fecha = '20260601'  precio = '1250.00'  estado = 'A' )
      ( id_reserva = 7  aerolinea = 'LH'  num_vuelo = '0400'  pasajero = 'Hans Müller'   fecha = '20260515'  precio = '899.00'   estado = 'A' )
      ( id_reserva = 8  aerolinea = 'AA'  num_vuelo = '0064'  pasajero = 'Sarah Jones'   fecha = '20260525'  precio = '510.00'   estado = 'A' )
    ).


    "==========================================================
    " TAREA 2.1 – ALTAS DE RESERVAS
    "==========================================================
    out->write( '=== TAREA 2.1 – Altas de reservas ===' ).

    APPEND VALUE #( id_reserva = 9   aerolinea = 'IB'  num_vuelo = '3950'
                    pasajero = 'Elena Martín'  fecha = '20260601'
                    precio = '275.30'  estado = 'A' ) TO lt_reservas.

    APPEND VALUE #( id_reserva = 10  aerolinea = 'LH'  num_vuelo = '2030'
                    pasajero = 'Franz Weber'   fecha = '20260610'
                    precio = '95.00'   estado = 'A' ) TO lt_reservas.

    "Mostrar tabla completa
    LOOP AT lt_reservas INTO DATA(ls_res).
      out->write( |{ ls_res-id_reserva } - { ls_res-aerolinea } { ls_res-num_vuelo } - | &&
                  |{ ls_res-pasajero } - { ls_res-fecha } - { ls_res-precio } - { ls_res-estado }| ).
    ENDLOOP.




    "==========================================================
    " TAREA 2.2 – MODIFICACIONES
    "==========================================================
    out->write( '' ).
    out->write( '=== TAREA 2.2 – Modificaciones ===' ).

    "1. Cambiar precio de la reserva ID 3
    READ TABLE lt_reservas INTO DATA(ls_mod) WITH KEY id_reserva = 3.
    IF sy-subrc = 0.
      ls_mod-precio = '480.00'.
      MODIFY lt_reservas FROM ls_mod TRANSPORTING precio WHERE id_reserva = 3.
      out->write( |Reserva ID 3 precio actualizado a: { ls_mod-precio }| ).
    ENDIF.

    "2. Descuento del 10% a todas las reservas de LH
    LOOP AT lt_reservas INTO ls_mod WHERE aerolinea = 'LH'.
      ls_mod-precio = ls_mod-precio * '0.9'.
      MODIFY lt_reservas FROM ls_mod TRANSPORTING precio WHERE id_reserva = ls_mod-id_reserva.
      out->write( |LH reserva ID { ls_mod-id_reserva } nuevo precio: { ls_mod-precio }| ).
    ENDLOOP.

    "==========================================================
    " TAREA 2.3 – CANCELACIONES Y BORRADOS
    "==========================================================
    out->write( '' ).
    out->write( '=== TAREA 2.3 – Cancelaciones y borrados ===' ).

    "1. Cancelar reserva ID 4
    READ TABLE lt_reservas INTO ls_mod WITH KEY id_reserva = 4.
    IF sy-subrc = 0.
      ls_mod-estado = 'C'.
      MODIFY lt_reservas FROM ls_mod TRANSPORTING estado WHERE id_reserva = 4.
      out->write( 'Reserva ID 4 cancelada.' ).
    ENDIF.

    "2. Eliminar físicamente todas las reservas canceladas
    DATA(lv_total_antes) = lines( lt_reservas ).
    DELETE lt_reservas WHERE estado = 'C'.
    DATA(lv_eliminados) = lv_total_antes - lines( lt_reservas ).

    "3. Mostrar tabla resultante y registros eliminados
    out->write( |Registros eliminados: { lv_eliminados }| ).
    out->write( 'Tabla tras borrado:' ).
    LOOP AT lt_reservas INTO ls_res.
      out->write( |{ ls_res-id_reserva } - { ls_res-aerolinea } { ls_res-num_vuelo } - | &&
                  |{ ls_res-pasajero } - { ls_res-estado }| ).
    ENDLOOP.

    "==========================================================
    " TAREA 2.4 – BÚSQUEDAS
    "==========================================================
    out->write( '' ).
    out->write( '=== TAREA 2.4 – Búsquedas ===' ).

    "1. Verificar si existe reserva para Lisa Tan
    READ TABLE lt_reservas TRANSPORTING NO FIELDS WITH KEY pasajero = 'Lisa Tan'.
    IF sy-subrc = 0.
      out->write( 'Lisa Tan tiene una reserva activa.' ).
    ELSE.
      out->write( 'No se encontró reserva para Lisa Tan.' ).
    ENDIF.

    "2. Referencia a la reserva ID 6
    READ TABLE lt_reservas REFERENCE INTO DATA(lr_reserva) WITH KEY id_reserva = 6.
    IF sy-subrc = 0.
      out->write( |Reserva ID 6 - Pasajero: { lr_reserva->pasajero } | &&
                  |Vuelo: { lr_reserva->aerolinea }{ lr_reserva->num_vuelo } | &&
                  |Precio: { lr_reserva->precio }| ).
    ENDIF.

    "3. Acceso directo con VALUE #( itab[ ... ] )
    DATA(lv_pasajero_id1) = VALUE string( lt_reservas[ id_reserva = 1 ]-pasajero OPTIONAL ).
    out->write( |Pasajero reserva ID 1: { lv_pasajero_id1 }| ).

    "==========================================================
    " TAREA 2.5 – AGRUPACIÓN Y AGREGADOS
    "==========================================================
    out->write( '' ).
    out->write( '=== TAREA 2.5 – Informe por aerolínea ===' ).
    out->write( 'Aerolínea - Nº Reservas - Precio Total - Precio Medio' ).
    out->write( '-------------------------------------------------' ).

    DATA lv_num_reservas TYPE i.
    DATA lv_precio_total TYPE p LENGTH 8 DECIMALS 2.

    LOOP AT lt_reservas INTO ls_res
      GROUP BY ( aerolinea = ls_res-aerolinea )
      ASCENDING
      INTO DATA(ls_grupo).

      lv_num_reservas = 0.        "← reset en cada grupo
      lv_precio_total = 0.        "← reset en cada grupo

      LOOP AT GROUP ls_grupo INTO DATA(ls_detalle).
        lv_num_reservas += 1.
        lv_precio_total += ls_detalle-precio.
      ENDLOOP.

      DATA(lv_precio_medio) = round(
        val = CONV decfloat34( lv_precio_total ) / lv_num_reservas
        dec = 2
      ).

      out->write( |{ ls_grupo-aerolinea } - | &&
                  |{ lv_num_reservas } reservas - | &&
                  |Total: { lv_precio_total } - | &&
                  |Media: { lv_precio_medio }| ).

    ENDLOOP.



  ENDMETHOD.
ENDCLASS.
