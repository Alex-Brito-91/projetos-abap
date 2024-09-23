@AbapCatalog.sqlViewName: 'ZC_DLPM_PROJECTS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Consumer - Projetos'
define view ZCDLA01GP_PROJECTS
  as select from ZIDLA01GP_PROJECT as zp
  association [1..1] to zdla01gpt_001 as _zt001 on zp.Setor = _zt001.setor
{
      @UI: {selectionField: [{ position: 10 }],
            lineItem: [{ position: 10, label: 'ID' }] }
  key zp.Id,
      @UI: {selectionField: [{ position: 20 }],
            lineItem: [{ position: 20, label: 'Título' }] }
      zp.Titulo,
      @UI: {lineItem: [{ position: 30, label: 'Descrição' }] }
      zp.Descricao,
      @UI: {selectionField: [{ position: 30 }],
            lineItem: [{ position: 40, label: 'Módulo' }] }
      zp.Modulo,
      @UI: {selectionField: [{ position: 40 }],
            lineItem: [{ position: 50, label: 'Setor' }] }
      @ObjectModel.text.element: [ 'SetorText' ]
      zp.Setor,
      zp.SetorText,      
      @UI: {selectionField: [{ position: 50 }],
            lineItem: [{ position: 60, label: 'Equipe' }] }
      @ObjectModel.text.element: [ 'EquipeText' ]
      @UI.textArrangement: #TEXT_ONLY
      zp.Equipe,
      zp.EquipeText,
      zp.Responsavel,
      zp.DataInicio,
      zp.DataFim,
      zp.DataFimReal,
      zp.CriadoPor,
      zp.CriadoEm,
      zp.ModificadoPor,
      zp.ModificadoEm,
      
      /* Associations */
      _zt001,
      _zt004
}
