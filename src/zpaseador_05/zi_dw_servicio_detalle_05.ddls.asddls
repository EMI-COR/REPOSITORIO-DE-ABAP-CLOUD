@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Servicios con detalle completo'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_DW_SERVICIO_DETALLE_05
  as select from zdw_servicio_05 as serv
  inner join zdw_perro_05 as perro
    on  serv.id_perro = perro.id_perro

  association [1..1] to zdw_paseador_05   as paseador   
    on serv.id_paseador = paseador.id_paseador

//  association [1..1] to zdw_perro      as perro      
//    on serv.id_perro = perro.id_perro

  association [0..1] to zdw_dueno_05      as dueno      
    on perro.id_dueno = dueno.id_dueno

  association [0..1] to zdw_valora_05 as valoracion 
    on serv.id_servicio = valoracion.id_servicio

{
  key serv.id_servicio      as id_servicio,
      paseador.nombre       as nombre_paseador,
      perro.nombre          as nombre_perro,
      serv.tipo_servicio    as tipo_servicio,
      dueno.nombre          as nombre_dueno,
      valoracion.puntuacion as valoracion
}
