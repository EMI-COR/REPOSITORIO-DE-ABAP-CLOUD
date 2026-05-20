CLASS zcl_dw_test_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DW_TEST_05 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

    DATA(lo_mgr) = NEW zcl_dw_manager_05( ).


*
*" ---------------------------------------------------------------
*" LIMPIEZA
*" ---------------------------------------------------------------
*DELETE FROM zdw_valora_05.
*DELETE FROM zdw_servicio_05.
*DELETE FROM zdw_paseador_05.
*DELETE FROM zdw_perro_05.
*DELETE FROM zdw_dueno_05.
**
**" ---------------------------------------------------------------
**" DUEÑOS
**" ---------------------------------------------------------------
*INSERT zdw_dueno_05 FROM TABLE @( VALUE #(
*  ( client = sy-mandt  id_dueno = '000001'
*    nombre = 'Carlos'   apellidos = 'García López'
*    telefono = '600111222'  email = 'carlos@email.com'
*    direccion = 'Calle Mayor 1, Sevilla' )
*  ( client = sy-mandt  id_dueno = '000002'
*    nombre = 'María'    apellidos = 'Fernández Ruiz'
*    telefono = '611222333'  email = 'maria@email.com'
*    direccion = 'Avenida Sur 45, Sevilla' )
*  ( client = sy-mandt  id_dueno = '000003'
*    nombre = 'Pedro'    apellidos = 'Martínez Sánchez'
*    telefono = '622333444'  email = 'pedro@email.com'
*    direccion = 'Plaza España 3, Sevilla' )
*) ).
*out->write( |Dueños: { sy-dbcnt }| ).
*
**" ---------------------------------------------------------------
**" PERROS
**" ---------------------------------------------------------------
*INSERT zdw_perro_05 FROM TABLE @( VALUE #(
*  ( client = sy-mandt  id_perro = '000001'
*    nombre = 'Rex'      raza = 'Pastor Alemán'
*    tamano = 'G'        fecha_nacimiento = '20200315'
*    notas_medicas = 'Alérgico a la penicilina'
*    id_dueno = '000001' )
*  ( client = sy-mandt  id_perro = '000002'
*    nombre = 'Luna'     raza = 'Labrador'
*    tamano = 'G'        fecha_nacimiento = '20210608'
*    notas_medicas = 'Sin alergias conocidas'
*    id_dueno = '000001' )
*  ( client = sy-mandt  id_perro = '000003'
*    nombre = 'Coco'     raza = 'Chihuahua'
*    tamano = 'P'        fecha_nacimiento = '20190920'
*    notas_medicas = 'Revisión cardíaca anual'
*    id_dueno = '000002' )
*  ( client = sy-mandt  id_perro = '000004'
*    nombre = 'Toby'     raza = 'Beagle'
*    tamano = 'M'        fecha_nacimiento = '20220101'
*    notas_medicas = ''
*    id_dueno = '000003' )
*) ).
*out->write( |Perros: { sy-dbcnt }| ).
*
**" ---------------------------------------------------------------
**" PASEADORES
**" ---------------------------------------------------------------
*INSERT zdw_paseador_05 FROM TABLE @( VALUE #(
*  ( client = sy-mandt  id_paseador = '000001'
*    nombre = 'Ana'      apellidos = 'Romero Díaz'
*    telefono = '633444555'  email = 'ana@paseos.com'
*    zona_cobertura = 'Triana, Nervión'
*    tarifa_hora = '12.50'   disponible = 'X' )
*  ( client = sy-mandt  id_paseador = '000002'
*    nombre = 'Luis'     apellidos = 'Torres Vega'
*    telefono = '644555666'  email = 'luis@paseos.com'
*    zona_cobertura = 'Macarena, Alameda'
*    tarifa_hora = '10.00'   disponible = 'X' )
*  ( client = sy-mandt  id_paseador = '000003'
*    nombre = 'Sara'     apellidos = 'Molina Reyes'
*    telefono = '655666777'  email = 'sara@paseos.com'
*    zona_cobertura = 'Los Remedios, Bellavista'
*    tarifa_hora = '15.00'   disponible = ' ' )
*) ).
*out->write( |Paseadores: { sy-dbcnt }| ).
*
**" ---------------------------------------------------------------
**" SERVICIOS
**" ---------------------------------------------------------------
*INSERT zdw_servicio_05 FROM TABLE @( VALUE #(
*  ( client = sy-mandt  id_servicio = '00000001'
*    id_paseador = '000001'  id_perro = '000001'
*    fecha_inicio = '20260501'  hora_inicio = '090000'
*    fecha_fin    = '20260501'  hora_fin    = '100000'
*    estado = 'CO'  tipo_servicio = 'PA'
*    precio_total = '12.50'
*    observaciones = 'Paseo por el parque sin incidencias' )
*  ( client = sy-mandt  id_servicio = '00000002'
*    id_paseador = '000001'  id_perro = '000002'
*    fecha_inicio = '20260502'  hora_inicio = '100000'
*    fecha_fin    = '20260502'  hora_fin    = '110000'
*    estado = 'CO'  tipo_servicio = 'PA'
*    precio_total = '12.50'
*    observaciones = '' )
*  ( client = sy-mandt  id_servicio = '00000003'
*    id_paseador = '000002'  id_perro = '000003'
*    fecha_inicio = '20260503'  hora_inicio = '080000'
*    fecha_fin    = '20260503'  hora_fin    = '090000'
*    estado = 'AC'  tipo_servicio = 'PA'
*    precio_total = '10.00'
*    observaciones = 'Perro nervioso, evitar perros grandes' )
*  ( client = sy-mandt  id_servicio = '00000004'
*    id_paseador = '000002'  id_perro = '000004'
*    fecha_inicio = '20260510'  hora_inicio = '170000'
*    fecha_fin    = '20260510'  hora_fin    = '180000'
*    estado = 'PE'  tipo_servicio = 'PA'
*    precio_total = '10.00'
*    observaciones = '' )
*  ( client = sy-mandt  id_servicio = '00000005'
*    id_paseador = '000001'  id_perro = '000001'
*    fecha_inicio = '20260501'  hora_inicio = '090000'
*    fecha_fin    = '20260503'  hora_fin    = '090000'
*    estado = 'CO'  tipo_servicio = 'GU'
*    precio_total = '75.00'
*    observaciones = 'Guardería fin de semana' )
*) ).
*out->write( |Servicios: { sy-dbcnt }| ).
*
**" ---------------------------------------------------------------
**" VALORACIONES
**" ---------------------------------------------------------------
*INSERT zdw_valora_05 FROM TABLE @( VALUE #(
*  ( client = sy-mandt  id_valoracion = '00000001'
*    id_servicio = '00000001'
*    puntuacion = 5
*    comentario = 'Excelente servicio, muy puntual'
*    fecha = '20260501' )
*  ( client = sy-mandt  id_valoracion = '00000002'
*    id_servicio = '00000002'
*    puntuacion = 4
*    comentario = 'Muy bien, repetiré'
*    fecha = '20260502' )
*  ( client = sy-mandt  id_valoracion = '00000003'
*    id_servicio = '00000005'
*    puntuacion = 5
*    comentario = 'La guardería perfecta, el perro volvió feliz'
*    fecha = '20260503' )
*) ).
*out->write( |Valoraciones: { sy-dbcnt }| ).








    " ── Caso A — create_perro con id_dueno inexistente ───────

    out->write( '=== Caso A: perro con dueño inexistente ===' ).
    DATA(lv_ok) = lo_mgr->create_perro(
      VALUE #( id_perro = '000099'
               id_dueno = '999999'
               nombre   = 'Fantasma'
               tamano   = 'M' ) ).
    out->write( COND #( WHEN lv_ok = abap_false
                        THEN 'CORRECTO — rechazado, dueño no existe (abap_false)'
                        ELSE 'ERROR — debería haber fallado' ) ).

    " ── Caso B — create_perro con id_dueno válido ────────────
    " Dueño '000001' (Carlos) existe en la tabla

    out->write( '=== Caso B: perro con dueño válido ===' ).

    lv_ok = lo_mgr->create_perro(
      VALUE #( id_perro = '000099'
               id_dueno = '000001'
               nombre   = 'Nuevo'
               tamano   = 'P' ) ).
    out->write( COND #( WHEN lv_ok = abap_true
                        THEN 'CORRECTO — perro insertado correctamente (abap_true)'
                        ELSE 'ERROR — debería haber tenido éxito' ) ).





    " ── Caso C — valoración sobre servicio en estado AC ──────
    " Servicio '00000003' tiene estado AC

    out->write( '=== Caso C: valoración sobre servicio en estado AC ===' ).

    lv_ok = lo_mgr->create_valoracion(
      VALUE #( id_valoracion = '00000099'
               id_servicio   = '00000003'
               puntuacion    = 4
               comentario    = 'Prueba'
             fecha         = sy-datum ) ).
    out->write( COND #( WHEN lv_ok = abap_false
                        THEN 'CORRECTO — rechazado, servicio no está CO (abap_false)'
                        ELSE 'ERROR — no debería aceptar servicio en AC' ) ).

    " ── Caso D — valoración dos veces sobre el mismo servicio
    " Servicio '00000001' está CO y ya tiene valoración en tabla


    out->write( '=== Caso D: doble valoración sobre mismo servicio ===' ).
    lv_ok = lo_mgr->create_valoracion(
      VALUE #( id_valoracion = '00000097'
               id_servicio   = '00000001'
               puntuacion    = 3
               comentario    = 'Intento duplicado'
               fecha         = sy-datum ) ).
    out->write( COND #( WHEN lv_ok = abap_false
                        THEN '  CORRECTO — rechazada, ya existe valoración (abap_false)'
                        ELSE '  ERROR — no debería aceptar duplicado' ) ).
    lv_ok = lo_mgr->create_valoracion(
      VALUE #( id_valoracion = '00000098'
               id_servicio   = '00000001'
               puntuacion    = 5
               comentario    = 'Segundo intento'
               fecha         = sy-datum ) ).
    out->write( COND #( WHEN lv_ok = abap_false
                        THEN '  CORRECTO — rechazada también la segunda (abap_false)'
                        ELSE '  ERROR — no debería aceptar duplicado' ) ).

    " ── Caso E — puntuación 7 (fuera de rango) ───────────────
    " Creamos un servicio CO nuevo sin valoración para aislar el caso

    lo_mgr->create_servicio(
      VALUE #( id_servicio   = '00000090'
               id_paseador   = '000001'
               id_perro      = '000001'
               fecha_inicio  = '20260601'
               fecha_fin     = '20260601'
               estado        = 'CO'
               tipo_servicio = 'PA'
               precio_total  = '12.50' ) ).


  lo_mgr->create_servicio(
      VALUE #( id_servicio   = '00000091'
               id_paseador   = '000001'
               id_perro      = '000001'
               fecha_inicio  = '20260601'
               fecha_fin     = '20260601'
               estado        = 'CO'
               tipo_servicio = 'PA'
               precio_total  = '12.50' ) ).


    out->write( '=== Caso E: puntuación 7 (fuera de rango 1-5) ===' ).


    lv_ok = lo_mgr->create_valoracion(
      VALUE #( id_valoracion = '00000096'
               id_servicio   = '00000090'
               puntuacion    = 7
               comentario    = 'Puntuación inválida'
               fecha         = sy-datum ) ).
    out->write( COND #( WHEN lv_ok = abap_false
                        THEN 'CORRECTO — rechazada por puntuación > 5 (abap_false)'
                        ELSE 'ERROR — 7 está fuera del rango permitido' ) ).

    " ── Caso F — media valoraciones paseador '000001' (Ana) ──
    " Servicios CO valorados: 00000001=5, 00000002=4, 00000005=5
    " Media esperada = ( 5 + 4 + 5 ) / 3 = 4.67

    out->write( '=== Caso F: media valoraciones paseador 000001 (Ana) ===' ).

    DATA(lv_media) = lo_mgr->get_media_valoracion_paseador( '000001' ).
    out->write( |Media calculada: { lv_media }| ).
    out->write( COND #( WHEN lv_media > 4 AND lv_media < 5
                        THEN 'CORRECTO — media 4.67 como se esperaba'
                        ELSE |Resultado: { lv_media } — verificar datos| ) ).





  ENDMETHOD.
ENDCLASS.
