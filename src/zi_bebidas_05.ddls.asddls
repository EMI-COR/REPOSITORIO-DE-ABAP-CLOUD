@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VISTA BASE RAP PARA BEBIDAS'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_BEBIDAS_05
 as select from zbebidas_05
{


  key codigo as Codigo,
  nombre   as Nombre,  
  tipo       as Tipo,
  origen     as Origen,
  graduacion as Graduacion,
  precio     as Precio
    
}

