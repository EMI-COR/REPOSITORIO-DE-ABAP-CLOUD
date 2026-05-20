@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZMENUSDIARIOS_05'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_MENUSDIARIOS_05
  as select from ZMENUSDIARIOS_05
{
  key id_menu as IdMenu,
  tipo_menu as TipoMenu,
  nombre_menu as NombreMenu,
  num_platos as NumPlatos,
  is_active as IsActive,
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
