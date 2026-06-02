CLASS lhc_libro DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_global_authorizations
      FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZrLibLibro05
      RESULT result.
    METHODS validar_paginas
      FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZrLibLibro05~validar_paginas.
      METHODS calcular_estado
  FOR DETERMINE ON MODIFY
  IMPORTING keys FOR ZrLibLibro05~calcular_estado.
ENDCLASS.
CLASS lhc_libro IMPLEMENTATION.
  METHOD validar_paginas.

  READ ENTITIES OF zr_lib_libro_05 IN LOCAL MODE
    ENTITY ZrLibLibro05
      FIELDS ( NumPaginas )
      WITH CORRESPONDING #( keys )
    RESULT DATA(lt_libros).

  LOOP AT lt_libros INTO DATA(ls_libro).
    IF ls_libro-NumPaginas < 10.

      APPEND VALUE #( %tky = ls_libro-%tky ) TO failed-ZrLibLibro05.

      APPEND VALUE #( %tky = ls_libro-%tky
                      %msg = new_message_with_text(
                               severity = if_abap_behv_message=>severity-error
                               text     = 'El libro debe tener al menos 10 páginas' )
                    ) TO reported-ZrLibLibro05.
    ENDIF.
  ENDLOOP.

ENDMETHOD.
METHOD calcular_estado.

  READ ENTITIES OF zr_lib_libro_05 IN LOCAL MODE
    ENTITY ZrLibLibro05
      FIELDS ( NumPaginas )
      WITH CORRESPONDING #( keys )
    RESULT DATA(lt_libros).

  LOOP AT lt_libros INTO DATA(ls_libro).

   DATA(lv_estado) = COND #(
                    WHEN ls_libro-NumPaginas < 50  THEN 'Muy deteriorado'
                    WHEN ls_libro-NumPaginas < 150 THEN 'Deteriorado'
                    WHEN ls_libro-NumPaginas < 400 THEN 'Bueno'
                    ELSE 'Nuevo' ).

    MODIFY ENTITIES OF zr_lib_libro_05 IN LOCAL MODE
      ENTITY ZrLibLibro05
        UPDATE FIELDS ( Estado )
        WITH VALUE #( ( %tky         = ls_libro-%tky
                        Estado       = lv_estado
                        %control-Estado = if_abap_behv=>mk-on ) ).

  ENDLOOP.

ENDMETHOD.




METHOD get_global_authorizations.
ENDMETHOD.
ENDCLASS.
