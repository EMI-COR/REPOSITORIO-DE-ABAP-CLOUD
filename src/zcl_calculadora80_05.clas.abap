CLASS zcl_calculadora80_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:

      constructor
        IMPORTING
          I_valor_actual TYPE i
          I_propietario  TYPE string,

      get_VALOR_ACTUAL
        EXPORTING o_VALOR_ACTUAL TYPE i, "devuelve la informacion

      get_PROPIETARIO
        EXPORTING o_PROPIETARIO TYPE string, "devuelve la informacion

      set_PROPIETARIO
        IMPORTING i_PROPIETARIO TYPE string, "modifica la informacion

      sumar
        IMPORTING i_suma TYPE i,

      resta
        IMPORTING i_RESTA TYPE i,


      DIVidir
        IMPORTING i_DIVIDIR TYPE i,

      multiplicar
        IMPORTING i_MULTIPLICAR TYPE i.


protected SECTION.

PRIVATE SECTION.
  DATA: valor_actual TYPE I,
        propietario TYPE STRING.

ENDCLASS.



CLASS zcl_calculadora80_05 IMPLEMENTATION.

  METHOD constructor.
    valor_actual = I_valor_actual.
    propietario = I_propietario.
  ENDMETHOD.

  METHOD get_VALOR_ACTUAL.
    o_VALOR_ACTUAL = valor_actual.
  ENDMETHOD.

  METHOD get_PROPIETARIO.
    o_PROPIETARIO = propietario.
  ENDMETHOD.

  METHOD set_PROPIETARIO.
    propietario = i_PROPIETARIO.
  ENDMETHOD.

  METHOD sumar.
    valor_actual = valor_actual + i_suma.
  ENDMETHOD.

  METHOD resta.
    valor_actual = valor_actual - i_resta.
  ENDMETHOD.

  METHOD DIVidir.
    IF i_dividir <> 0.
      valor_actual = valor_actual / i_dividir.
    ENDIF.
     ENDMETHOD.

  METHOD multiplicar.
    valor_actual = valor_actual * i_multiplicar.
  ENDMETHOD.



ENDCLASS.
