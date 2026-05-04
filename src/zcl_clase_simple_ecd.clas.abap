*CLASS zcl_clase_simple_ecd DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC .
*
*  PUBLIC SECTION.
*
*    INTERFACES if_oo_adt_classrun .
*
*    DATA mv_numero TYPE i.
*
*    METHODS: leer EXPORTING o_numero TYPE i,
*      "recupera el valor del atributo y lo asigna a un paramentro
*
*      escribir IMPORTING i_numero TYPE i.
*    "asigna al atributo el valor del parametro
*
*
*PROTECTED SECTION.
*
*  PRIVATE SECTION.
*ENDCLASS.
*
*CLASS zcl_clase_simple_ecd IMPLEMENTATION.
*
* METHOD leer .
*    " parametro = atributo
*    o_numero = mv_numero.
*  ENDMETHOD.
*
*  METHOD escribir .
*    " atributo = parametro
*    mv_numero = i_numero.
*  ENDMETHOD.
*
*  METHOD if_oo_adt_classrun~main.
*
*   DATA lv_numero TYPE i.
*    DATA lo_numero TYPE REF TO zcl_clase_simple_ecd.
*
*    CREATE OBJECT lo_numero.
*
*    lo_numero->escribir( EXPORTING i_numero = 20 ).
*    out->write( lo_numero->mv_numero ).
*
*    lo_numero->leer( IMPORTING o_numero = lv_numero ).
*    out->write( lv_numero ).
*
*
*   endmethod.
*ENDCLASS.



"corregido segun la ia



CLASS zcl_clase_simple_ecd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

    DATA mv_numero TYPE i.

    METHODS: leer     EXPORTING o_numero TYPE i,
             escribir IMPORTING i_numero TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_clase_simple_ecd IMPLEMENTATION.

  METHOD leer.
    o_numero = mv_numero.
  ENDMETHOD.

  METHOD escribir.
    mv_numero = i_numero.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    DATA lv_numero TYPE i.

    "✓ NEW en vez de CREATE OBJECT
    DATA(lo_numero) = NEW zcl_clase_simple_ecd( ).

    "✓ Sin EXPORTING al llamar
    lo_numero->escribir( i_numero = 20 ).
    out->write( lo_numero->mv_numero ).

    lo_numero->leer( IMPORTING o_numero = lv_numero ).
    out->write( lv_numero ).

  ENDMETHOD.  "✓ Mayúsculas

ENDCLASS.
"Pulsa F9 en Eclipse y verás 20 dos veces en la consola. ¿Seguimos con el siguiente ejercicio?Sonnet 4.6

