INTERFACE zif_swipeable_05
  PUBLIC .

    METHODS hacer_swipe
    IMPORTING iv_direccion     TYPE string
    RETURNING VALUE(rv_resultado) TYPE string.

ENDINTERFACE.
