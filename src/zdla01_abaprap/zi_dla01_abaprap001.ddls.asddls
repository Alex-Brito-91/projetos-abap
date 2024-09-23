@AbapCatalog.sqlViewName: 'ZDLA01ARVW001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extensões CDS'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_DLA01_ABAPRAP001
  as select from zdla01_art_001
{
  carrier_id as CarrierId
}
