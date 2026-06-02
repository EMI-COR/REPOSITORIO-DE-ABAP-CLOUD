CLASS zoperaciones_crud_repaso DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    "Interfaz para ejecutar con F9 desde ADT
    INTERFACES if_oo_adt_classrun.

    TYPES: ty_repaso   TYPE          zrepaso_05,
           ty_t_repaso TYPE TABLE OF zrepaso_05.

    "INIT
    CLASS-METHODS inicializar_datos
      IMPORTING
        io_out       TYPE REF TO if_oo_adt_classrun_out
      RETURNING
        VALUE(rv_ok) TYPE abap_bool.

    "EXISTS
    CLASS-METHODS existe_registro
      IMPORTING
        iv_id            TYPE zrepaso_05-id_repaso
      RETURNING
        VALUE(rv_existe) TYPE abap_bool.

    "CREATE
    CLASS-METHODS crear_registro
      IMPORTING
        is_datos         TYPE ty_repaso
        io_out           TYPE REF TO if_oo_adt_classrun_out
      RETURNING
        VALUE(rv_ok)     TYPE abap_bool.

    "READ — un registro
    CLASS-METHODS leer_registro
      IMPORTING
        iv_id            TYPE zrepaso_05-id_repaso
        io_out           TYPE REF TO if_oo_adt_classrun_out
      EXPORTING
        es_dato          TYPE ty_repaso.

    "READ ALL
    CLASS-METHODS leer_todos
      IMPORTING
        io_out           TYPE REF TO if_oo_adt_classrun_out
      EXPORTING
        et_datos         TYPE ty_t_repaso.

    "UPDATE
    CLASS-METHODS modificar_registro
      IMPORTING
        is_datos         TYPE ty_repaso
        io_out           TYPE REF TO if_oo_adt_classrun_out
      RETURNING
        VALUE(rv_ok)     TYPE abap_bool.

    "DELETE
    CLASS-METHODS borrar_registro
      IMPORTING
        iv_id            TYPE zrepaso_05-id_repaso
        io_out           TYPE REF TO if_oo_adt_classrun_out
      RETURNING
        VALUE(rv_ok)     TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.
CLASS zoperaciones_crud_repaso IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: ls_dato  TYPE zrepaso_05,
          lt_datos TYPE TABLE OF zrepaso_05,
          lv_ok    TYPE abap_bool.

    out->write( '===== INICIO CRUD ZREPASO_05 ======' ).

    "1. INIT — carga de datos
    out->write( '-- INICIALIZAR DATOS --' ).
    lv_ok = inicializar_datos( io_out = out ).

    "2. READ ALL
    out->write( '-- LEER TODOS --' ).
    leer_todos( EXPORTING io_out = out
                IMPORTING et_datos = lt_datos ).

    "3. READ uno
    out->write( '-- LEER REP001 --' ).
    leer_registro( EXPORTING iv_id  = 'REP001'
                               io_out = out
                   IMPORTING es_dato = ls_dato ).

    "4. UPDATE — modificar REP001
    out->write( '-- MODIFICAR REP001 --' ).
    ls_dato-descripcion = 'Descripcion modificada'.
    ls_dato-importe     = '9999.99'.
    ls_dato-estado      = 'I'.
    lv_ok = modificar_registro( is_datos = ls_dato
                                io_out   = out ).

    "5. READ uno — verificar cambio
    out->write( '-- VERIFICAR REP001 MODIFICADO --' ).
    leer_registro( EXPORTING iv_id  = 'REP001'
                               io_out = out
                   IMPORTING es_dato = ls_dato ).

    "6. CREATE — nuevo registro
    out->write( '-- CREAR REP006 --' ).
    ls_dato-id_repaso      = 'REP006'.
    ls_dato-descripcion    = 'Registro nuevo seis'.
    ls_dato-importe        = '777.00'.
    ls_dato-fecha_creacion = cl_abap_context_info=>get_system_date( ).
    ls_dato-estado         = 'A'.
    lv_ok = crear_registro( is_datos = ls_dato
                            io_out   = out ).

    "7. DELETE — borrar REP004
    out->write( '-- BORRAR REP004 --' ).
    lv_ok = borrar_registro( iv_id  = 'REP004'
                             io_out = out ).

    "8. READ ALL final
    out->write( '-- ESTADO FINAL DE LA TABLA --' ).
    leer_todos( EXPORTING io_out = out
                IMPORTING et_datos = lt_datos ).

    out->write( '===== FIN CRUD ======' ).

  ENDMETHOD.


  METHOD inicializar_datos.

    DATA: lt_repaso TYPE TABLE OF zrepaso_05,
          ls_repaso TYPE          zrepaso_05.

    DELETE FROM zrepaso_05 WHERE id_repaso IS NOT NULL.
    COMMIT WORK.

    ls_repaso-client = sy-mandt.

    ls_repaso-id_repaso      = 'REP001'.
    ls_repaso-descripcion    = 'Registro de prueba uno'.
    ls_repaso-importe        = '1500.00'.
    ls_repaso-fecha_creacion = cl_abap_context_info=>get_system_date( ).
    ls_repaso-estado         = 'A'.
    APPEND ls_repaso TO lt_repaso.

    ls_repaso-id_repaso      = 'REP002'.
    ls_repaso-descripcion    = 'Registro de prueba dos'.
    ls_repaso-importe        = '2750.50'.
    ls_repaso-fecha_creacion = cl_abap_context_info=>get_system_date( ).
    ls_repaso-estado         = 'A'.
    APPEND ls_repaso TO lt_repaso.

    ls_repaso-id_repaso      = 'REP003'.
    ls_repaso-descripcion    = 'Registro de prueba tres'.
    ls_repaso-importe        = '3100.00'.
    ls_repaso-fecha_creacion = cl_abap_context_info=>get_system_date( ).
    ls_repaso-estado         = 'A'.
    APPEND ls_repaso TO lt_repaso.

    ls_repaso-id_repaso      = 'REP004'.
    ls_repaso-descripcion    = 'Registro de prueba cuatro'.
    ls_repaso-importe        = '980.75'.
    ls_repaso-fecha_creacion = cl_abap_context_info=>get_system_date( ).
    ls_repaso-estado         = 'I'.
    APPEND ls_repaso TO lt_repaso.

    ls_repaso-id_repaso      = 'REP005'.
    ls_repaso-descripcion    = 'Registro de prueba cinco'.
    ls_repaso-importe        = '5000.00'.
    ls_repaso-fecha_creacion = cl_abap_context_info=>get_system_date( ).
    ls_repaso-estado         = 'A'.
    APPEND ls_repaso TO lt_repaso.

    INSERT zrepaso_05 FROM TABLE @lt_repaso.

    IF sy-subrc = 0.
      COMMIT WORK.
      rv_ok = abap_true.
      io_out->write( |{ lines( lt_repaso ) } registros insertados OK| ).
    ELSE.
      ROLLBACK WORK.
      rv_ok = abap_false.
      io_out->write( 'Error al insertar. ROLLBACK.' ).
    ENDIF.

  ENDMETHOD.


  METHOD existe_registro.

    SELECT SINGLE @abap_true
      FROM  zrepaso_05
      WHERE id_repaso = @iv_id
      INTO  @rv_existe.

  ENDMETHOD.


  METHOD crear_registro.

    DATA ls_repaso TYPE zrepaso_05.

    IF existe_registro( is_datos-id_repaso ) = abap_true.
      rv_ok = abap_false.
      io_out->write( |{ is_datos-id_repaso } ya existe| ).
      RETURN.
    ENDIF.

    ls_repaso        = is_datos.
    ls_repaso-client = sy-mandt.

    INSERT zrepaso_05 FROM @ls_repaso.

    IF sy-subrc = 0.
      COMMIT WORK.
      rv_ok = abap_true.
      io_out->write( |{ ls_repaso-id_repaso } creado OK| ).
    ELSE.
      ROLLBACK WORK.
      rv_ok = abap_false.
      io_out->write( |Error al crear { ls_repaso-id_repaso }| ).
    ENDIF.

  ENDMETHOD.


  METHOD leer_registro.

    SELECT SINGLE *
      FROM  zrepaso_05
      WHERE id_repaso = @iv_id
      INTO  @es_dato.

    IF sy-subrc = 0.
      io_out->write( es_dato ).
    ELSE.
      io_out->write( |{ iv_id } no encontrado| ).
    ENDIF.

  ENDMETHOD.


  METHOD leer_todos.

    SELECT *
      FROM  zrepaso_05
      ORDER BY id_repaso
      INTO TABLE @et_datos.

    IF sy-subrc = 0.
      io_out->write( et_datos ).
    ELSE.
      io_out->write( 'No existen registros en la tabla' ).
    ENDIF.

  ENDMETHOD.


  METHOD modificar_registro.

    IF existe_registro( is_datos-id_repaso ) = abap_false.
      rv_ok = abap_false.
      io_out->write( |{ is_datos-id_repaso } no existe| ).
      RETURN.
    ENDIF.

    UPDATE zrepaso_05
      SET   descripcion    = @is_datos-descripcion,
            importe        = @is_datos-importe,
            fecha_creacion = @is_datos-fecha_creacion,
            estado         = @is_datos-estado
      WHERE id_repaso      = @is_datos-id_repaso.

    IF sy-subrc = 0.
      COMMIT WORK.
      rv_ok = abap_true.
      io_out->write( |{ is_datos-id_repaso } modificado OK| ).
    ELSE.
      ROLLBACK WORK.
      rv_ok = abap_false.
      io_out->write( |Error al modificar { is_datos-id_repaso }| ).
    ENDIF.

  ENDMETHOD.


  METHOD borrar_registro.

    IF existe_registro( iv_id ) = abap_false.
      rv_ok = abap_false.
      io_out->write( |{ iv_id } no existe| ).
      RETURN.
    ENDIF.

    DELETE FROM zrepaso_05
      WHERE id_repaso = @iv_id.

    IF sy-subrc = 0.
      COMMIT WORK.
      rv_ok = abap_true.
      io_out->write( |{ iv_id } borrado OK| ).
    ELSE.
      ROLLBACK WORK.
      rv_ok = abap_false.
      io_out->write( |Error al borrar { iv_id }| ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

