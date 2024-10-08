@AbapCatalog.sqlViewName: 'ZVW_TOT_HR_PRJ'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Cubo - Total Horas Projeto'
define view Z_TOTAL_HORAS_PROJETO_CUBE
  as select from zdla01gpt_007
{
  key projeto             as Projeto,
      sum(hours_expected) as HoursExpected
}
group by
  projeto
