CLASS zcl_dw_manager_05 DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES tt_servicios  TYPE STANDARD TABLE OF zdw_servicio_05
                        WITH DEFAULT KEY.


    METHODS create_dueno
      IMPORTING is_dueno     TYPE zdw_dueno_05
      RETURNING VALUE(rv_ok) TYPE abap_bool.

    METHODS create_paseador
      IMPORTING is_paseador  TYPE zdw_paseador_05
      RETURNING VALUE(rv_ok) TYPE abap_bool.

    METHODS create_perro
      IMPORTING is_perro     TYPE zdw_perro_05
      RETURNING VALUE(rv_ok) TYPE abap_bool.

    METHODS create_servicio
      IMPORTING is_servicio  TYPE zdw_servicio_05
      RETURNING VALUE(rv_ok) TYPE abap_bool.

    METHODS create_valoracion
      IMPORTING is_valoracion TYPE zdw_valora_05
      RETURNING VALUE(rv_ok)  TYPE abap_bool.

   METHODS get_servicios_paseador
      IMPORTING iv_id_paseador      TYPE zdw_servicio_05-id_paseador
      RETURNING VALUE(rt_servicios) TYPE tt_servicios.

    METHODS get_servicios_perro
      IMPORTING iv_id_perro         TYPE zdw_servicio_05-id_perro
      RETURNING VALUE(rt_servicios) TYPE tt_servicios.


    METHODS get_media_valoracion_paseador
      IMPORTING iv_id_paseador  TYPE zdw_servicio_05-id_paseador
      RETURNING VALUE(rv_media) TYPE decfloat16.



PROTECTED SECTION.
  PRIVATE SECTION.

   METHODS check_dueno_exists
      IMPORTING iv_id_dueno      TYPE zdw_dueno_05-id_dueno
      RETURNING VALUE(rv_exists) TYPE abap_bool.

    METHODS check_paseador_exists
      IMPORTING iv_id_paseador   TYPE zdw_paseador_05-id_paseador
      RETURNING VALUE(rv_exists) TYPE abap_bool.

    METHODS check_perro_exists
      IMPORTING iv_id_perro      TYPE zdw_perro_05-id_perro
      RETURNING VALUE(rv_exists) TYPE abap_bool.

    METHODS check_servicio_exists
      IMPORTING iv_id_servicio   TYPE zdw_servicio_05-id_servicio
      RETURNING VALUE(rv_exists) TYPE abap_bool.

    METHODS check_servicio_completado
      IMPORTING iv_id_servicio   TYPE zdw_servicio_05-id_servicio
      RETURNING VALUE(rv_exists) TYPE abap_bool.









ENDCLASS.



CLASS ZCL_DW_MANAGER_05 IMPLEMENTATION.


METHOD check_dueno_exists.
    SELECT SINGLE @abap_true
      FROM zdw_dueno_05
      WHERE id_dueno = @iv_id_dueno
      INTO @rv_exists.
  ENDMETHOD.


  METHOD check_paseador_exists.
    SELECT SINGLE @abap_true
      FROM zdw_paseador_05
      WHERE id_paseador = @iv_id_paseador
      INTO @rv_exists.
  ENDMETHOD.


  METHOD check_perro_exists.
    SELECT SINGLE @abap_true
      FROM zdw_perro_05
      WHERE  id_perro = @iv_id_perro
      INTO @rv_exists.
  ENDMETHOD.


  METHOD check_servicio_exists.
    SELECT SINGLE @abap_true
      FROM zdw_servicio_05
      WHERE id_servicio = @iv_id_servicio
      INTO @rv_exists.
  ENDMETHOD.


  METHOD check_servicio_completado.
    SELECT SINGLE @abap_true
      FROM zdw_servicio_05
      WHERE  id_servicio = @iv_id_servicio
        AND estado      = 'CO'
      INTO @rv_exists.
  ENDMETHOD.


  METHOD create_dueno.
    IF is_dueno-nombre IS INITIAL.
      RETURN.
    ENDIF.
    IF check_dueno_exists( is_dueno-id_dueno ) = abap_true.
      RETURN.
    ENDIF.
    INSERT zdw_dueno_05 FROM @is_dueno.
    rv_ok = COND #( WHEN sy-subrc = 0 THEN abap_true ELSE abap_false ).
  ENDMETHOD.


  METHOD create_paseador.
    IF is_paseador-nombre IS INITIAL.
      RETURN.
    ENDIF.
    IF check_paseador_exists( is_paseador-id_paseador ) = abap_true.
      RETURN.
    ENDIF.
    INSERT zdw_paseador_05 FROM @is_paseador.
    rv_ok = COND #( WHEN sy-subrc = 0 THEN abap_true ELSE abap_false ).
  ENDMETHOD.


  METHOD create_perro.
    IF check_dueno_exists( is_perro-id_dueno ) = abap_false.
      RETURN.
    ENDIF.
    IF check_perro_exists( is_perro-id_perro ) = abap_true.
      RETURN.
    ENDIF.
    IF is_perro-tamano NA 'PMG' OR strlen( is_perro-tamano ) <> 1.
      RETURN.
    ENDIF.
    INSERT zdw_perro_05 FROM @is_perro.
    rv_ok = COND #( WHEN sy-subrc = 0 THEN abap_true ELSE abap_false ).
  ENDMETHOD.


  METHOD create_servicio.
    IF check_paseador_exists( is_servicio-id_paseador ) = abap_false.
      RETURN.
    ENDIF.
    IF check_perro_exists( is_servicio-id_perro ) = abap_false.
      RETURN.
    ENDIF.
    IF is_servicio-estado <> 'PE' AND
   is_servicio-estado <> 'AC' AND
   is_servicio-estado <> 'CO' AND
   is_servicio-estado <> 'CA'.
  RETURN.
    ENDIF.
    IF is_servicio-tipo_servicio <> 'PA' AND
   is_servicio-tipo_servicio <> 'GU' AND
   is_servicio-tipo_servicio <> 'AD'.
  RETURN.
ENDIF.
    IF is_servicio-fecha_fin < is_servicio-fecha_inicio.
      RETURN.
    ENDIF.
    INSERT zdw_servicio_05 FROM @is_servicio.
    rv_ok = COND #( WHEN sy-subrc = 0 THEN abap_true ELSE abap_false ).
  ENDMETHOD.


  METHOD create_valoracion.
    IF check_servicio_exists( is_valoracion-id_servicio ) = abap_false.
      RETURN.
    ENDIF.
    IF check_servicio_completado( is_valoracion-id_servicio ) = abap_false.
      RETURN.
    ENDIF.
    SELECT SINGLE @abap_true
      FROM zdw_valora_05
      WHERE  id_servicio = @is_valoracion-id_servicio
      INTO @DATA(lv_ya_existe).
    IF lv_ya_existe = abap_true.
      RETURN.
    ENDIF.
    IF is_valoracion-puntuacion < 1 OR is_valoracion-puntuacion > 5.
      RETURN.
    ENDIF.
    INSERT zdw_valora_05 FROM @is_valoracion.
    rv_ok = COND #( WHEN sy-subrc = 0 THEN abap_true ELSE abap_false ).
  ENDMETHOD.


METHOD get_servicios_paseador.
  SELECT *
    FROM zdw_servicio_05
    WHERE id_paseador = @iv_id_paseador
    INTO TABLE @rt_servicios.
ENDMETHOD.


METHOD get_servicios_perro.
  SELECT *
    FROM zdw_servicio_05
    WHERE id_perro = @iv_id_perro
    INTO TABLE @rt_servicios.
ENDMETHOD.


  METHOD get_media_valoracion_paseador.
  SELECT SINGLE AVG( v~puntuacion ) AS media
    FROM zdw_valora_05         AS v
    INNER JOIN zdw_servicio_05 AS s
      ON  s~id_servicio = v~id_servicio
    WHERE s~id_paseador = @iv_id_paseador
      AND s~estado      = 'CO'
    INTO @DATA(lv_media).
  rv_media = lv_media.
ENDMETHOD.
ENDCLASS.
