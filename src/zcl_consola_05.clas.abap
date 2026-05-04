CLASS zcl_consola_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_05 IMPLEMENTATION.


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













*
 ENDMETHOD.

ENDCLASS.
