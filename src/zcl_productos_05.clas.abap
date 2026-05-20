CLASS zcl_productos_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS insertar
      IMPORTING
        i_producto_id   TYPE zproducto_id_05
        i_nombre        TYPE zproducto_nom_05
        i_categoria     TYPE zproducto_cat_05
        i_precio        TYPE zproducto_prc_05
        i_stock         TYPE zproducto_stk_05
        i_activo        TYPE zproducto_act_05
      RETURNING
        VALUE(o_valido) TYPE abap_bool.


    METHODS buscar_por_id
      IMPORTING
        i_producto_id TYPE zproducto_id_05
      EXPORTING
        o_producto    TYPE zproductos_05
        o_encontrado  TYPE abap_bool.

    TYPES ty_productos TYPE STANDARD TABLE OF
    zproductos_05 WITH DEFAULT KEY.

    METHODS listar_todos
      RETURNING
        VALUE(o_productos) TYPE ty_productos.


    METHODS modificar

      IMPORTING
        i_producto      TYPE zproductos_05
      RETURNING
        VALUE(o_valido) TYPE abap_bool.


    METHODS borrar
      IMPORTING
        i_producto_id   TYPE zproducto_id_05
      RETURNING
        VALUE(o_valido) TYPE abap_bool.




PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PRODUCTOS_05 IMPLEMENTATION.


METHOD insertar.

    DATA: ls_producto TYPE zproductos_05.

    ls_producto-producto_id = i_producto_id.
    ls_producto-nombre      = i_nombre.
    ls_producto-categoria   = i_categoria.
    ls_producto-precio      = i_precio.
    ls_producto-stock       = i_stock.
    ls_producto-activo      = i_activo.

    INSERT zproductos_05 FROM @ls_producto.

     IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.


    METHOD buscar_por_id.

      CLEAR: o_producto, o_encontrado.

      SELECT SINGLE *
        FROM zproductos_05
        WHERE " no se si esto es asi
           producto_id = @i_producto_id
        INTO @o_producto.

      IF sy-subrc = 0.
        o_encontrado = abap_true.
      ELSE.
        o_encontrado = abap_false.
      ENDIF.
    ENDMETHOD.


        METHOD listar_todos.
  SELECT *
    FROM zproductos_05
*   WHERE client = @sy-mandt
    ORDER BY producto_id
    INTO TABLE @o_productos.
ENDMETHOD.


  METHOD modificar.
      DATA ls_producto TYPE zproductos_05.

    ls_producto = i_producto.
*    ls_producto-client = sy-mandt.

    UPDATE zproductos_05 FROM @ls_producto.

    IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.


    METHOD borrar.
    DELETE FROM zproductos_05
      WHERE producto_id = @i_producto_id.
*       AND client      = @sy-mandt

    IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
