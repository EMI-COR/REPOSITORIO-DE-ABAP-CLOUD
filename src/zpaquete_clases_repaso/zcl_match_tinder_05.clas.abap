CLASS zcl_match_tinder_05 DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA: usuario1    TYPE string,
          usuario2    TYPE string.
    DATA fecha_match TYPE d.
    CONSTANTS max_matches TYPE i VALUE 999.

    METHODS constructor
      IMPORTING
        i_usuario1       TYPE string
        i_usuario2       TYPE string
        i_fecha          TYPE d
        i_compatibilidad TYPE i.

    METHODS es_super_match
      RETURNING VALUE(rv_resultado) TYPE abap_bool.

    METHODS describir_match
      RETURNING VALUE(rv_texto) TYPE string.

    class-mETHODS get_total_matches
  RETURNING VALUE(rv_total) TYPE i.

  PROTECTED SECTION.
    CLASS-DATA gv_total_matches TYPE i.

  PRIVATE SECTION.
    DATA compatibilidad TYPE i.

ENDCLASS.

CLASS zcl_match_tinder_05 IMPLEMENTATION.

  METHOD constructor.
    usuario1         = i_usuario1.
    usuario2         = i_usuario2.
    fecha_match      = i_fecha.
    compatibilidad   = i_compatibilidad.
    gv_total_matches = gv_total_matches + 1.
  ENDMETHOD.

  METHOD es_super_match.
    IF compatibilidad > 80.
      rv_resultado = abap_true.
    ELSE.
      rv_resultado = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD describir_match.
    rv_texto = |Match entre { usuario1 } y { usuario2 } el { fecha_match DATE = USER } — Compatibilidad: { compatibilidad }%|.
  ENDMETHOD.

  METHOD get_total_matches.
    rv_total = gv_total_matches.
  ENDMETHOD.

ENDCLASS.
