CLASS zcl_match_superlike_05 DEFINITION
  PUBLIC
  INHERITING FROM zcl_match_tinder_05
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA mensaje_superlike TYPE string.

    METHODS constructor
      IMPORTING
        i_usuario1       TYPE string
        i_usuario2       TYPE string
        i_fecha          TYPE d
        i_compatibilidad TYPE i
        i_mensaje        TYPE string.

    METHODS describir_match REDEFINITION.

ENDCLASS.

CLASS zcl_match_superlike_05 IMPLEMENTATION.

  METHOD constructor.
    super->constructor(
        i_usuario1       = i_usuario1
        i_usuario2       = i_usuario2
        i_fecha          = i_fecha
        i_compatibilidad = i_compatibilidad
    ).
    mensaje_superlike = i_mensaje.
  ENDMETHOD.

  METHOD describir_match.
    DATA(lv_base) = super->describir_match( ).
    rv_texto = |{ lv_base } ⭐ SUPERLIKE: { mensaje_superlike }|.
  ENDMETHOD.

ENDCLASS.
