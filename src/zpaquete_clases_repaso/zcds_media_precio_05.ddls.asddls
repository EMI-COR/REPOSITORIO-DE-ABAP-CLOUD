@AbapCatalog.sqlViewName: 'ZCDS_MEDIA_05B'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'MEDIA POR MONEDA'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_MEDIA_PRECIO_05
  as select from /dmo/flight as Vuelo
  inner join /dmo/carrier as Aero
    on Vuelo.carrier_id = Aero.carrier_id
{ 
    Aero.name          as AerolineaNombre,
    Aero.carrier_id    as NumAerolinea,
//    Vuelo.connection_id  as Conexionvuelo,
//    Vuelo.flight_date    as FechaVuelo,
//    Vuelo.price          as Precio,
    Vuelo.currency_code  as Moneda,
    avg( Vuelo.price as abap.dec(16,2) )     as MediaPrecio,
    max(Vuelo.price) as MaxPrecio,
    min(Vuelo.price) as MinPrecio,
    sum(Vuelo.price) as Suma,
    count (*) as Numvuelos
       
   
}
     group by
     Aero.name,Aero.carrier_id,
     Vuelo.currency_code
     
    
//  cast (vuelo.price as zdecimal_00 ) * cast (0.8 as zdecimal_00) as descuento1,
//   division(
//   Vuelo.price * 80,
//   
//   100,
//   2)as descuento
   
 
 
    

