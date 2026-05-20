@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZMENUSDIARIOS_05'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_MENUSDIARIOS_05
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_MENUSDIARIOS_05
  association [1..1] to ZR_MENUSDIARIOS_05 as _BaseEntity on $projection.IDMENU = _BaseEntity.IDMENU
{
  key IdMenu,
  TipoMenu,
  NombreMenu,
  NumPlatos,
  IsActive,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
