CLASS zcl_calc_ecd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calc_ecd IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lv_num1 TYPE p DECIMALS 2.
    DATA lv_num2 TYPE p DECIMALS 2.
    DATA lv_resul TYPE p DECIMALS 2.
    DATA lv_tipo_oper TYPE c LENGTH 1.

    lv_num1 = 20.
    lv_num2 = 3.
    lv_tipo_oper = '/'.

    CASE lv_tipo_oper.

      WHEN '+'.

        lv_resul = lv_num1 + lv_num2.
        out->write( |'Suma' { lv_resul } | ).

      WHEN '-'.

        lv_resul = lv_num1 - lv_num2.
        out->write( |'Resta' { lv_resul } | ).
      WHEN '*'.

        lv_resul = lv_num1 * lv_num2.
        out->write( |'Multiplicación' { lv_resul } | ).
      WHEN '/'.
        TRY.
            lv_resul = lv_num1 / lv_num2.
             out->write( |'Divisón' { lv_resul } | ).
          CATCH cx_sy_zerodivide.

            out->write( 'No se puede dividir por cero' ).

        ENDTRY.
      WHEN OTHERS.

        out->write( 'Operación no permitida' ).

    ENDCASE.

  ENDMETHOD.

ENDCLASS.
