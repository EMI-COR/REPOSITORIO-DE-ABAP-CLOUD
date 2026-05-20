@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZBEBIDAS_05'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_BEBIDAS_05
  as select from ZBEBIDAS_05
{
  key codigo as Codigo,
  nombre as Nombre,
  tipo as Tipo,
  origen as Origen,
  graduacion as Graduacion,
  precio as Precio,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
