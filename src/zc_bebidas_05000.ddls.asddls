@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZBEBIDAS_05'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_BEBIDAS_05000
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_BEBIDAS_05
  association [1..1] to ZR_BEBIDAS_05 as _BaseEntity on $projection.CODIGO = _BaseEntity.CODIGO
{
  key Codigo,
  Nombre,
  Tipo,
  Origen,
  Graduacion,
  Precio,
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
