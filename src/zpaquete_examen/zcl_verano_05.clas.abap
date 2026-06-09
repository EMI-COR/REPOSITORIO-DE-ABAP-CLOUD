CLASS zcl_verano_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  TYPES tt_reservas TYPE TABLE OF ztab_verano_05 WITH EMPTY KEY.
    METHODS constructor
      IMPORTING
        iv_nombre      TYPE zde_nombre_cli_05
        iv_apellido    TYPE zde_apellido_cli_05
        iv_telefono    TYPE zde_telefono_05
        iv_dias        TYPE i
        iv_actividades TYPE i.

    METHODS calcular_importe
      RETURNING VALUE(rv_importe) TYPE zde_importe_05.

    METHODS generar_id_reserva
      RETURNING VALUE(rv_id) TYPE zde_id_reserva_05.

    METHODS ALTA_reserva
      RETURNING VALUE(rv_mensaje) TYPE string.

    METHODS MODIFICAR_Reserva
      IMPORTING
         iv_id          TYPE zde_id_reserva_05
        iv_nombre      TYPE zde_nombre_cli_05
        iv_apellido    TYPE zde_apellido_cli_05
        iv_telefono    TYPE zde_telefono_05
        iv_dias        TYPE i
        iv_actividades TYPE i
      RETURNING VALUE(rv_mensaje) TYPE string.

     METHODS consultar_reservas
      IMPORTING
        iv_id                TYPE zde_id_reserva_05
      RETURNING VALUE(rt_reservas) TYPE TT_RESERVAS.

      METHODS consultar_n_reservas
      IMPORTING
        iv_n                 TYPE i
      RETURNING VALUE(rt_reservas) TYPE TT_RESERVAS.



  PROTECTED SECTION.
  PRIVATE SECTION.
  DATA mv_nombre      TYPE zde_nombre_cli_05.
    DATA mv_apellido    TYPE zde_apellido_cli_05.
    DATA mv_telefono    TYPE zde_telefono_05.
    DATA mv_dias        TYPE i.
    DATA mv_actividades TYPE i.


ENDCLASS.



CLASS zcl_verano_05 IMPLEMENTATION.

  METHOD constructor.

    mv_nombre = iv_nombre.
    mv_apellido = iv_apellido.
    mv_telefono = iv_telefono.
    mv_dias = iv_dias.
    mv_actividades = iv_actividades.
  ENDMETHOD.


  METHOD calcular_importe.

    rv_importe =   100 + mv_actividades * 25 + mv_dias * 40.

  ENDMETHOD.

  METHOD generar_id_reserva.
    SELECT MAX( id_reserva )
      FROM ztab_verano_05
      INTO @rv_id.
    rv_id = rv_id + 1.
  ENDMETHOD.






  METHOD alta_reserva.

    DATA ls_reserva TYPE ztab_verano_05.

    ls_reserva-client          = sy-mandt.
    ls_reserva-id_reserva      = generar_id_reserva( ).
    ls_reserva-nombre_cliente  = mv_nombre.
    ls_reserva-apellido_cliente = mv_apellido.
    ls_reserva-telefono        = mv_telefono.
    ls_reserva-importe_total   = calcular_importe( ).

    INSERT ztab_verano_05 FROM @ls_reserva.

    IF sy-subrc = 0.
      rv_mensaje = |Reserva creada correctamente con ID { ls_reserva-id_reserva }|.
    ELSE.
      rv_mensaje = 'Error al crear la reserva'.
    ENDIF.
   ENDMETHOD.

   METHOD MODIFICAR_Reserva.

   sELECT SINGLE * FROM ztab_verano_05
      WHERE id_reserva = @iv_id
      INTO @DATA(ls_reserva).

    IF sy-subrc <> 0.
      rv_mensaje = 'Error: no existe ninguna reserva con ese ID'.
      RETURN.
    ENDIF.

    ls_reserva-nombre_cliente   = iv_nombre.
    ls_reserva-apellido_cliente = iv_apellido.
    ls_reserva-telefono         = iv_telefono.
    mv_dias        = iv_dias.
    mv_actividades = iv_actividades.
    ls_reserva-importe_total    = calcular_importe( ).

    UPDATE ztab_verano_05 FROM @ls_reserva.
    IF sy-subrc = 0.
      rv_mensaje = 'Reserva modificada correctamente'.
    ELSE.
      rv_mensaje = 'Error al modificar la reserva'.
    ENDIF.

   ENDMETHOD.




    METHOD consultar_reservas.

   if iv_id = 0 .
      SELECT * FROM ztab_verano_05 INTO TABLE @rt_reservas.
    else.
      SELECT * FROM ztab_verano_05
        WHERE id_reserva = @iv_id
        INTO TABLE @rt_reservas.
    endif.

   ENDMETHOD.



    METHOD consultar_n_reservas.
      SELECT * FROM ztab_verano_05
      ORDER BY id_reserva
       INTO TABLE @rt_reservas
        UP TO @iv_n ROWS.


   ENDMETHOD.




ENDCLASS.
