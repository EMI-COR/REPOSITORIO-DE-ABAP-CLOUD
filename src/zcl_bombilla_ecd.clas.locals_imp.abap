*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS zcl_bombilla_demo_ecd DEFINITION.
  PUBLIC SECTION.

    METHODS:
      constructor,

      set_ubicacion
        IMPORTING
          i_ubicacion TYPE string,

      get_ubicacion
        EXPORTING
          o_ubicacion TYPE string,

      get_estado
        EXPORTING
          o_estado TYPE abap_bool,


      encender
        EXPORTING
          o_valido TYPE abap_bool,

      apagar
        EXPORTING
          o_valido TYPE abap_bool.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA:
      ubicacion TYPE string,
      estado    TYPE abap_boolean.

ENDCLASS.

CLASS  zcl_bombilla_demo_ecd IMPLEMENTATION.

  METHOD constructor.
    "Este es el ÚNICO lugar donde se asigna el valor  inicial.
    ubicacion = 'Salón'.
    estado    = abap_false.
  ENDMETHOD.

  METHOD get_ubicacion.
    o_Ubicacion = ubicacion.
  ENDMETHOD.

  METHOD set_Ubicacion.
    ubicacion = i_Ubicacion.
  ENDMETHOD.

  METHOD get_estado.
    o_estado = Estado.
  ENDMETHOD.

  METHOD encender.
    " Miramos el atributo interno 'estado'
    IF estado = abap_false.
      estado = abap_true.
      o_valido = abap_true. " Operación realizada con éxito
    ELSE.
      o_valido = abap_false. " No se pudo encender porque ya estaba encendida
    ENDIF.
  ENDMETHOD.

  METHOD apagar.
    " Miramos el atributo interno 'estado'
    IF estado = abap_true.
      estado = abap_false.
      o_valido = abap_true. " Operación realizada con éxito
    ELSE.
      o_valido = abap_false. " No se pudo apagar porque ya estaba apagada
    ENDIF.
 ENDMETHOD.

ENDCLASS.
