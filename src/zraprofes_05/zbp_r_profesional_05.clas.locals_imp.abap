CLASS LHC_ZR_PROFESIONAL_05 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
*  PRIVATE SECTION.
*    METHODS:
*      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
*        IMPORTING
*           REQUEST requested_authorizations FOR ZrProfesional05
*        RESULT result.
*ENDCLASS.
*
*CLASS LHC_ZR_PROFESIONAL_05 IMPLEMENTATION.
*  METHOD GET_GLOBAL_AUTHORIZATIONS.
*  ENDMETHOD.
*ENDCLASS.

PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrProfesional05
        RESULT result,

      subida_sueldo FOR MODIFY
        IMPORTING keys   FOR ACTION ZrProfesional05~subida_sueldo
        RESULT    result.
ENDCLASS.

CLASS lhc_zr_profesional_05 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD subida_sueldo.

    " 1. Leer los registros actuales para obtener el salario
    READ ENTITIES OF zr_profesional_05 IN LOCAL MODE
      ENTITY ZrProfesional05
        FIELDS ( Salario )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_profesionales)
      FAILED failed.

    " 2. Modificar con el salario duplicado
    MODIFY ENTITIES OF zr_profesional_05 IN LOCAL MODE
      ENTITY ZrProfesional05
        UPDATE FIELDS ( Salario )
        WITH VALUE #(
          FOR ls_prof IN lt_profesionales
          (
            %tky    = ls_prof-%tky
            Salario = ls_prof-Salario * 2
          )
        )
      FAILED failed
      REPORTED reported.

*    " 3. Releer para devolver el resultado actualizado a Fiori
*    READ ENTITIES OF zr_profesional_05 IN LOCAL MODE
*      ENTITY ZrProfesional05
*        ALL FIELDS
*        WITH CORRESPONDING #( keys )
*      RESULT DATA(lt_result).

    result = VALUE #(
      FOR ls_prof IN lt_profesionales
      (
        %tky   = ls_prof-%tky
        %param = ls_prof
      )
    ).

  ENDMETHOD.

ENDCLASS.
