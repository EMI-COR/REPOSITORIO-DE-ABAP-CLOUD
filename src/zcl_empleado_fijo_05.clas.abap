CLASS zcl_empleado_fijo_05 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado_05
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA ANTIGUEDAD TYPE I.

  METHODS:
   constructor
    IMPORTING
      I_NOMBRE TYPE STRING
      I_DNI TYPE STRING
      I_SALARIO TYPE I
      I_ANTIGUEDAD TYPE I,

      mostrar_ficha  REDEFINITION,

      calcula_salario REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EMPLEADO_FIJO_05 IMPLEMENTATION.


 METHOD  CONSTRUCTOR.
 super->constructor( i_nombre = i_nombre
                         i_dni = i_dni
                         i_salario = i_salario ).
                         me->antiguedad = i_antiguedad.

  ENDMETHOD.


  METHOD calcula_salario.
    rv_salario = me->salario + ( me->antiguedad * 50 ).
  ENDMETHOD.


  method mostrar_ficha.
    "LuisCa
    o_ficha = | El empleado fijo { me->nombre } | &&
              | con DNI { me->dni } | &&
             | cobra { me->salario } euros de salario base| &&
             | tiene { me->antiguedad } años de antigüedad | &&
             | su salario total es { me->calcula_salario( ) } euros|.
  ENDMETHOD.
ENDCLASS.
