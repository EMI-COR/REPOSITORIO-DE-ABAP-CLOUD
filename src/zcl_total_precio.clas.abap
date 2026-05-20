CLASS zcl_total_precio DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TOTAL_PRECIO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA lt_vuelos TYPE TABLE OF /dmo/flight.
*    DATA ls_vuelos TYPE /dmo/flight.
*    DATA total_precio TYPE /dmo/flight_price.
*
*
*    SELECT * FROM /dmo/flight INTO TABLE @lt_vuelos.
*
*    LOOP AT lt_vuelos INTO ls_VUELOS.
*      total_precio = total_precio + ls_vuelos-price.
*    ENDLOOP.
*
*    out->write( | El precio total es { total_precio } | ).
*
*    SELECT SUM( price ) FROM /dmo/flight INTO @DATA(lv_acumulado).
*    out->write( | El acumulado es { lv_acumulado } | ).


**********************************************************************
    "1 Crear un tipo que tenga al menos 5 campos. Puedes elegir la tematica que quieras
    "Añade con APPEND al menos 10 registros
**********************************************************************


*    TYPES: BEGIN OF ty_cliente,
*             nombre      TYPE string,   " Número de cliente
*             direccion   TYPE string,   " Dirección
*             email       TYPE string,   " E-mail
*             telefono    TYPE string,   " Teléfono
*             fax         TYPE string,  " Fax
*             cantpedido TYPE i, "Cantidad
*           END OF ty_cliente.
*
*    DATA: ls_cliente  TYPE ty_cliente,   " Variable tipo estructura
*          lt_clientes TYPE TABLE OF ty_cliente.  " Tabla interna
*
*
*    ls_cliente-nombre  = 'JUAN'.
*    ls_cliente-direccion = 'CALLE FERIA,1'.
*    ls_cliente-email = 'JUAN@PRUEBA.COM'.
*    ls_cliente-Telefono = '111111111'.
*    ls_cliente-Fax = '111111111'.
*    ls_cliente-cantpedido = 10.
*
*    APPEND ls_cliente TO lt_CLIENTES.
*
*    ls_cliente-nombre = 'PEDRO'.
*    ls_cliente-direccion = 'CALLE FERIA,2'.
*    ls_cliente-email = 'PEDRO@PRUEBA.COM'.
*    ls_cliente-Telefono = '222222222'.
*    ls_cliente-Fax = '222222222'.
*    ls_cliente-cantpedido = 20.
*    APPEND ls_cliente TO lt_CLIENTES.
*
*    out->write( lt_clientes ).
*

**********************************************************************
    "2 Coge los datos de la tabla y recorre con un LOOP para hacer un acumulador de lo que quieras
**********************************************************************
*data total_pedidos type i.
*
*LOOP AT lt_clientes INTO ls_cliente.
*      total_pedidos = total_pedidos + ls_cliente-cantpedido.
*ENDLOOP.
*
*out->write( | El total de pedidos es { total_pedidos } | ).

**********************************************************************
    "3 Devuelve por pantalla el numero de reservas dado una fecha concreta usando la tabla /DMO/BOOKING
**********************************************************************

*VISUALIZAR LOS DATOS DE UNA TABLA.
*
*Para visualizar el contenido de una tabla SAP HANA en Eclipse usando el teclado,
*abre la tabla presionando Ctrl + Shift + A, escribe el nombre, y presiona F3.
*Una vez abierta la definición, usa Shift + F10 (o menú contextual) para seleccionar Open With > Data Preview.
*
*Aquí tienes los pasos detallados:
*1.  Abrir el objeto: Presiona Ctrl + Shift + A (o Ctrl + Shift + D para Data Dictionary) y escribe el nombre de la tabla.
*2.  Visualizar Datos: Con la tabla abierta, presiona la tecla F3 (o Shift + F10 en Windows/Linux) para abrir el menú de contexto y selecciona Data Preview.
*4.  Alternativa SQL: Abre una consola SQL (F8 o Ctrl + Enter tras escribir SELECT * FROM "SCHEMA"."TABLA") para ejecutar consultas personalizadas.

*Como alternativa, para explorar las vistas, puedes seguir la guía para buscar y ejecutar vistas CDS en HANA.








    DATA numreservas TYPE TABLE OF /dmo/booking.

    SELECT * FROM /dmo/booking  WHERE flight_date = '20260131' INTO TABLE @numreservas.

    IF sy-subrc = 0.
      out->write( | El numero de reservas es { lines( numreservas ) } | ).
      else.
      out->write( | No existen reservas para la fecha indicada | ).
    ENDIF.




  ENDMETHOD.
ENDCLASS.
