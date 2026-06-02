CLASS zcl_consola_tinder_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_consola_tinder_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_matches TYPE TABLE OF REF TO zcl_match_tinder_05.

    APPEND NEW zcl_match_tinder_05(
        i_usuario1       = 'Ana'
        i_usuario2       = 'Carlos'
        i_fecha          = '20250527'
        i_compatibilidad = 60
    ) TO lt_matches.

    APPEND NEW zcl_match_superlike_05(
        i_usuario1       = 'Laura'
        i_usuario2       = 'Pedro'
        i_fecha          = '20250527'
        i_compatibilidad = 95
        i_mensaje        = 'Eres increíble ✨'
    ) TO lt_matches.

    LOOP AT lt_matches INTO DATA(lo_match).
      out->write( lo_match->describir_match( ) ).
    ENDLOOP.


    out->write( |Total matches creados: { zcl_match_tinder_05=>get_total_matches( ) }| ).

  ENDMETHOD.

ENDCLASS.
