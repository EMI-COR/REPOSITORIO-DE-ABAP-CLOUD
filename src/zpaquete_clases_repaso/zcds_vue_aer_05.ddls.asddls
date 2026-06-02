@AbapCatalog.sqlViewName: 'ZCDS_VUE_AER_05V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista vuelos con nombre aerolínea'
@Metadata.ignorePropagatedAnnotations: true

define view ZCDS_VUE_AER_05
  as select from /dmo/flight as Vuelo
  inner join /dmo/carrier as Aero
    on Vuelo.carrier_id = Aero.carrier_id

{
    Aero.name          as AerolineaNombre,
    Vuelo.connection_id  as Conexionvuelo,
    Vuelo.flight_date    as FechaVuelo,
    Vuelo.price          as Precio,
    Vuelo.currency_code  as Moneda,
   division(
   Vuelo.price * 80,
   
   100,
   2)as descuento
   
}
          
  

  
  
    
