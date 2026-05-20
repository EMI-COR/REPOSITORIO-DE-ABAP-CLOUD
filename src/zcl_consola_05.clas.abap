CLASS zcl_consola_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CONSOLA_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*"ZCL_CUADRO_05 Resultado esperado en consola
*"Título: La maja desnuda  |  Año: 1800  |  Almacenado
*"Título: La maja desnuda  |  Año: 1801  |  En exposición
*
*   DATA(lo_CUADRO1) = NEW zcl_CUADRO_05(
*   i_titulo = 'La Maja desnuda'
*   i_ano_creacion = 1800 ).
*
*
*   data lv_ficha type string.
*
*   lo_cuadro1->mostrar_ficha( importing o_ficha = lv_ficha ).
*
*    out->write( lv_ficha ).
*
*
*     "Corregir el año a 1801
*
*    lo_cuadro1->set_ano_creacion( 1801 ).
*
*    lo_cuadro1->mostrar_ficha( importing o_ficha = lv_ficha ).
*
*    out->write( lv_ficha ).
*
*
*
*"Título: Las Meninas      |  Año: 1656  |  Almacenado
*
*
*DATA(lo_CUADRO2) = NEW zcl_CUADRO_05(
*   i_titulo = 'Las Meninas'
*   i_ano_creacion = 1656 ).
*
*
*    lo_cuadro2->mostrar_ficha( importing o_ficha = lv_ficha ).
*
*    out->write( lv_ficha ).
*

    "ZCL_CALCULADORA80_05


*    DATA lv_inicio TYPE i.
*    DATA lv_nombre  TYPE string.
*
*    DATA(lo_calculadora) = NEW zcl_calculadora80_05(
*    i_propietario = 'Manolo'
*  ).
*
*
*    lo_calculadora->get_propietario( IMPORTING o_propietario = lv_nombre ).
*    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_inicio ).
*    out->write( |Calculadora de { lv_nombre }  |  &&  |  Pantalla: { lv_inicio }| ).
*
*

    " esto es la consola en la ia para el programa PRODUCTOS_05 DE LA IA.



*    DATA lo_crud     TYPE REF TO zcl_productos_00.
*    DATA ls_producto TYPE zproductos_00.
*    DATA lt_productos TYPE STANDARD TABLE OF zproductos_00.
*    DATA lv_valido   TYPE abap_bool.
*    DATA lv_encontrado TYPE abap_bool.
*
*    lo_crud = NEW zcl_productos_00( ).
*
*
*
*   PASO 1 — Insertar tres productos
*    "================================================================
*    out->write( '=== PASO 1: Insertar productos ===' ).
*
*    lv_valido = lo_crud->insertar(
*                  i_producto_id = '00000001'
*                  i_nombre      = 'Teclado Mecánico Pro'
*                  i_categoria   = 'Periféricos'
*                  i_precio      = '89.99'
*                  i_stock       = 150
*                  i_activo      = 'X' ).
*    IF lv_valido = abap_true.
*      out->write( 'OK  - Producto 00000001 insertado.' ).
*    ELSE.
*      out->write( 'ERR - No se pudo insertar 00000001.' ).
*    ENDIF.
*
*    lv_valido = lo_crud->insertar(
*                  i_producto_id = '00000002'
*                  i_nombre      = 'Ratón Inalámbrico Slim'
*                  i_categoria   = 'Periféricos'
*                  i_precio      = '34.50'
*                  i_stock       = 230
*                  i_activo      = 'X' ).
*    IF lv_valido = abap_true.
*      out->write( 'OK  - Producto 00000002 insertado.' ).
*    ELSE.
*      out->write( 'ERR - No se pudo insertar 00000002.' ).
*    ENDIF.
*
*    lv_valido = lo_crud->insertar(
*                  i_producto_id = '00000003'
*                  i_nombre      = 'Monitor 4K 27 pulgadas'
*                  i_categoria   = 'Monitores'
*                  i_precio      = '349.00'
*                  i_stock       = 40
*                  i_activo      = 'X' ).
*    IF lv_valido = abap_true.
*      out->write( 'OK  - Producto 00000003 insertado.' ).
*    ELSE.
*      out->write( 'ERR - No se pudo insertar 00000003.' ).
*    ENDIF.
*
*    "================================================================
*    " PASO 2 — Buscar producto 00000002
*    "================================================================
*    out->write( '=== PASO 2: Buscar producto 00000002 ===' ).
*
*    lo_crud->buscar_por_id(
*      EXPORTING i_producto_id = '00000002'
*      IMPORTING o_producto    = ls_producto
*                o_encontrado  = lv_encontrado ).
*
*    IF lv_encontrado = abap_true.
*      out->write( |OK  - Encontrado: { ls_producto-nombre } | &
*                  |/ Precio: { ls_producto-precio }| ).
*    ELSE.
*      out->write( 'ERR - Producto 00000002 no encontrado.' ).
*    ENDIF.
*
*    "================================================================
*    " PASO 3 — Listar todos
*    "================================================================
*    out->write( '=== PASO 3: Listar todos los productos ===' ).
*
*    lt_productos = lo_crud->listar_todos( ).
*    out->write( |OK  - Total de productos: { lines( lt_productos ) }| ).
*
*    "================================================================
*    " PASO 4 — Modificar precio y stock del 00000001
*    "================================================================
*    out->write( '=== PASO 4: Modificar producto 00000001 ===' ).
*
*    lo_crud->buscar_por_id(
*      EXPORTING i_producto_id = '00000001'
*      IMPORTING o_producto    = ls_producto
*                o_encontrado  = lv_encontrado ).
*
*    IF lv_encontrado = abap_true.
*      ls_producto-precio = '74.99'.
*      ls_producto-stock  = 200.
*
*      lv_valido = lo_crud->modificar( i_producto = ls_producto ).
*      IF lv_valido = abap_true.
*        out->write( 'OK  - Producto 00000001 modificado (precio y stock).' ).
*      ELSE.
*        out->write( 'ERR - No se pudo modificar 00000001.' ).
*      ENDIF.
*    ELSE.
*      out->write( 'ERR - Producto 00000001 no encontrado para modificar.' ).
*    ENDIF.
*
*    "================================================================
*    " PASO 5 — Confirmar cambio en 00000001
*    "================================================================
*    out->write( '=== PASO 5: Verificar cambios en 00000001 ===' ).
*
*    lo_crud->buscar_por_id(
*      EXPORTING i_producto_id = '00000001'
*      IMPORTING o_producto    = ls_producto
*                o_encontrado  = lv_encontrado ).
*
*    IF lv_encontrado = abap_true.
*      out->write( |OK  - Precio actualizado: { ls_producto-precio } | &
*                  |/ Stock: { ls_producto-stock }| ).
*    ELSE.
*      out->write( 'ERR - No se pudo releer 00000001.' ).
*    ENDIF.
*
*    "================================================================
*    " PASO 6 — Borrar producto 00000003
*    "================================================================
*    out->write( '=== PASO 6: Borrar producto 00000003 ===' ).
*
*    lv_valido = lo_crud->borrar( i_producto_id = '00000003' ).
*    IF lv_valido = abap_true.
*      out->write( 'OK  - Producto 00000003 borrado.' ).
*    ELSE.
*      out->write( 'ERR - No se pudo borrar 00000003.' ).
*    ENDIF.
*
*    "================================================================
*    " PASO 7 — Listar de nuevo, confirmar que quedan 2
*    "================================================================
*    out->write( '=== PASO 7: Listado final ===' ).
*
*    lt_productos = lo_crud->listar_todos( ).
*    out->write( |OK  - Productos restantes: { lines( lt_productos ) }| ).
*
*    IF lines( lt_productos ) = 2.
*      out->write( 'OK  - Confirmado: solo quedan 2 productos.' ).
*    ELSE.
*      out->write( |AVISO - Se esperaban 2 pero hay { lines( lt_productos ) }.| ).
*    ENDIF.
*
*  ENDMETHOD.

*ENDCLASS.
* Clase Calculadora
*
*    DATA(lo_calculadora) = NEW zcl_calculadora_00( 'LuisCa' ).
**    lo_calculadora->get_propietario(
**            IMPORTING rv_propietario = DATA(lv_propietario) ).
**    lo_calculadora->get_valor(
**             IMPORTING rv_valor = DATA(lv_valor) ).
*    DATA(lv_propietario) = lo_calculadora->get_propietario( ).
*    DATA(lv_valor) = lo_calculadora->get_valor( ).
*
*    out->write( | Calculadora de { lv_propietario }  /  Pantalla: { lv_valor } | ).
*
*    out->write( '------------' ).
*    DATA(lo_calculadora2) = NEW zcl_calculadora_00( 'Paco' ).
*    lo_calculadora2->suma_e( EXPORTING
*                                i_num1 = 1
*                                i_num2 = 2
*                            IMPORTING
*                                o_res = DATA(lv_resultado) ).
*    out->write( lv_resultado ).
*
*    out->write( '------------' ).
*    lv_resultado = lo_calculadora2->suma_r( EXPORTING
*                                i_num1 = 3
*                                i_num2 = 4 ).
*    out->write( lv_resultado ).
*
*    out->write( '------------' ).
*    out->write( lo_calculadora2->suma_r( EXPORTING
*                                i_num1 = 5
*                                i_num2 = 6 ) ).

    "LUISCA - Clase Calculadora

*    DATA(lo_calculadora) = NEW zcl_calculadora_00( 'LuisCa' ).
*
*    lo_calculadora->get_propietario(
*            IMPORTING rv_propietario = DATA(lv_propietario) ).
*
*    lo_calculadora->get_valor(
*             IMPORTING rv_valor = DATA(lv_valor



** Tabla y Clase Alumnos
*
*    DATA(lo_alumnos) = NEW zcl_tabla_alumnos( ).
*    DATA lv_valido TYPE abap_bool.
*
*    lo_alumnos->insertar_1(
*        EXPORTING
*            i_dni = '12345678C'
*            i_nombre = 'LuisCa'
*            i_fecha_nac = '19870502'
*            i_curso = 'ABAP'
*            i_nota = 10
*        IMPORTING
*            o_valido = lv_valido ).
*
*    " Esta comprobación indica si ha ido bien o mal
*    IF lv_valido = abap_true. " Ha ido bien
*      out->write( 'Inserción correcta' ).
*    ELSE.
*      out->write( 'Inserción incorrecta' ).
*    ENDIF.
*
*    lo_alumnos->insertar_1(
*        EXPORTING
*            i_dni = '12345678F'
*            i_nombre = ' '
*            i_fecha_nac = '19870502'
*            i_curso = 'Mates'
*            i_nota = 10
*        IMPORTING
*            o_valido = lv_valido ).
*
*    " Esta comprobación indica si ha ido bien o mal
*    IF lv_valido = abap_true. " Ha ido bien
*      out->write( 'Inserción correcta' ).
*    ELSE.
*      out->write( 'Inserción incorrecta' ).
*    ENDIF.
*
*    " Declaro la estructura
*    DATA ls_alumnos TYPE zalumnos_00.
*
*    " Le meto los datos
*    ls_alumnos = VALUE #(
*        dni = '12345678G'
*        nombre = 'LuisCa'
*        fecha_nac = '19870502'
*        curso = 'ABAP'
*        nota = 10 ).
*
*    " Llamo al método
*    lo_alumnos->insertar_2(
*        EXPORTING i_alumnos = ls_alumnos
*        IMPORTING o_valido = lv_valido ).
*
*    " Comprobación
*    IF lv_valido = abap_true. " Ha ido bien
*      out->write( 'Inserción correcta' ).
*    ELSE.
*      out->write( 'Inserción incorrecta' ).
*    ENDIF.


**********************************************************************
* Relacionar tablas

    " Este tipo es la estructura final
    " La que quiero para el informe
*    TYPES: BEGIN OF ty_vuelos,
*             name          TYPE /dmo/carrier-name, " El nombre de la aerolinea
*             connection_id TYPE /dmo/flight-connection_id,
*             flight_date   TYPE /dmo/flight-flight_date,
*             price         TYPE /dmo/flight-price,
*           END OF ty_vuelos.
*
*    " Declaraciones para el informe
*    DATA ls_vuelos TYPE ty_vuelos.
*    DATA lt_vuelos TYPE TABLE OF ty_vuelos.
*
*    " Recupero TODOS los campos y registros
*    SELECT carrier_id,
*           connection_id,
*           flight_date,
*           price
*        FROM /dmo/flight
*        INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
**      out->write( lt_flight ).
*    ENDIF.
*
*    " Recupero solo ID y NAME
*    SELECT carrier_id, name
*        FROM /dmo/carrier
*        INTO TABLE @DATA(lt_carrier).
*    IF sy-subrc = 0.
**      out->write( lt_carrier ).
*    ENDIF.
*
*    " Recorro la tabla de los vuelos
*    LOOP AT lt_flight INTO DATA(ls_flight).
*
*      " Por cada vuelo busco el nombre en la tabla de aerolíneas
*      READ TABLE lt_carrier INTO DATA(ls_carrier)
*          WITH KEY carrier_id = ls_flight-carrier_id. " Comparo por ID
*      IF sy-subrc = 0.
*
*        " Asigno valores a la estructura del informe
*        ls_vuelos = VALUE #( name = ls_carrier-name
*                             connection_id = ls_flight-connection_id
*                             flight_date = ls_flight-flight_date
*                             price = ls_flight-price ).
*
*        " Añado la estructura a la tabla del informe
*        APPEND ls_vuelos TO lt_vuelos.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lt_vuelos ).
*
*

**********************************************************************
    "Enunciado: Informe de reservas con agencia


* Ejercicio de Reservas y Agencias




*    TYPES: BEGIN OF ty_reservas,
*             name          TYPE /dmo/agency-name,
*             connection_id TYPE /dmo/booking-connection_id,
*             flight_date   TYPE /dmo/booking-flight_date,
*             flight_price  TYPE /dmo/booking-flight_price,
*           END OF ty_reservas.
*
*    DATA ls_reservas TYPE ty_reservas.
*    DATA lt_reservas TYPE TABLE OF ty_reservas.
*
*    SELECT travel_id,
*           connection_id,
*           flight_date,
*           flight_price
*        FROM /dmo/booking
*        INTO TABLE @DATA(lt_booking) UP TO 20 ROWS.
*    IF sy-subrc = 0.
*
*      " Selección a Viajes
*      SELECT travel_id, agency_id FROM /dmo/travel
*          INTO TABLE @DATA(lt_travel).
*      IF sy-subrc = 0.
*
*        " Selección a Agencias
*        SELECT agency_id, name FROM /dmo/agency
*            INTO TABLE @DATA(lt_agency).
*        IF sy-subrc = 0.
*
*          LOOP AT lt_booking INTO DATA(ls_booking).
*
*            READ TABLE lt_travel INTO DATA(ls_travel)
*                WITH KEY travel_id = ls_booking-travel_id.
**                try.
**                DATA (ls_travel) = lt_travel [ travel_id = ls_booking-travel_id].
**                catch cx_sy_itab_line_not_found.
*
*            IF sy-subrc = 0.
*
*              READ TABLE lt_agency INTO DATA(ls_agency)
*                WITH KEY agency_id = ls_travel-agency_id.
*              IF sy-subrc = 0.
*
*                ls_reservas-connection_id = ls_booking-connection_id.
*                ls_reservas-flight_date = ls_booking-flight_date.
*                ls_reservas-flight_price = ls_booking-flight_price.
*                ls_reservas-name = ls_agency-name.
*
**                esta definicion es la nueva;
**                          ls_reservas = VALUE #( name = ls_agency-name
**                            connection_id = ls_booking-connection_id
**                           flight_date = ls_booking-flight_date
**                           flight_price = ls_booking-flight_price
**                            ).
*
*                APPEND ls_reservas TO lt_reservas.
*
*              ENDIF.
*
*            ENDIF.
*
*          ENDLOOP.
*
*          out->write( lt_reservas ).
*
*        ENDIF.
*
*      ENDIF.
*
*    ENDIF.
*
** TODO CON CODIGO NUEVO READ TABLE CON TRY Y CATCH.
*
*
* TYPES: BEGIN OF ty_reservas,
*             name          TYPE /dmo/agency-name,
*             connection_id TYPE /dmo/booking-connection_id,
*             flight_date   TYPE /dmo/booking-flight_date,
*             flight_price  TYPE /dmo/booking-flight_price,
*           END OF ty_reservas.
*
*    DATA ls_reservas TYPE ty_reservas.
*    DATA lt_reservas TYPE TABLE OF ty_reservas.
*
*    SELECT travel_id,
*           connection_id,
*           flight_date,
*           flight_price
*        FROM /dmo/booking
*        INTO TABLE @DATA(lt_booking) UP TO 10 ROWS.
*    IF sy-subrc = 0.
*
*      " Selección a Viajes
*      SELECT travel_id, agency_id FROM /dmo/travel
*          INTO TABLE @DATA(lt_travel).
*      IF sy-subrc = 0.
*
*        " Selección a Agencias
*        SELECT agency_id, name FROM /dmo/agency
*            INTO TABLE @DATA(lt_agency).
*        IF sy-subrc = 0.
*
*          LOOP AT lt_booking INTO DATA(ls_booking).
*
*            TRY.
*                DATA(ls_travel) = lt_travel[ travel_id = ls_booking-travel_id ].
*
*
*                DATA(ls_agency) = lt_agency[ agency_id = ls_travel-agency_id ].
*
*                ls_reservas = VALUE #( connection_id = ls_booking-connection_id
*                                  flight_date = ls_booking-flight_date
*                                  flight_price = ls_booking-flight_price
*                                  name = ls_agency-name ).
*
*                APPEND ls_reservas TO lt_reservas.
*
*              CATCH cx_sy_itab_line_not_found.
*                " No hace nada — si no encuentra, simplemente no añade
*            ENDTRY.
*
*          ENDLOOP.
*
*          out->write( lt_reservas ).
*
*        ENDIF.
*
*      ENDIF.
*
*    ENDIF.
*
*" PROGRAMA HERENCIA VEHICULO PADRE CAMION HIJO 4-05-2026
*    DATA(lo_vehiculo) = NEW zcl_vehiculo_00(
*                                i_matricula = '123456789'
*                                i_marca = 'Honda'
*                                i_anyo = 2000 ).
*
*    DATA(lo_turismo) = NEW zcl_turismo_00(
*                                i_matricula = '987654321'
*                                i_marca = 'Seat'
*                                i_anyo = 2001 ).
*
*    DATA(lo_camion) = NEW zcl_camion_00(
*                                i_matricula = 'ABC'
*                                i_marca = 'Renault'
*                                i_anyo = 1999 ).
*
*    out->write( lo_vehiculo->get_ficha( ) ).
**    lo_vehiculo->SET_carroceria( 'aa' ).
*    out->write(  '--------------------------' ).
*    lo_turismo->set_carroceria( 'Berlina' ).
*    out->write( lo_turismo->get_ficha( ) ).
*    out->write(  '--------------------------' ).
**    lo_camion->set_carroceria( 'Berlina' ).
*    out->write( lo_camion->get_ficha( ) ).
*
*    out->write(  '--------------------------' ).
*    out->write(  '--------------------------' ).
*
*    out->write( lo_vehiculo->calcular_impuesto( ) ).
*    out->write(  '--------------------------' ).
*    out->write( lo_turismo->calcular_impuesto( ) ).
*    out->write(  '--------------------------' ).
*    lo_camion->mv_tonelaje = 2.
*    out->write( lo_camion->calcular_impuesto( ) ).


*
**********************************************************************
*********************************************************************
*    "Enunciado: sistema de nomimas - Clases zcl_empleado_05 con hijos
*
*    DATA(lo_empleado) = NEW zcl_empleado_05(  i_nombre = 'Emilia'
*                                              i_dni = 'X'
*                                              i_salario = 50000 ).
*
*
*    lo_empleado->mostrar_ficha( IMPORTING o_ficha = DATA(lv_ficha) ).
*    out->write( lv_ficha ).
*
*    DATA(lo_empleado1) = NEW zcl_empleado_05(  i_nombre = 'Juan'
*                                                 i_dni = 'Y'
*                                                 i_salario = 30000 ).
*
*
*    DATA(lo_empleadofijo) = NEW zcl_empleado_fijo_05(  i_dni = 'J'
*                                              i_salario = 20000
*                                              i_nombre = 'Jose'
*                                              i_antiguedad = 6 ).
*
*    lo_empleadofijo->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
*    out->write( lv_ficha ).
*
*    DATA(lo_empleadotemporal) = NEW zcl_empleado_temporal_05(  i_dni = 'P'
*                                                 i_salario = 50000
*                                                 i_nombre = 'Pedro'
*                                                 i_horas_trabajadas = 6
*                                                 i_precio_hora = 8 ).
*
*    lo_empleadotemporal->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
*    out->write( lv_ficha ).
*
*    "05-05-2026 Asigno al padre el hijo, apuntan al mismo objeto, si le cambio el nombre al empleado del padre se cambian los dos "
*    "es una referencia.
*
*    lo_empleado = lo_empleadofijo.
*    lo_empleado->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
*    out->write( lv_ficha ).
*
*    "Ahora quiero utilizar dos instancias copiadas pero que no fueran referencia.
*
*   "Voy a crear una tabla de empleados
*
*
*   DATA lt_empleados TYPE TABLE OF REF TO zcl_empleado_05.
*   lt_empleados = VALUE #( ( lo_empleado )
*                              ( lo_empleadofijo )
*                              ( lo_empleadotemporal ) ).
*
*
**    out->write( lt_empleados ).
*
*    out->write( '----------' ).
*    out->write( '----------' ).
*    out->write( '----------' ).
*
*    LOOP AT lt_empleados INTO lo_empleado.
*      lo_empleado->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
*      out->write( lv_ficha ).
*    ENDLOOP.

*
**********************************************************************
*********************************************************************
*    "CREACION DE UNA APLICACIÓN CON FIORI EN ABAP
*
*
*  DELETE FROM zpilot_05.
*    INSERT zpilots_00 FROM TABLE @( VALUE #(
*      ( dorsal = '001' nombre = 'Max Verstappen'   equipo = 'Red Bull'   nacionalidad = 'Holandesa'  puntos = 575 )
*      ( dorsal = '044' nombre = 'Lewis Hamilton'   equipo = 'Ferrari'    nacionalidad = 'Británica'  puntos = 408 )
*      ( dorsal = '016' nombre = 'Charles Leclerc'  equipo = 'Ferrari'    nacionalidad = 'Monegasca'  puntos = 399 )
*      ( dorsal = '063' nombre = 'George Russell'   equipo = 'Mercedes'   nacionalidad = 'Británica'  puntos = 350 )
*      ( dorsal = '004' nombre = 'Lando Norris'     equipo = 'McLaren'    nacionalidad = 'Británica'  puntos = 374 )
*      ( dorsal = '014' nombre = 'Fernando Alonso'  equipo = 'Aston Martin' nacionalidad = 'Española' puntos = 206 )
*      ( dorsal = '055' nombre = 'Carlos Sainz'     equipo = 'Williams'   nacionalidad = 'Española'   puntos = 290 )
*    ) ).
*    out->write( 'Datos cargados OK' ).


********************************************************
*bebidas
**********************************************************************

*
*DELETE FROM ZBEBIDAS_05.
*INSERT ZBEBIDAS_05 FROM TABLE @( VALUE #(
*      ( codigo = '001'  nombre = 'Coca-Cola'   tipo = 'Resfreco' origen = 'China'  graduacion = 0  precio = 0 )
*      ( codigo = '002'  nombre = 'Cruz Campo'  tipo = 'Cerveza' origen = 'España'  graduacion = 0  precio = 0 )
*      ( codigo = '003'  nombre = 'Red Bull'    tipo = 'Cerveza' origen = 'USA'     graduacion = 0  precio = 0 )
*      ( codigo = '004'  nombre = 'Viejo Tito'  tipo = 'Brandy' origen = 'Alemania' graduacion = 0  precio = 0 )
*      ( codigo = '005'  nombre = 'Viejo Amigo' tipo = 'Whisky' origen = 'Belgica'  graduacion = 0  precio = 0 )
*      ) ).
*
* out->write( 'Datos cargados OK' ).
*
* EJECUTABLES 13-05-2026
*  data lv_fecha_nacimiento type d.
*        data lv_fecha_hoy type d.
*
*        lv_fecha_hoy = cl_abap_context_info=>get_system_date( ).
*        lv_fecha_nacimiento = '19641202'.
*        out->write( | Nací el { lv_fecha_nacimiento } | ).
*        out->write( | Hoy es { lv_fecha_hoy } | ).
*
*        data(lv_dias_vividos) = lv_fecha_hoy - lv_fecha_nacimiento.
*        out->write( | Han pasado { lv_dias_vividos } días | ).
*
*        data(lv_semanas_vividas) = conv f( lv_dias_vividos / 7 ) .
*        out->write( |Han pasado { lv_semanas_vividas } semanas | ).
*
*        data(lv_meses_vividas) = lv_dias_vividos / 30.
*        out->write( |Han pasado { lv_meses_vividas } meses | ).
*
*        data(lv_anios_vividas) = lv_dias_vividos / 365.
*        out->write( |Han pasado { lv_anios_vividas } años | ).
*
**        data lv_fecha_nacimiento type d.
**        data lv_fecha_hoy type d.
**
**        lv_fecha_hoy = cl_abap_context_info=>get_system_date( ).
**        lv_fecha_nacimiento = lv_fecha_hoy - 20.
**        out->write( lv_fecha_nacimiento ).


*AHORA VOY A DEFINIR UN TIPO DE DATOS DECIMAL zdecimal_00 QUE UTILIZO EN LAS SEMANAS
* data lv_fecha_nacimiento type d.
*        data lv_fecha_hoy type d.
*
*        lv_fecha_hoy = cl_abap_context_info=>get_system_date( ).
*        lv_fecha_nacimiento = '19870502'.
*        out->write( | Nací el { lv_fecha_nacimiento } | ).
*        out->write( | Hoy es { lv_fecha_hoy } | ).
*
*        data(lv_dias_vividos) = lv_fecha_hoy - lv_fecha_nacimiento.
*        out->write( | Han pasado { lv_dias_vividos } días | ).
*
*        DATA(lv_semanas_vividas) = CONV zdecimal_00( lv_dias_vividos / 7 ).
*        out->write( |Han pasado { lv_semanas_vividas } semanas | ).
*
*        data(lv_meses_vividos) = lv_dias_vividos / 30.
*        out->write( |Han pasado { lv_meses_vividos } meses | ).
*
*        data(lv_anios_vividos) = lv_dias_vividos / 365.
*        out->write( |Han pasado { lv_anios_vividos } años | ).
*        DATA(lv_dias_semana) = CONV zdecimal_00( lv_dias_vividos mod 7 ).
*        out->write( |Han pasado { lv_semanas_vividas } semanas y { lv_dias_semana } días | ).
*
*        data(lv_meses_vividas) = lv_dias_vividos / 30.
*        out->write( |Han pasado { lv_meses_vividas } meses | ).
*
*        data(lv_anios_vividas) = lv_dias_vividos / 365.
*        out->write( |Han pasado { lv_anios_vividas } años | ).

*        data lv_fecha_nacimiento type d.
*        data lv_fecha_hoy type d.
*
*        lv_fecha_hoy = cl_abap_context_info=>get_system_date( ).
*        lv_fecha_nacimiento = lv_fecha_hoy - 20.
*        out->write( lv_fecha_nacimiento ).


* data lv_fecha_nacimiento type d.
*        data lv_fecha_hoy type d.
*
*        lv_fecha_hoy = cl_abap_context_info=>get_system_date( ).
*        lv_fecha_nacimiento = '19870502'.
*        out->write( | Nací el { lv_fecha_nacimiento } | ).
*        out->write( | Hoy es { lv_fecha_hoy } | ).
*
*        data(lv_dias_vividos) = lv_fecha_hoy - lv_fecha_nacimiento.
*        out->write( | Han pasado { lv_dias_vividos } días | ).
*
*        DATA(lv_semanas_vividas) = CONV zdecimal_00( lv_dias_vividos / 7 ).
*        out->write( |Han pasado { lv_semanas_vividas } semanas | ).
*
*        data(lv_meses_vividos) = lv_dias_vividos / 30.
*        out->write( |Han pasado { lv_meses_vividos } meses | ).
*
*        data(lv_anios_vividos) = lv_dias_vividos / 365.
*        out->write( |Han pasado { lv_anios_vividos } años | ).
*        DATA(lv_dias_semana) = CONV zdecimal_00( lv_dias_vividos mod 7 ).
*        out->write( |Han pasado { lv_semanas_vividas } semanas y { lv_dias_semana } días | ).
*
*        data(lv_meses_vividas) = lv_dias_vividos / 30.
*        out->write( |Han pasado { lv_meses_vividas } meses | ).
*
*        data(lv_anios_vividas) = lv_dias_vividos / 365.
*        out->write( |Han pasado { lv_anios_vividas } años | ).
*
*

*Ahora voy a tomar solo parte de la fecha,
*    DATA(lv_fecha_hoy) = cl_abap_context_info=>get_system_date( ).
*    DATA(lv_anyo) = lv_fecha_hoy(4).
*    DATA(lv_mes) = lv_fecha_hoy+4(2).
*    DATA(lv_dia) = lv_fecha_hoy+6(2).
*    out->write( | Hoy es { lv_fecha_hoy } | ).
*    out->write( | Estamos en el año { lv_anyo } | ).
*    out->write( | Estamos en el mes { lv_mes } | ).
*    out->write( | Estamos en el día { lv_dia } | ).


*CON UTC

* DATA(lv_utc) = utclong_current( ).
*    out->write( lv_utc ).
*
*    lv_utc = utclong_add( val = lv_utc hours = 2 ).
*    out->write( lv_utc ).

*
*  out->write( 'Hola'(001) ).
*  out->write( 'TEXT'(001) ).
*  out->write( 'Adios'(002) ).
*
*  out->write( 'Emilia'(EMI) ).


*AHORA BUSCO UNA POSCION EN UNA CADENA

* data lv_integer type i.
*    lv_integer = numofchar( 'Luis Carlos' ).
*    out->write( lv_integer ).
*
*    lv_integer = find( val = 'Luis Carlos' sub = 'C' ).
*    out->write( lv_integer ).
*
*    lv_integer = find( val = 'Luis Carlos' sub = 'ca' ).
*    out->write( lv_integer ).
*
*    lv_integer = find( val = 'Luis Carlos' sub = 'ca' case = abap_false ).
*    out->write( lv_integer ).
*
*    lv_integer = find( val = 'Luis Carlos' sub = 'ca' off = 2 ).
*    out->write( lv_integer ).
*
*    lv_integer = find( val = 'Luis Carlos' sub = 'ca' off = 2 case = abap_false ).
*    out->write( lv_integer ).
*

*AHORA VOY A PONER UN METODO REEMPLAZAR

*
*     DATA lv_integer TYPE i.
*    lv_integer = numofchar( 'Luis Carlos' ).
*    out->write( lv_integer ).
*
*    lv_integer = find( val = 'Luis Carlos' sub = 'L' ).
*    out->write( lv_integer ).
*
*    lv_integer = find( val = 'Luis Carlos' sub = 'ca' ).
*    out->write( lv_integer ).
*
*    lv_integer = find( val = 'Luis Carlos' sub = 'ca' case = abap_false ).
*    out->write( lv_integer ).
*
*    DATA(lv_string) = 'LuisCa'.
*    out->write( lv_string ).
*
*    lv_string = to_upper( 'LuisCa' ).
*    out->write( lv_string ).
*
*    lv_string = to_lower( 'LuisCa' ).
*    out->write( lv_string ).
*
*    lv_string = condense( ' LuisCa ' ).
*    out->write( lv_string ).
*
*    lv_string = reverse( 'LuisCa' ).
*    out->write( lv_string ).
*
*    lv_string = replace( val = lv_string
*                         sub = 'a'
*                         with = 'o').
*    out->write( lv_string ).

*CLASE  14-05-2026 ******************************

* CONSTANTS c_number TYPE i VALUE 1234.
*
*    SELECT FROM /dmo/carrier
*        FIELDS 'Hello' AS Character, " Type c
*                1 AS Integer1, " Type i
*                -1 AS Integer2, " Type i
*                @c_number AS constant " Type i (same as constant)
*
*    INTO TABLE @DATA(result).
*
*    out->write( result ).
*
*    data lv_fecha type char9.
*    lv_fecha = '123456789'.
*    out->write( lv_fecha ).
*
*    data(lv_fecha3) = conv d( lv_fecha ).
*    out->write( lv_fecha3 ).
*
**
* CONSTANTS c_number TYPE i VALUE 1234.
*
*    SELECT FROM /dmo/carrier
*        FIELDS  carrier_id,
*                CAST( '20260514250' AS DATS ) AS date,
*
*                @c_number AS constant " Type i (same as constant)
*
*    INTO TABLE @DATA(result).
*
*    out->write( result ).

**********************************************************************
*  SELECT * FROM /dmo/customer
*        INTO TABLE @DATA(lt_clientes).
*    IF sy-subrc = 0.
*      out->write( lt_clientes ).
*    ENDIF.
*
*    DATA lt_clientes_aux TYPE TABLE OF /dmo/customer.
*
*    LOOP AT lt_clientes INTO DATA(ls_cliente).
*      IF ls_cliente-title = 'Mrs.'.
*        ls_cliente-title = 'Misses'.
*      ELSEIF ls_cliente-title = 'Mr.'.
*        ls_cliente-title = 'Mister'.
*      ENDIF.
*
*      APPEND ls_cliente TO lt_clientes_aux.
*
*    ENDLOOP.
*    lt_clientes = lt_clientes_aux.
*    out->write( lt_clientes ).
*
*
**********************************************************************
* CAMBIAMOS DATOS DE UN REGISTRO MIS POR MISSES EN EL METODO ANTIGUO Y MODERNO
* /ANTIGUO/
*  DATA lt_clientes_aux TYPE TABLE OF /dmo/customer.
* SELECT * FROM /dmo/customer
*        INTO TABLE @DATA(lt_clientes).
*    IF sy-subrc = 0.
*      out->write( lt_clientes ).
*    ENDIF.
*    LOOP AT lt_clientes INTO DATA(ls_cliente).
*      IF ls_cliente-title = 'Mrs.'.
*        ls_cliente-title = 'Misses'.
*      ELSEIF ls_cliente-title = 'Mr.'.
*        ls_cliente-title = 'Mister'.
*      ENDIF.
*
*      APPEND ls_cliente TO lt_clientes_aux.
*
*    ENDLOOP.
*    lt_clientes = lt_clientes_aux.
*    out->write( lt_clientes ).

* CON FIELD SYMBOL

* SELECT * FROM /dmo/customer
*        INTO TABLE @DATA(lt_clientes).
*    IF sy-subrc = 0.
*      out->write( lt_clientes ).
*    ENDIF.
* LOOP AT lt_clientes ASSIGNING FIELD-SYMBOL(<fs_cliente>).
*      IF <fs_cliente>-title = 'Mrs.'.
*        <fs_cliente>-title = 'Misses'.
*      ELSEIF <fs_cliente>-title = 'Mr.'.
*        <fs_cliente>-title = 'Mister'.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lt_clientes ).

*MODERNO CON CASE SE HACE EN CAPA DE BASE DE DATOS EN SELECT

*SELSECT FROM /dmo/customer
*        FIELDS customer_id, first_name, last_name,
*            CASE title
*                WHEN 'Mrs.'
*                    THEN 'Misses'
*                WHEN 'Mr.'
*                    THEN 'Mister'
*                ELSE ' '
*            END AS title
*        INTO TABLE @DATA(lt_clientes).
*    IF sy-subrc = 0.
*      out->write( lt_clientes ).
*    ENDIF.

*CALCULO DE ASIENTOS LIBRES 15-05-2026
*carried_id, conecction_i.d, flight_date, asientos maximos, asientos ocupados





*SELECT FROM /dmo/flight
*        FIELDS carrier_id, connection_id, flight_date, seats_max, seats_occupied,
*
*                seats_max - seats_occupied AS libres
*
*        INTO TABLE @DATA(lt_clientes).
*    IF sy-subrc = 0.
*      out->write( lt_clientes ).
*    ENDIF.

* ahora le añadimos una columna con la diferencia de fecha del vuelo y el dia de hoy
* No se puede hacer operaciones aritmeticas



*DATA(lv_today) = cl_abap_context_info=>get_system_date(  ).
*
*    SELECT FROM /dmo/flight
*        FIELDS  carrier_id,
*                connection_id,
*                flight_date,
*                seats_max,
*                seats_occupied,
*                seats_max - seats_occupied AS seats_free,
*                dats_days_between( @lv_today, flight_date ) AS days_until_departure
*        WHERE flight_date >= @lv_today
*        INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
*      out->write( lt_flight ).
*    ENDIF.
*
*


*Podemos calular un campo que sea calculado previamente? en pricipio no

*DATA(lv_today) = cl_abap_context_info=>get_system_date(  ).
*
*    SELECT FROM /dmo/flight
*        FIELDS  carrier_id,
*                connection_id,
*                flight_date,
*                dats_add_days( flight_date, 1 ) AS tomorrow,
*                seats_max,
*                seats_occupied,
*                seats_max - seats_occupied AS seats_free,
*                dats_days_between( @lv_today, flight_date ) AS days_until_departure
*
*        WHERE flight_date >= @lv_today
*        INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
*      out->write( lt_flight ).
*    ENDIF.
*
**AHORA QUEREMOS CALCULAR EL % **PARA HACER LA DIVISION TENEMOS QUE PONER
*TODOS LOS CAMPOS EN COMA FLOTANTE*********************************

* DATA(lv_today) = cl_abap_context_info=>get_system_date(  ).
*
*    SELECT FROM /dmo/flight
*        FIELDS  carrier_id,
*                connection_id,
*                flight_date,
*                dats_add_days( flight_date, 1 ) AS tomorrow,
*                seats_max,
*                seats_occupied,
*                seats_max - seats_occupied AS seats_free,
*                dats_days_between( @lv_today, flight_date ) AS days_until_departure,
*
*                ( CAST( seats_occupied AS FLTP ) * CAST( 100 AS FLTP ) ) / CAST( seats_max AS FLTP ) AS percentage
*
*                WHERE flight_date >= @lv_today
*        INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
*      out->write( lt_flight ).
*    ENDIF.
*
*DATA(lv_today) = cl_abap_context_info=>get_system_date(  ).
**CON DIVISION
*    SELECT FROM /dmo/flight
*        FIELDS  carrier_id,
*                connection_id,
*                flight_date,
*                dats_add_days( flight_date, 1 ) AS tomorrow,
*                seats_max,
*                seats_occupied,
*                seats_max - seats_occupied AS seats_free,
*                dats_days_between( @lv_today, flight_date ) AS days_until_departure,
*                division( 100 * seats_occupied, seats_max, 3 ) as percentage
**                ( CAST( seats_occupied AS FLTP ) * CAST( 100 AS FLTP ) ) / CAST( seats_max AS FLTP ) AS percentage
*
*                WHERE flight_date >= @lv_today
*        INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
*      out->write( lt_flight ).
*    ENDIF.
*
*


**AHORA LO HACEMOS CON CADENAS********************************************************************


*SELECT FROM /dmo/customer
*            FIELDS customer_id,
*                   street && ',' && ' ' && postal_code && ' ' && city AS address_exp
*
*            WHERE country_code = 'ES'
*            INTO TABLE @DATA(result_concat).
*
*        out->write( result_concat ).
*
*

* SELECT FROM /dmo/customer
*            FIELDS customer_id,
*                   street && ',' && ' ' && postal_code && ' ' && city AS address_exp,
*                   concat( 'Hola', 'Adios' )  as hola
*            WHERE country_code = 'ES'
*            INTO TABLE @DATA(result_concat).
*
*        out->write( result_concat ).
*
***QUIERO QUEDARME SOLO CON PARTE POR EJEM DEL CODIGO POSTAL**
***A PARTIR DE 3 COGE 2 **************************************************************


* SELECT FROM /dmo/customer
*            FIELDS customer_id,
*                   street && ',' && ' ' && postal_code && ' ' && city AS address_exp,
*                   concat( 'Hola', concat( ' ', 'Adios' ) )  as hola,
*                   postal_code,
*                   substring( postal_code, 3, 2 ) as subcadena
*            WHERE country_code = 'ES'
*            INTO TABLE @DATA(result_concat).
*
*        out->write( result_concat ).

*** VEMOS SI UNA FECHA ES VALIDA***********************************************************

*
* DATA lv_hoy TYPE d.
*    lv_hoy = '20260330'.
*    SELECT single FROM /dmo/carrier
*            FIELDS
*                is_valid( @lv_hoy ) AS valido
*            INTO @DATA(ls_carrier).
*    IF sy-subrc = 0.
*      out->write( ls_carrier ).
*    ENDIF.
**********************************************************************

* MOSTRAR DATOS ORDENADOS DE UNA TABLA
*SELECT FROM /dmo/flight
*            FIELDS  *
*            ORDER BY
*                    currency_code ASCENDING,
*                    price ASCENDING
*            INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
*      out->write( lt_flight ).
*    ENDIF.
**********************************************************************
*SELECT FROM /dmo/flight
*    FIELDS  currency_code,
*            CAST( AVG( price ) AS DEC( 15, 2 ) ) AS precio_medio,
*            COUNT(*) AS num_vuelos,
*            MIN( price ) AS precio_min,
*            MAX( price ) AS precio_max
*    GROUP BY currency_code
*    ORDER BY currency_code ASCENDING
*    INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
*      out->write( lt_flight ).
*    ENDIF.

*si quiero agrupar por dos campos deben esta los dos dentro del group by.

* SELECT FROM /dmo/flight
*    FIELDS  connection_id,
*            currency_code,
*            CAST( AVG( price ) AS DEC( 15, 2 ) ) AS precio_medio,
*            COUNT(*) AS num_vuelos,
*            MIN( price ) AS precio_min,
*            MAX( price ) AS precio_max
*    GROUP BY currency_code, connection_id
*    ORDER BY currency_code ASCENDING
*    INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
*      out->write( lt_flight ).
*    ENDIF.


*AHORA LO HAGO CON DISTINCT

*SELECT DISTINCT connection_id FROM /dmo/flight
*            ORDER BY
*                    connection_id ASCENDING
**                    price ASCENDING
*            INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
*      out->write( lt_flight ).
*    ENDIF.
** AHORA CON VARIOS CAMPOS *********************************************************************
*SELECT DISTINCT connection_id,
*                    price,
*                    currency_code,
*                    plane_type_id,
*                    seats_max,
*                    seats_occupied
*            FROM /dmo/flight
*            ORDER BY
*                    connection_id ASCENDING
**                    price ASCENDING
*            INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
*      out->write( lt_flight ).
*    ENDIF.

****15-05-2026 MEJORA DEL RENDIMIENTO DE UNA TABLA INTERNA*************************************************

*
*    SELECT FROM /dmo/flight
*            FIELDS  *
*            INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
*      SORT lt_flight BY carrier_id ASCENDING connection_id DESCENDING.
*      out->write( lt_flight ).
*    ENDIF.
*
********************************************
* TYPES: BEGIN OF ty_airport,
*             airport TYPE c LENGTH 3,
*           END OF ty_airport.
*
*    DATA: lt_airports TYPE STANDARD TABLE OF ty_airport.
*
*    " Metemos datos SIN ordenar, con duplicados intercalados
*    APPEND VALUE #( airport = 'FRA' ) TO lt_airports.
*    APPEND VALUE #( airport = 'FRA' ) TO lt_airports.  " otro duplicado no adyacente
*    APPEND VALUE #( airport = 'MAD' ) TO lt_airports.
*    APPEND VALUE #( airport = 'FRA' ) TO lt_airports.  " duplicado no adyacente
*    APPEND VALUE #( airport = 'JFK' ) TO lt_airports.
*    APPEND VALUE #( airport = 'MAD' ) TO lt_airports.  " duplicado no adyacente
*
*
*    " ❌ SIN SORT — DELETE ADJACENT solo elimina vecinos iguales
**    SORT lt_airports.
*    DELETE ADJACENT DUPLICATES FROM lt_airports COMPARING airport.
*
*    " Resultado esperado si funcionara: FRA, MAD, JFK
*    " Resultado REAL: FRA, MAD, FRA, JFK, MAD  ← sigue con duplicados
*    LOOP AT lt_airports INTO DATA(ls).
*      out->write( ls-airport ).
*    ENDLOOP.

*    TYPES: BEGIN OF ty_airport,
*             airport  TYPE c LENGTH 3,
*             country  TYPE c LENGTH 2,
*             hub_type TYPE c LENGTH 1,
*           END OF ty_airport.
*
*    DATA: lt_airports TYPE STANDARD TABLE OF ty_airport.
*
*    APPEND VALUE #( airport = 'FRA'  country = 'DE'  hub_type = 'I' ) TO lt_airports.
*    APPEND VALUE #( airport = 'MAD'  country = 'ES'  hub_type = 'I' ) TO lt_airports.
*    APPEND VALUE #( airport = 'FRA'  country = 'DE'  hub_type = 'I' ) TO lt_airports.
*    APPEND VALUE #( airport = 'JFK'  country = 'US'  hub_type = 'I' ) TO lt_airports.
*    APPEND VALUE #( airport = 'MAD'  country = 'ES'  hub_type = 'N' ) TO lt_airports.
*    APPEND VALUE #( airport = 'FRA'  country = 'DE'  hub_type = 'R' ) TO lt_airports.
*    APPEND VALUE #( airport = 'BCN'  country = 'ES'  hub_type = 'N' ) TO lt_airports.
*    APPEND VALUE #( airport = 'BCN'  country = 'ES'  hub_type = 'N' ) TO lt_airports.
*    APPEND VALUE #( airport = 'MAD'  country = 'ES'  hub_type = 'I' ) TO lt_airports.
*
*    " ── ANTES ──────────────────────────────────────────────────────
*    out->write( '=== ANTES del SORT y DELETE ===' ).
*    LOOP AT lt_airports INTO DATA(ls).
*      out->write( |{ ls-airport } { ls-country } { ls-hub_type }| ).
*    ENDLOOP.
*
*    " ── CASO 1: un campo ───────────────────────────────────────────
*    DATA lt_caso1 LIKE lt_airports.
*    lt_caso1 = lt_airports.
*    SORT lt_caso1 BY airport.
*    DELETE ADJACENT DUPLICATES FROM lt_caso1 COMPARING airport.
*
*    out->write( ' ' ).
*    out->write( '=== CASO 1: COMPARING airport ===' ).
*    LOOP AT lt_caso1 INTO ls.
*      out->write( |{ ls-airport } { ls-country } { ls-hub_type }| ).
*    ENDLOOP.
*
*    " ── CASO 2: dos campos ─────────────────────────────────────────
*    DATA lt_caso2 LIKE lt_airports.
*    lt_caso2 = lt_airports.
*    SORT lt_caso2 BY airport country.
*    DELETE ADJACENT DUPLICATES FROM lt_caso2 COMPARING airport country.
*
*    out->write( ' ' ).
*    out->write( '=== CASO 2: COMPARING airport country ===' ).
*    LOOP AT lt_caso2 INTO ls.
*      out->write( |{ ls-airport } { ls-country } { ls-hub_type }| ).
*    ENDLOOP.
*
*    " ── CASO 3: tres campos ────────────────────────────────────────
*    DATA lt_caso3 LIKE lt_airports.
*    lt_caso3 = lt_airports.
*    SORT lt_caso3 BY airport country hub_type.
*    DELETE ADJACENT DUPLICATES FROM lt_caso3 COMPARING airport country hub_type.
*
*    out->write( ' ' ).
*    out->write( '=== CASO 3: COMPARING airport country hub_type ===' ).
*    LOOP AT lt_caso3 INTO ls.
*      out->write( |{ ls-airport } { ls-country } { ls-hub_type }| ).
*    ENDLOOP.
*
*    " ── CASO 4: orden  ────────────────────────────────────────
*    DATA lt_caso4 LIKE lt_airports.
*    lt_caso4 = lt_airports.
*    SORT lt_caso4 BY hub_type.
*    out->write( ' ' ).
*    out->write( '=== CASO 4A: COMPARING hub_type ===' ).
*    LOOP AT lt_caso4 INTO ls.
*      out->write( |{ ls-airport } { ls-country } { ls-hub_type }| ).
*    ENDLOOP.
*
*    DELETE ADJACENT DUPLICATES FROM lt_caso4 COMPARING hub_type.
*
*    out->write( ' ' ).
*    out->write( '=== CASO 4B: COMPARING hub_type ===' ).
*    LOOP AT lt_caso4 INTO ls.
*      out->write( |{ ls-airport } { ls-country } { ls-hub_type }| ).
*    ENDLOOP.
*
********CORRESPONDING – MOVER INFORMACIÓN DE UNA TABLA A OTRA EN CAMPOS IGUALES.***************************************************************
*
*    " ──────────────────────────────────────────────────────────────
*    "  TIPOS
*    " ──────────────────────────────────────────────────────────────
*    TYPES: BEGIN OF ty_vuelo,
*             airline_id   TYPE c LENGTH 3,   " <── campo común
*             flight_num   TYPE c LENGTH 4,   " <── campo común
*             airport_from TYPE c LENGTH 3,
*             airport_to   TYPE c LENGTH 3,
*             price        TYPE p LENGTH 8 DECIMALS 2,
*           END OF ty_vuelo.
*
*    TYPES: BEGIN OF ty_reserva,
*             airline_id  TYPE c LENGTH 3,   " <── campo común
*             flight_num  TYPE c LENGTH 4,   " <── campo común
*             customer_id TYPE c LENGTH 6,
*             seat        TYPE c LENGTH 4,
*             status      TYPE c LENGTH 1,   " B=Booked C=Cancelled
*           END OF ty_reserva.
*
*    " ──────────────────────────────────────────────────────────────
*    "  ESTRUCTURAS
*    " ──────────────────────────────────────────────────────────────
*    DATA: ls_vuelo   TYPE ty_vuelo,
*          ls_reserva TYPE ty_reserva.
*
*    " ──────────────────────────────────────────────────────────────
*    "  TABLAS INTERNAS
*    " ──────────────────────────────────────────────────────────────
*    DATA: lt_vuelos   TYPE TABLE OF ty_vuelo,
*          lt_reservas TYPE TABLE OF ty_reserva.
*
*    " ──────────────────────────────────────────────────────────────
*    "  DATOS DE PRUEBA — vuelos
*    " ──────────────────────────────────────────────────────────────
*    APPEND VALUE #( airline_id = 'IB'  flight_num = '0034'
*                    airport_from = 'MAD'  airport_to = 'FRA'
*                    price = '250.00' ) TO lt_vuelos.
*
*    APPEND VALUE #( airline_id = 'IB'  flight_num = '0101'
*                    airport_from = 'MAD'  airport_to = 'JFK'
*                    price = '680.00' ) TO lt_vuelos.
*
*    APPEND VALUE #( airline_id = 'LH'  flight_num = '0400'
*                    airport_from = 'FRA'  airport_to = 'BCN'
*                    price = '190.00' ) TO lt_vuelos.
*
**    " ──────────────────────────────────────────────────────────────
**    "  DATOS DE PRUEBA — reservas
**    " ──────────────────────────────────────────────────────────────
**    APPEND VALUE #( airline_id = 'IB'  flight_num = '0034'
**                    customer_id = 'C00001'  seat = '12A'
**                    status = 'B' ) TO lt_reservas.
**
**    APPEND VALUE #( airline_id = 'IB'  flight_num = '0034'
**                    customer_id = 'C00002'  seat = '12B'
**                    status = 'B' ) TO lt_reservas.
**
*    APPEND VALUE #( airline_id = 'LH'  flight_num = '0400'
*                    customer_id = 'C00003'  seat = '01C'
*                    status = 'C' ) TO lt_reservas.
*
*    " ──────────────────────────────────────────────────────────────
*    "  DEMO CORRESPONDING
*    " ──────────────────────────────────────────────────────────────
*
*    " ── Mover ls_vuelo → ls_reserva con CORRESPONDING ─────────────
*    " Solo se mueven airline_id y flight_num (campos con mismo nombre)
*    " airport_from, airport_to, price  → se ignoran (no existen en ty_reserva)
*    " customer_id, seat, status        → NO se tocan (no existen en ty_vuelo)
*
*    READ TABLE lt_vuelos INTO ls_vuelo INDEX 1.
*
*    out->write( '=== ls_vuelo (origen) ===' ).
*    out->write( |airline_id:   { ls_vuelo-airline_id }| ).
*    out->write( |flight_num:   { ls_vuelo-flight_num }| ).
*    out->write( |airport_from: { ls_vuelo-airport_from }| ).
*    out->write( |airport_to:   { ls_vuelo-airport_to }| ).
*    out->write( |price:        { ls_vuelo-price }| ).
*
*    ls_reserva-customer_id = 'C00099'.   " simulamos que ya tenía datos
*    ls_reserva-seat        = '33F'.
*    ls_reserva-status      = 'B'.
*
*    out->write( ' ' ).
*    out->write( '=== ls_reserva ANTES del CORRESPONDING ===' ).
*    out->write( |airline_id:  { ls_reserva-airline_id }| ).
*    out->write( |flight_num:  { ls_reserva-flight_num }| ).
*    out->write( |customer_id: { ls_reserva-customer_id }| ).
*    out->write( |seat:        { ls_reserva-seat }| ).
*    out->write( |status:      { ls_reserva-status }| ).
*
*    " ── El CORRESPONDING ──────────────────────────────────────────
**    MOVE-CORRESPONDING ls_vuelo TO ls_reserva.
*    lt_reservas = CORRESPONDING #( lt_vuelos ).
*
*    out->write( ' ' ).
*    out->write( '=== ls_reserva DESPUÉS del CORRESPONDING ===' ).
*    out->write( |airline_id:  { ls_reserva-airline_id }| ).   " ← vino de ls_vuelo
*    out->write( |flight_num:  { ls_reserva-flight_num }| ).   " ← vino de ls_vuelo
*    out->write( |customer_id: { ls_reserva-customer_id }| ).  " ← NO tocado
*    out->write( |seat:        { ls_reserva-seat }| ).         " ← NO tocado
*    out->write( |status:      { ls_reserva-status }| ).       " ← NO tocado
*
*    out->write( ' ' ).
*    out->write( '=== REGLA ===' ).
*    out->write( '
*Solo viajan los campos cuyo nombre coincide en ambas estructuras.' ).
*    out->write( 'El resto de campos del destino conservan su valor anterior.' ).
*
*" ──────────────────────────────────────────────────────────────
*    "  TIPOS
*    " ──────────────────────────────────────────────────────────────
*    TYPES: BEGIN OF ty_vuelo,
*             airline_id   TYPE c LENGTH 3,   " <── campo común
*             flight_num   TYPE c LENGTH 4,   " <── campo común
*             airport_from TYPE c LENGTH 3,
*             airport_to   TYPE c LENGTH 3,
*             price        TYPE p LENGTH 8 DECIMALS 2,
*           END OF ty_vuelo.
*
*    TYPES: BEGIN OF ty_reserva,
*             airline_id  TYPE c LENGTH 3,   " <── campo común
*             flight_num  TYPE c LENGTH 4,   " <── campo común
*             customer_id TYPE c LENGTH 6,
*             seat        TYPE c LENGTH 4,
*             status      TYPE c LENGTH 1,   " B=Booked C=Cancelled
*           END OF ty_reserva.
*
*    " ──────────────────────────────────────────────────────────────
*    "  ESTRUCTURAS
*    " ──────────────────────────────────────────────────────────────
*    DATA: ls_vuelo   TYPE ty_vuelo,
*          ls_reserva TYPE ty_reserva.
*
*    " ──────────────────────────────────────────────────────────────
*    "  TABLAS INTERNAS
*    " ──────────────────────────────────────────────────────────────
*    DATA: lt_vuelos   TYPE TABLE OF ty_vuelo,
*          lt_reservas TYPE TABLE OF ty_reserva.
*
*    " ──────────────────────────────────────────────────────────────
*    "  DATOS DE PRUEBA — vuelos
*    " ──────────────────────────────────────────────────────────────
*    APPEND VALUE #( airline_id = 'IB'  flight_num = '0034'
*                    airport_from = 'MAD'  airport_to = 'FRA'
*                    price = '250.00' ) TO lt_vuelos.
*
*    APPEND VALUE #( airline_id = 'IB'  flight_num = '0101'
*                    airport_from = 'MAD'  airport_to = 'JFK'
*                    price = '680.00' ) TO lt_vuelos.
*
*    APPEND VALUE #( airline_id = 'LH'  flight_num = '0400'
*                    airport_from = 'FRA'  airport_to = 'BCN'
*                    price = '190.00' ) TO lt_vuelos.
*
**    " ──────────────────────────────────────────────────────────────
**    "  DATOS DE PRUEBA — reservas
**    " ──────────────────────────────────────────────────────────────
**    APPEND VALUE #( airline_id = 'IB'  flight_num = '0034'
**                    customer_id = 'C00001'  seat = '12A'
**                    status = 'B' ) TO lt_reservas.
**
**    APPEND VALUE #( airline_id = 'IB'  flight_num = '0034'
**                    customer_id = 'C00002'  seat = '12B'
**                    status = 'B' ) TO lt_reservas.
**
*    APPEND VALUE #( airline_id = 'LH'  flight_num = '0400'
*                    customer_id = 'C00003'  seat = '01C'
*                    status = 'C' ) TO lt_reservas.
*
*    " ──────────────────────────────────────────────────────────────
*    "  DEMO CORRESPONDING
*    " ──────────────────────────────────────────────────────────────
*
*    " ── Mover ls_vuelo → ls_reserva con CORRESPONDING ─────────────
*    " Solo se mueven airline_id y flight_num (campos con mismo nombre)
*    " airport_from, airport_to, price  → se ignoran (no existen en ty_reserva)
*    " customer_id, seat, status        → NO se tocan (no existen en ty_vuelo)
*
*    READ TABLE lt_vuelos INTO ls_vuelo INDEX 1.
*
*    out->write( '=== ls_vuelo (origen) ===' ).
*    out->write( |airline_id:   { ls_vuelo-airline_id }| ).
*    out->write( |flight_num:   { ls_vuelo-flight_num }| ).
*    out->write( |airport_from: { ls_vuelo-airport_from }| ).
*    out->write( |airport_to:   { ls_vuelo-airport_to }| ).
*    out->write( |price:        { ls_vuelo-price }| ).
*
*    ls_reserva-customer_id = 'C00099'.   " simulamos que ya tenía datos
*    ls_reserva-seat        = '33F'.
*    ls_reserva-status      = 'B'.
*
*    out->write( ' ' ).
*    out->write( '=== ls_reserva ANTES del CORRESPONDING ===' ).
*    out->write( |airline_id:  { ls_reserva-airline_id }| ).
*    out->write( |flight_num:  { ls_reserva-flight_num }| ).
*    out->write( |customer_id: { ls_reserva-customer_id }| ).
*    out->write( |seat:        { ls_reserva-seat }| ).
*    out->write( |status:      { ls_reserva-status }| ).
*
*    " ── El CORRESPONDING ──────────────────────────────────────────
**    MOVE-CORRESPONDING ls_vuelo TO ls_reserva.
*    lt_reservas = CORRESPONDING #( lt_vuelos ).
*
*    out->write( ' ' ).
*    out->write( '=== ls_reserva DESPUÉS del CORRESPONDING ===' ).
*    out->write( |airline_id:  { ls_reserva-airline_id }| ).   " ← vino de ls_vuelo
*    out->write( |flight_num:  { ls_reserva-flight_num }| ).   " ← vino de ls_vuelo
*    out->write( |customer_id: { ls_reserva-customer_id }| ).  " ← NO tocado
*    out->write( |seat:        { ls_reserva-seat }| ).         " ← NO tocado
*    out->write( |status:      { ls_reserva-status }| ).       " ← NO tocado
*
*    out->write( ' ' ).
*    out->write( '=== REGLA ===' ).
*    out->write( 'Solo viajan los campos cuyo nombre coincide en ambas estructuras.' ).
*    out->write( 'El resto de campos del destino conservan su valor anterior.' ).
*
*
*    " Quiero una tabla con un campo descriptivo combinando airline + flight
*
*    TYPES: BEGIN OF ty_etiqueta,
*             etiqueta TYPE c LENGTH 10,
*             ruta     TYPE c LENGTH 7,
*           END OF ty_etiqueta.
*
*    DATA lt_etiquetas TYPE TABLE OF ty_etiqueta.
*    lt_etiquetas = VALUE #( FOR v IN lt_vuelos
*                                   ( etiqueta = |{ v-airline_id }{ v-flight_num }|
*                                     ruta     = |{ v-airport_from }-{ v-airport_to }| ) ).
*
*    out->write( '=== Etiquetas de vuelo ===' ).
*    LOOP AT lt_etiquetas INTO DATA(ls_et).
*      out->write( |{ ls_et-etiqueta }  →  { ls_et-ruta }| ).
*    ENDLOOP.
*
*
*CALCULO DEL TOTAL DE LA TABLA DE VUELOS CON SELECT
*MODO UNO TRADICIONAL

*SELECT FROM /dmo/flight
*    FIELDS SUM( price ) AS total
*    WHERE CURRENCY_CODE = 'EUR'
*    INTO @DATA(lv_total)
*    .
*
*IF sy-subrc = 0.
*      out->write( |Total: { lv_total }| ).
*
*      ENDIF.

*MODO DOS CON EL REDUCE

*SELECT FROM /dmo/flight
*        FIELDS  *
*        WHERE currency_code = 'EUR'
*        INTO TABLE @DATA(lt_vuelos).
*
*    IF sy-subrc = 0.
*      DATA lv_resultado TYPE /dmo/flight-price.
*      lv_resultado = REDUCE #( INIT acumulador = 0
*                               FOR v IN lt_vuelos
*                               NEXT acumulador = acumulador + v-price ).
*
*      out->write( lv_resultado ).
*    ENDIF.
*
*
**MODO TRES CON EL REDUCE Y EL WHERE
*
*DATA(lv_total3) = REDUCE #( INIT total = 0
*                            FOR v IN lt_vuelos WHERE ( currency_code = 'EUR' )
*                            NEXT total += v-price ).
*
*IF sy-subrc = 0.
*      out->write( |Total: { lv_total3 }| ).
*ENDIF.


*CLASE REPASO RAP 18-05-2026**TABLAS ZRESTAURANTE_00. ZRECETA_00, ZINGREDIENTE_00****************************
*RELLENO DE DATOS LAS TABLAS PARA CREAR EL CDS DEL RAP.

DELETE FROM zrestaurante_00.

INSERT zrestaurante_00 FROM TABLE @( VALUE #(
  ( client = sy-mandt rest_id = 'REST001' rest_name = 'El Rincón de María'      city = 'Sevilla'       cuisine_type = 'Andaluza'    max_capacity = 80 )
  ( client = sy-mandt rest_id = 'REST002' rest_name = 'La Taberna del Chef'     city = 'Madrid'        cuisine_type = 'Española'    max_capacity = 60 )
  ( client = sy-mandt rest_id = 'REST003' rest_name = 'Sakura Japanese Food'    city = 'Barcelona'     cuisine_type = 'Japonesa'    max_capacity = 45 )
  ( client = sy-mandt rest_id = 'REST004' rest_name = 'Trattoria da Luigi'      city = 'Valencia'      cuisine_type = 'Italiana'    max_capacity = 55 )
  ( client = sy-mandt rest_id = 'REST005' rest_name = 'Le Petit Bistró'         city = 'Bilbao'        cuisine_type = 'Francesa'    max_capacity = 40 )
  ( client = sy-mandt rest_id = 'REST006' rest_name = 'Casa Pepe Mariscos'      city = 'Málaga'        cuisine_type = 'Marisquería' max_capacity = 70 )
  ( client = sy-mandt rest_id = 'REST007' rest_name = 'El Asador de Castilla'   city = 'Burgos'        cuisine_type = 'Castellana'  max_capacity = 90 )
  ( client = sy-mandt rest_id = 'REST008' rest_name = 'Wok & Roll'              city = 'Zaragoza'      cuisine_type = 'China'       max_capacity = 65 )
  ( client = sy-mandt rest_id = 'REST009' rest_name = 'La Brasa del Sur'        city = 'Granada'       cuisine_type = 'Parrilla'    max_capacity = 50 )
  ( client = sy-mandt rest_id = 'REST010' rest_name = 'Txoko Euskaldun'         city = 'San Sebastián' cuisine_type = 'Vasca'       max_capacity = 35 )
) ).

DELETE FROM zreceta_00.

INSERT zreceta_00 FROM TABLE @( VALUE #(
  ( client = sy-mandt receta_id = 'REC001' rest_id = 'REST001' receta_name = 'Gazpacho andaluz'     category = 'Entrante'  prep_time_min = 20  difficulty = 'Fácil'  )
  ( client = sy-mandt receta_id = 'REC002' rest_id = 'REST001' receta_name = 'Salmorejo cordobés'   category = 'Entrante'  prep_time_min = 25  difficulty = 'Fácil'  )
  ( client = sy-mandt receta_id = 'REC003' rest_id = 'REST002' receta_name = 'Cocido madrileño'     category = 'Principal' prep_time_min = 180 difficulty = 'Media'  )
  ( client = sy-mandt receta_id = 'REC004' rest_id = 'REST003' receta_name = 'Ramen de miso'         category = 'Principal' prep_time_min = 90  difficulty = 'Alta'   )
  ( client = sy-mandt receta_id = 'REC005' rest_id = 'REST004' receta_name = 'Risotto de setas'     category = 'Principal' prep_time_min = 45  difficulty = 'Media'  )
  ( client = sy-mandt receta_id = 'REC006' rest_id = 'REST005' receta_name = 'Crème brûlée'         category = 'Postre'    prep_time_min = 60  difficulty = 'Alta'   )
  ( client = sy-mandt receta_id = 'REC007' rest_id = 'REST006' receta_name = 'Paella de marisco'    category = 'Principal' prep_time_min = 60  difficulty = 'Media'  )
  ( client = sy-mandt receta_id = 'REC008' rest_id = 'REST007' receta_name = 'Lechazo al horno'     category = 'Principal' prep_time_min = 120 difficulty = 'Media'  )
  ( client = sy-mandt receta_id = 'REC009' rest_id = 'REST009' receta_name = 'Chuletón a la brasa'  category = 'Principal' prep_time_min = 30  difficulty = 'Fácil'  )
  ( client = sy-mandt receta_id = 'REC010' rest_id = 'REST010' receta_name = 'Bacalao al pil-pil'   category = 'Principal' prep_time_min = 50  difficulty = 'Alta'   )
) ).

DELETE FROM zingrediente_00.

INSERT zingrediente_00 FROM TABLE @( VALUE #(
  ( client = sy-mandt receta_id = 'REC001' ingrediente_id = 'ING001' ingrediente_name = 'Tomate maduro'        quantity = '1.00' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC001' ingrediente_id = 'ING002' ingrediente_name = 'Pepino'               quantity = '0.50' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC002' ingrediente_id = 'ING003' ingrediente_name = 'Tomate maduro'        quantity = '1.50' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC002' ingrediente_id = 'ING004' ingrediente_name = 'Pan del día anterior' quantity = '0.20' unit = 'kg' is_allergen = abap_true  )
  ( client = sy-mandt receta_id = 'REC003' ingrediente_id = 'ING005' ingrediente_name = 'Garbanzos'            quantity = '0.50' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC004' ingrediente_id = 'ING006' ingrediente_name = 'Fideos ramen'         quantity = '0.20' unit = 'kg' is_allergen = abap_true  )
  ( client = sy-mandt receta_id = 'REC005' ingrediente_id = 'ING007' ingrediente_name = 'Arroz arborio'        quantity = '0.30' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC007' ingrediente_id = 'ING008' ingrediente_name = 'Arroz bomba'          quantity = '0.40' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC007' ingrediente_id = 'ING009' ingrediente_name = 'Gambas frescas'       quantity = '0.50' unit = 'kg' is_allergen = abap_true  )
  ( client = sy-mandt receta_id = 'REC010' ingrediente_id = 'ING010' ingrediente_name = 'Bacalao desalado'     quantity = '0.60' unit = 'kg' is_allergen = abap_false )
) ).

COMMIT WORK.
*PARA METER UNA NUEVA RECETA EN EL RESTAUTANTE EN LA CONSULTA RECETAS DEL RESTAURANTE
INSERT zreceta_00 FROM TABLE @(
        VALUE #(
      ( client = sy-mandt receta_id = 'REC011' rest_id = 'REST011' receta_name = 'Gazpacho andaluz'     category = 'Entrante'  prep_time_min = 20  difficulty = 'Fácil'  )
      ) ).
    IF sy-subrc = 0.
      out->write( 'OK' ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
