CLASS zcl_cuadro_05 DEFINITION

*Crea una clase local lcl_cuadro que represente un cuadro de un museo.
*
*Atributos privados
*Solo dos:
*
*El título de la obra (texto)
*El año de creación (número entero)
*
*
*Métodos públicos
*Los dos GET — para consultar el título y el año de creación.
*Los dos SET — para modificar el título y el año, por si el museo necesita corregir un error en el catálogo.
*Dos métodos de operación:
*
*esta_en_exposicion — devuelve un valor lógico (abap_bool) indicando si el cuadro está actualmente expuesto al público. Un cuadro está en exposición si su año de creación es posterior a 1800.
*mostrar_ficha — muestra por consola la información completa del cuadro, incluyendo si está en exposición o en los almacenes del museo.
*
*
*Programa princip…
*[9:35, 28/4/2026] Formador ABAP: Otra pinta
*
*En el MAIN, ten un DATA lv_mensaje que cuando este almacenado ponga "ALMACENADO" y eso es
**********************************************************************


*clase que define lo que hace el objeto o sea el cuadro


  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
    constructor
        IMPORTING
          i_titulo TYPE string "parametros
          i_ano_creacion TYPE I,


      get_titulo
        EXPORTING o_titulo TYPE string, "devuelve la informacion

      get_ano_creacion
        EXPORTING o_ano_creacion TYPE i,

      set_titulo  " modifica la informacion
        IMPORTING
          i_titulo TYPE string ,

      set_ano_creacion
        IMPORTING
          i_ano_creacion TYPE I,

      esta_en_exposicion
        EXPORTING o_exposicion TYPE abap_bool,

*       esta_en_exposicion returning value (rv_result)
*       TYPE abap_bool,_result) type abap_bool


      mostrar_ficha
        EXPORTING o_ficha TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

  DATA TITULO  TYPE STRING. "atributos
  DATA ANO_CREACION TYPE I.



ENDCLASS.



CLASS ZCL_CUADRO_05 IMPLEMENTATION.


  METHOD constructor.
    TITULO = i_titulo. "atributos = parametros del costructor.
    ANO_CREACION = i_ano_creacion.
  ENDMETHOD.


  METHOD GET_ANO_CREACION."devuelve la informacion que hay en el atributo y lo pasamos al parametro o_ano_creacion
    O_ANO_CREACION = ANO_CREACION.
  ENDMETHOD.


  METHOD GET_TITULO. "devuelve la informacion que hay en el atributo y lo pasamos al parametro o_titulo
    O_TITULO = TITULO.
  ENDMETHOD.


  METHOD SET_TITULO. " cogemos el valor de entrada y lo pasamos al atributo o sea le cambiamos ael valor al atributo titulo conlo que viene de entrada
    TITULO = I_TITULO.
  ENDMETHOD.


  METHOD mostrar_ficha.

    DATA lv_estado TYPE string.

    IF ANO_CREACION > 1800.
      lv_estado = 'En exposición'.
    ELSE.
      lv_estado = 'Almacenado'.
    ENDIF.
    o_ficha = | Titulo: { titulo } / Año: { ANO_CREACION } / { lv_estado } |.
  ENDMETHOD.


  METHOD SET_ANO_CREACION.
    ANO_CREACION = I_ANO_CREACION.
  ENDMETHOD.


   METHOD ESTA_EN_EXPOSICION.
    IF ANO_CREACION > 1800.
      O_EXPOSICION = ABAP_TRUE.
    ELSE.
      O_EXPOSICION = ABAP_FALSE.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
