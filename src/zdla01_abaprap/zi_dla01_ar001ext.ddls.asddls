@AbapCatalog.sqlViewAppendName: 'ZDLA01AR001EXT'
@EndUserText.label: 'Extension CDS'
extend view ZI_DLA01_ABAPRAP001 with ZI_DLA01_AR001EXT
{
  zdla01_art_001.zstatus
}
