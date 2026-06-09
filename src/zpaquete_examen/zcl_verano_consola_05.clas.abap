CLASS zcl_verano_consola_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_verano_consola_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   DATA lo_reserva TYPE REF TO zcl_verano_05.
    DATA lv_opcion  TYPE i VALUE 1.

    CASE lv_opcion.

      WHEN 1. "Alta de reservas
        lo_reserva = NEW zcl_verano_05(
          iv_nombre      = 'Laura'
          iv_apellido    = 'Sanchez'
          iv_telefono    = '600111222'
          iv_dias        = 3
          iv_actividades = 2 ).
        out->write( lo_reserva->alta_reserva( ) ).

        lo_reserva = NEW zcl_verano_05(
          iv_nombre      = 'Manuel'
          iv_apellido    = 'Perez'
          iv_telefono    = '600333444'
          iv_dias        = 5
          iv_actividades = 4 ).
        out->write( lo_reserva->alta_reserva( ) ).

        lo_reserva = NEW zcl_verano_05(
          iv_nombre      = 'Carmen'
          iv_apellido    = 'Ruiz'
          iv_telefono    = '600555666'
          iv_dias        = 2
          iv_actividades = 1 ).
        out->write( lo_reserva->alta_reserva( ) ).

      WHEN 2. "Modificar reserva
        lo_reserva = NEW zcl_verano_05(
          iv_nombre      = ''
          iv_apellido    = ''
          iv_telefono    = ''
          iv_dias        = 0
          iv_actividades = 0 ).
        out->write( lo_reserva->modificar_reserva(
          iv_id          = 1
          iv_nombre      = 'Laura'
          iv_apellido    = 'Garcia'
          iv_telefono    = '600999888'
          iv_dias        = 4
          iv_actividades = 3 ) ).

      WHEN 3. "Consultar reserva concreta
        lo_reserva = NEW zcl_verano_05(
          iv_nombre      = ''
          iv_apellido    = ''
          iv_telefono    = ''
          iv_dias        = 0
          iv_actividades = 0 ).
        DATA(lt_resultado) = lo_reserva->consultar_reservas( iv_id = 1 ).
        LOOP AT lt_resultado INTO DATA(ls_linea).
          out->write( |ID: { ls_linea-id_reserva } | &&
                      |Nombre: { ls_linea-nombre_cliente } | &&
                      |Apellido: { ls_linea-apellido_cliente } | &&
                      |Telefono: { ls_linea-telefono } | &&
                      |Importe: { ls_linea-importe_total }| ).
        ENDLOOP.

      WHEN 4. "Consultar todas las reservas
        lo_reserva = NEW zcl_verano_05(
          iv_nombre      = ''
          iv_apellido    = ''
          iv_telefono    = ''
          iv_dias        = 0
          iv_actividades = 0 ).
        DATA(lt_todas) = lo_reserva->consultar_reservas( iv_id = 0 ).
        LOOP AT lt_todas INTO DATA(ls_todas).
          out->write( |ID: { ls_todas-id_reserva } | &&
                      |Nombre: { ls_todas-nombre_cliente } | &&
                      |Apellido: { ls_todas-apellido_cliente } | &&
                      |Telefono: { ls_todas-telefono } | &&
                      |Importe: { ls_todas-importe_total }| ).
        ENDLOOP.

      WHEN 5. "Consultar primeros N registros
        lo_reserva = NEW zcl_verano_05(
          iv_nombre      = ''
          iv_apellido    = ''
          iv_telefono    = ''
          iv_dias        = 0
          iv_actividades = 0 ).
        DATA(lt_n) = lo_reserva->consultar_n_reservas( iv_n = 2 ).
        LOOP AT lt_n INTO DATA(ls_n).
          out->write( |ID: { ls_n-id_reserva } | &&
                      |Nombre: { ls_n-nombre_cliente } | &&
                      |Apellido: { ls_n-apellido_cliente } | &&
                      |Telefono: { ls_n-telefono } | &&
                      |Importe: { ls_n-importe_total }| ).
        ENDLOOP.

    ENDCASE.

  ENDMETHOD.

ENDCLASS.

*Para probar cada opción simplemente cambia el valor de lv_opcion:
*
*1 → Alta de reservas
*2 → Modificar reserva
*3 → Consultar reserva concreta
*4 → Consultar todas
*5 → Consultar primeros N registros
*
*Activa con Ctrl + F3 y ejecuta con F9.



