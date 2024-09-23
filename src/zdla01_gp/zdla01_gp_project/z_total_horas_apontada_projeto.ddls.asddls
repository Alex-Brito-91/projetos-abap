@AbapCatalog.sqlViewName: 'ZVW_T_HR_AP_PRJ'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Cubo - Total Horas Apontadas Projeto'
define view Z_TOTAL_HORAS_APONTADA_PROJETO
  as select from zdla01gpt_007 as z007
    join         zdla01gpt_009 as z009 on z007.id = z009.ticket
{
  z007.projeto    as Projeto,
  sum(z009.horas) as HorasApontadas
}
where
  z009.aprovacao = 'A'
group by
  z007.projeto
