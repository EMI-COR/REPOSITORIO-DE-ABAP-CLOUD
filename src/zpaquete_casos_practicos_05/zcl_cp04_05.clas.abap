CLASS zcl_cp04_05 DEFINITION
"==========================================================
" TAREA 4.1 – ANÁLISIS DEL MODELO ACTUAL
"
" Campos con tipos genéricos en ty_reserva (CP02):
"   - id_reserva  TYPE i       → genérico, sin semántica
"   - aerolinea   TYPE c LENGTH 2  → sin etiqueta ni ayuda búsqueda
"   - num_vuelo   TYPE n LENGTH 4  → sin documentación
"   - pasajero    TYPE string   → longitud ilimitada, sin control
"   - fecha       TYPE d        → correcto pero sin etiqueta
"   - precio      TYPE p LENGTH 8 DECIMALS 2 → sin moneda ni etiqueta
"   - estado      TYPE c LENGTH 1 → sin valores fijos documentados
"
" Campos que se beneficiarían de elementos de datos:
"   - id_reserva  → ZDE_RESERVA_ID_05  (etiqueta 'ID Reserva')
"   - aerolinea   → ZDE_AIRLINE_05     (ayuda búsqueda de aerolíneas)
"   - num_vuelo   → ZDE_FLIGHT_NUM_05  (etiqueta 'Nº Vuelo')
"   - pasajero    → ZDE_PASSENGER_05   (etiqueta 'Pasajero', long. 40)
"   - precio      → ZDE_FLIGHT_PRICE_05 (etiqueta 'Precio', decimales)
"   - estado      → ZDE_BOOKING_STATUS_05 (valores fijos A/C)
"==========================================================
   PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_cp04_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "==========================================================
    " TAREA 4.1 – ANÁLISIS DEL MODELO ACTUAL
    "
    " Tipos genéricos sustituidos por tipos del diccionario:
    "   ty_reserva     → ZST_BOOKING_05
    "   ty_t_reservas  → ZTT_BOOKINGS_05
    "
    " Ventajas del diccionario (Tarea 4.6):
    "   - Reutilizable en otras clases, CDS views y APIs
    "   - Etiquetas y documentación centralizadas
    "   - Cambio en un sitio = cambia en todos los programas
    "   - Ayudas de búsqueda y valores fijos documentados
    "
    " ¿Cuándo usar TYPES locales?
    "   - Tipos auxiliares internos sin reutilización prevista
    "   - Prototipos o desarrollos temporales
    "   - Tipos muy específicos de un único método
    "
    " Dominios vs Elementos de datos en ABAP clásico:
    "   - Dominio: define el tipo técnico y valores fijos
    "   - Elemento de datos: define la semántica y etiquetas
    "   - En ABAP Cloud no existen dominios como tal;
    "     los elementos de datos referencian tipos built-in
    "     directamente y los valores fijos se gestionan
    "     mediante enumeraciones o CDS fixed values
    "==========================================================

    "--- Tabla interna usando tipo del diccionario ---

    DATA lt_reservas TYPE ztt_bookings_05.
*    DATA lt_reservas TYPE STANDARD TABLE OF zst_booking_05 WITH KEY id_reserva.
    "==========================================================
    " 0. CARGA DE DATOS INICIALES
    "==========================================================
    out->write( '=== TAREA 4.1 – Análisis del modelo actual ===' ).

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

    LOOP AT lt_reservas INTO DATA(ls_res).
      out->write( |{ ls_res-id_reserva } - { ls_res-aerolinea } { ls_res-num_vuelo } - | &&
                  |{ ls_res-pasajero } - { ls_res-fecha } - { ls_res-precio } - { ls_res-estado }| ).
    ENDLOOP.

    "==========================================================
    " TAREA 2.2 – MODIFICACIONES
    "==========================================================
    out->write( '' ).
    out->write( '=== TAREA 2.2 – Modificaciones ===' ).

    READ TABLE lt_reservas INTO DATA(ls_mod) WITH KEY id_reserva = 3.
    IF sy-subrc = 0.
      ls_mod-precio = '480.00'.
      MODIFY lt_reservas FROM ls_mod TRANSPORTING precio WHERE id_reserva = 3.
      out->write( |Reserva ID 3 precio actualizado a: { ls_mod-precio }| ).
    ENDIF.

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

    READ TABLE lt_reservas INTO ls_mod WITH KEY id_reserva = 4.
    IF sy-subrc = 0.
      ls_mod-estado = 'C'.
      MODIFY lt_reservas FROM ls_mod TRANSPORTING estado WHERE id_reserva = 4.
      out->write( 'Reserva ID 4 cancelada.' ).
    ENDIF.

    DATA(lv_total_antes) = lines( lt_reservas ).
    DELETE lt_reservas WHERE estado = 'C'.
    DATA(lv_eliminados) = lv_total_antes - lines( lt_reservas ).

    out->write( |Registros eliminados: { lv_eliminados }| ).
    LOOP AT lt_reservas INTO ls_res.
      out->write( |{ ls_res-id_reserva } - { ls_res-aerolinea } { ls_res-num_vuelo } - | &&
                  |{ ls_res-pasajero } - { ls_res-estado }| ).
    ENDLOOP.

    "==========================================================
    " TAREA 2.4 – BÚSQUEDAS
    "==========================================================
    out->write( '' ).
    out->write( '=== TAREA 2.4 – Búsquedas ===' ).

    READ TABLE lt_reservas TRANSPORTING NO FIELDS WITH KEY pasajero = 'Lisa Tan'.
    IF sy-subrc = 0.
      out->write( 'Lisa Tan tiene una reserva activa.' ).
    ELSE.
      out->write( 'No se encontró reserva para Lisa Tan.' ).
    ENDIF.

    READ TABLE lt_reservas REFERENCE INTO DATA(lr_reserva) WITH KEY id_reserva = 6.
    IF sy-subrc = 0.
      out->write( |Reserva ID 6 - Pasajero: { lr_reserva->pasajero } | &&
                  |Vuelo: { lr_reserva->aerolinea }{ lr_reserva->num_vuelo } | &&
                  |Precio: { lr_reserva->precio }| ).
    ENDIF.

    DATA(lv_pasajero_id1) = VALUE string( lt_reservas[ id_reserva = 1 ]-pasajero OPTIONAL ).
    out->write( |Pasajero reserva ID 1: { lv_pasajero_id1 }| ).

    "==========================================================
    " TAREA 2.5 – AGRUPACIÓN Y AGREGADOS
    "==========================================================
    out->write( '' ).
    out->write( '=== TAREA 2.5 – Informe por aerolínea ===' ).
    out->write( 'Aerolínea - Nº Reservas - Precio Total - Precio Medio' ).
    out->write( '------------------------------------------------------' ).

    DATA lv_num_reservas TYPE i.
    DATA lv_precio_total TYPE p LENGTH 10 DECIMALS 2.

    LOOP AT lt_reservas INTO ls_res
      GROUP BY ( aerolinea = ls_res-aerolinea )
      ASCENDING
      INTO DATA(ls_grupo).

      lv_num_reservas = 0.
      lv_precio_total = 0.

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
