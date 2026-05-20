@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista consumo RAP Pilotos F1'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo.typeName: 'Piloto'
@UI.headerInfo.typeNamePlural: 'Pilotos'

define root view entity ZC_PILOTS_05
  as projection on ZI_PILOTS_05
{
      @UI.selectionField: [{ position: 10 }]
      @UI.lineItem: [{ position: 10, label: 'Dorsal' }]
  key Dorsal,

      @UI.selectionField: [{ position: 20 }]
      @UI.lineItem: [{ position: 20, label: 'Nombre' }]
      Nombre,

      @UI.selectionField: [{ position: 30 }]
      @UI.lineItem: [{ position: 30, label: 'Equipo' }]
      Equipo,

      @UI.lineItem: [{ position: 40, label: 'Nacionalidad' }]
      Nacionalidad,

      @UI.lineItem: [{ position: 50, label: 'Puntos' }]
      Puntos
}


