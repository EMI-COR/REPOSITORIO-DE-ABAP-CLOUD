
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VISTA DE CONSUMO RAP BEBIDAS'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo.typeName: 'Bebida'
@UI.headerInfo.typeNamePlural: 'Bebidas'

define root view entity ZC_bebidas_05
as projection on ZI_BEBIDAS_05
{
@UI.selectionField: [{ position: 10 }]
@UI.lineItem: [{ position: 10, label: 'Codigo' }]
key Codigo,
@UI.selectionField: [{ position: 20 }]
@UI.lineItem: [{ position: 20, label: 'Nombre' }]
Nombre,
@UI.selectionField: [{ position: 30 }]
@UI.lineItem: [{ position: 30, label: 'Tipo' }]
Tipo,
@UI.lineItem: [{ position: 40, label: 'Origen' }]
Origen,
@UI.lineItem: [{ position: 50, label: 'Graduacion' }]
Graduacion,
@UI.lineItem: [{ position: 50, label: 'Precio' }]
Precio
}
