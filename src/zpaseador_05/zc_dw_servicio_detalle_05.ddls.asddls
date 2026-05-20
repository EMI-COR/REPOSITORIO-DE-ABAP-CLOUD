@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Servicios con detalle completo'
}
define view entity ZC_DW_SERVICIO_DETALLE_05
  as select from ZI_DW_SERVICIO_DETALLE_05
  association [1..1] to ZI_DW_SERVICIO_DETALLE_05 as _BaseEntity on $projection.ID_SERVICIO = _BaseEntity.ID_SERVICIO
{
  key id_servicio,
  nombre_paseador,
  nombre_perro,
  @Endusertext: {
    Label: 'Tipo de Servicio', 
    Quickinfo: 'Tipo de Servicio'
  }
  tipo_servicio,
  nombre_dueno,
  valoracion,
  _BaseEntity
}
