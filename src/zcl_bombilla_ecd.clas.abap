CLASS zcl_bombilla_ecd DEFINITION
"FUNCIONA
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BOMBILLA_ECD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA(lo_bombilla) = NEW zcl_bombilla_demo_ecd( ).

    DATA lv_ubicacion  TYPE string.
    DATA lv_estado TYPE abap_bool.

    lo_bombilla->get_ubicacion( IMPORTING o_ubicacion = lv_ubicacion ).
    lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).

    DATA lv_texto_estado TYPE string.

    " Traducimos el valor booleano (X o vacío)
    IF lv_estado = abap_true.
      lv_texto_estado = 'Encendida'.
    ELSE.
      lv_texto_estado = 'Apagada'.
    ENDIF.

    out->write( | La bombilla se encuentra en el { lv_ubicacion } y está { lv_texto_estado } | ).


    DATA lv_valido TYPE abap_bool.
    lo_bombilla->encender( IMPORTING o_valido = lv_valido ).

    IF lv_valido = abap_true.
      out->write( 'La bombilla se ha encendido correctamente.' ).
    ENDIF.




  ENDMETHOD.
ENDCLASS.
