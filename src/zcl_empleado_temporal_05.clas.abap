CLASS zcl_empleado_temporal_05 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado_05
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA: HORAS_TRABAJADAS TYPE I,
        PRECIO_HORA TYPE I.

  METHODS:

  CONSTRUCTOR
    IMPORTING
      I_NOMBRE TYPE STRING
      I_DNI TYPE STRING
      I_SALARIO TYPE I
      I_HORAS_TRABAJADAS TYPE I
      I_PRECIO_HORA TYPE I,

   calcula_salario REDEFINITION,

   mostrar_ficha  REDEFINITION.





  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EMPLEADO_TEMPORAL_05 IMPLEMENTATION.


 METHOD CONSTRUCTOR."Parámetro del nombre constructor del padre = parametro del constructor del hijo"
    super->constructor( i_nombre = i_nombre
                         i_dni = i_dni
                         i_salario = i_salario ).
    me->horas_trabajadas = i_horas_trabajadas.
    me->precio_hora = i_precio_hora.
    ENDMETHOD.


     METHOD calcula_salario.
       RV_SALARIO = me->salario + ( me->horas_trabajadas * me->precio_hora ) .
     ENDMETHOD.


   METHOD mostrar_ficha.
     o_ficha =  | El empleado temporal { me->nombre } | &&
            | con DNI { me->dni } | &&
            | cobra { me->salario } euros de salario base| &&
            | tiene { me->horas_trabajadas } horas trabajadas | &&
            | cada hora cobra { me->precio_hora } euros | &&
            | su salario total es { me->calcula_salario( ) } euros|.

   ENDMETHOD.
ENDCLASS.
