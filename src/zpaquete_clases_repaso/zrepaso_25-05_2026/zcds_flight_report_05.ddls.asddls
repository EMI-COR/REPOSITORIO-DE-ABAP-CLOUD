@AbapCatalog.sqlViewName: 'ZCDS_REPORT_05B'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vuelos con aerolínea y conexión'
@Metadata.ignorePropagatedAnnotations: true
 
    define view ZCDS_FLIGHT_REPORT_05
       as select from /dmo/flight as Vuelo
  inner join /dmo/carrier as Aero
    on Vuelo.carrier_id = Aero.carrier_id
  inner join /dmo/connection as Conesion
    on  Vuelo.carrier_id    = Conesion.carrier_id
    and Vuelo.connection_id = Conesion.connection_id
   
     
{

    key Vuelo.carrier_id       as Aerolinea,
    key Vuelo.connection_id    as Conection,
    key Vuelo.flight_date      as FechaVuelo,
    

    Aero.name                  as NombreAerolinea,
    Conesion.airport_from_id   as AeropuertoSalida,
    Conesion.airport_to_id     as AeropuertoLlegada,
    Conesion.departure_time    as HoraSalida,
    Conesion.arrival_time      as HoraLlegada,
    Vuelo.price                as PrecioVuelo,
    Vuelo.currency_code        as Moneda,
    division( Vuelo.price * 20, 100, 2 ) as Descuento,
    division( Vuelo.price * 80, 100, 2 ) as PrecioFinal,
   concat( concat( Conesion.airport_from_id, ' -> ' ), Conesion.airport_to_id )  as Ruta
   
    
    
    
} 
where Vuelo.price > 0 and
Vuelo.currency_code <> ''
