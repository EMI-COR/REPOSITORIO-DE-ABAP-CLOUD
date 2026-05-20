CLASS zcl_empleado_05 DEFINITION
  PUBLIC
   CREATE PUBLIC .
"hemos quitado final para que pueda tener hijos
  PUBLIC SECTION.

  DATA: NOMBRE TYPE STRING,
        DNI TYPE STRING,
        SALARIO TYPE I.



        METHODS:
          constructor
            IMPORTING
              i_nombre TYPE string
              i_dni TYPE string
              i_salario TYPE i,

              mostrar_ficha
              exporting o_ficha type string,

              calcula_salario
              returning value(rv_salario) type i.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_empleado_05 IMPLEMENTATION.

  METHOD constructor.
    me->nombre = i_nombre.
    me->dni = i_dni.
    me->salario = i_salario.
  ENDMETHOD.

  METHOD mostrar_ficha.
    o_ficha = |{ me->nombre } { me->dni } { me->salario }|.
  ENDMETHOD.

  METHOD calcula_salario.
    rv_salario = me->salario.
  ENDMETHOD.

ENDCLASS.
