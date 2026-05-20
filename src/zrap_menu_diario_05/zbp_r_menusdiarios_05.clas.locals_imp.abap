CLASS LHC_ZR_MENUSDIARIOS_05 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrMenusdiarios05
        RESULT result,
*
      modificar_nombre FOR MODIFY
            IMPORTING keys FOR ACTION ZrMenusdiarios05~modificar_nombre RESULT result.
ENDCLASS.

CLASS LHC_ZR_MENUSDIARIOS_05 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
*

  METHOD modificar_nombre.

    MODIFY ENTITIES OF zr_menusdiarios_05 IN LOCAL MODE
      ENTITY Zrmenusdiarios05
        UPDATE FIELDS ( nombremenu )
        WITH VALUE #(
          FOR key IN keys
          (
            %tky    = key-%tky
          nombremenu = key-%param-nombremenu
          )
        )
      FAILED failed
      REPORTED reported.

      READ ENTITIES OF zr_menusdiarios_05 IN LOCAL MODE
      ENTITY Zrmenusdiarios05
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_menus).

    result = VALUE #(
      FOR ls_prof IN lt_menus
      (
        %tky   = ls_prof-%tky
        %param = ls_prof
      )
    ).



  ENDMETHOD.

ENDCLASS.
