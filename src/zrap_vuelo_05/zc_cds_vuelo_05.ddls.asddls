@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Vuelo'
}
define view entity ZC_CDS_VUELO_05
  as select from ZCDS_VUELO_05
  association [1..1] to ZCDS_VUELO_05 as _BaseEntity on $projection.NOMBRE = _BaseEntity.NOMBRE and $projection.CONEXION = _BaseEntity.CONEXION and $projection.FECHA = _BaseEntity.FECHA
{
  @Endusertext: {
    Label: 'Airline Name', 
    Quickinfo: 'Flight Reference Scenario: Carrier Name'
  }
  key nombre,
  @Endusertext: {
    Label: 'Flight Number', 
    Quickinfo: 'Flight Reference Scenario: Connection ID'
  }
  key conexion,
  @Endusertext: {
    Label: 'Flight Date', 
    Quickinfo: 'Flight Reference Scenario: Flight Date'
  }
  key fecha,
  _BaseEntity
}
