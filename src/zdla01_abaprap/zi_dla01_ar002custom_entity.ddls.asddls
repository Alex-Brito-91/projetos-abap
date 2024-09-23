@EndUserText.label: 'CDS - Custom Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZDLA01_ARCL_002'
define custom entity ZI_DLA01_AR002CUSTOM_ENTITY
{
  @UI.selectionField: [{position: 10}]
  @UI.lineItem: [{position: 10}]
  @EndUserText.label: 'Companhia Aérea'
  key carrier_id    : /dmo/carrier_id;
  
  @UI.selectionField: [{position: 20}]
  @UI.lineItem: [{position: 20}]
  @EndUserText.label: 'Conexão'
  key connection_id : /dmo/connection_id;
  
  @UI.selectionField: [{position: 30}]
  @UI.lineItem: [{position: 30}]
  @EndUserText.label: 'Data Vôo'
  key flight_date   : /dmo/flight_date;
}
