@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vuelo'

define view entity ZCDS_VUELO_05
  as select from /dmo/flight  as vuelos
    join         /dmo/carrier as aerolineas
     on vuelos.carrier_id = aerolineas.carrier_id
{
  key aerolineas.name      as nombre,
   key vuelos.connection_id as conexion,
   key vuelos.flight_date   as fecha
//      vuelos.price         as precio,
//      vuelos.currency_code as monedas
}
