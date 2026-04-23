CLASS zcl_primera_clase_ecd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_primera_clase_ecd IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*  data lv_numero type i.
*   DATA lv_par TYPE i.

*   lv_numero = 5.

*    lv_par = lv_numero mod 2.
*
*
*    IF lv_par = 0.
*      out->write( 'par' ).
*    ELSE.
*      out->( 'impar' ).
*    ENDIF.

    DATA lv_numero TYPE i.

    DATA  lv_contador TYPE i.

    lv_contador = 0.
    lv_numero = 8 .

    out->write( 'el número inicial es' ).
    out->write( lv_numero ).

    WHILE lv_numero >= 2.

      lv_contador = lv_contador + 1.

      lv_numero = lv_numero - 2.

      out->write( | En iteración { lv_contador } El número es { lv_numero } | ) .

    ENDWHILE.


    IF lv_numero = 0.
      out->write( 'par' ).
    ELSE.
      out->write( 'impar' ).
    ENDIF.
  ENDMETHOD.


ENDCLASS.




