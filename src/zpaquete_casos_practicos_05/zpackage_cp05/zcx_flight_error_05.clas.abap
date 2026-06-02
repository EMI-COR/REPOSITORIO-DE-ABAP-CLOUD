CLASS zcx_flight_error_05 DEFINITION
  PUBLIC
  FINAL
  INHERITING FROM cx_static_check.

  PUBLIC SECTION.

    DATA mv_mensaje TYPE string READ-ONLY.

    METHODS constructor
      IMPORTING
        iv_mensaje TYPE string.

ENDCLASS.


CLASS zcx_flight_error_05 IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( ).
    mv_mensaje = iv_mensaje.
  ENDMETHOD.


ENDCLASS.
