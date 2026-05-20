@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VISTA BASE RAP PILOTOS F1'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_PILOTS_05
  as select from zpilots_05
{
  key dorsal       as Dorsal,
      nombre       as Nombre,
      equipo       as Equipo,
      nacionalidad as Nacionalidad,
      puntos       as Puntos
}

