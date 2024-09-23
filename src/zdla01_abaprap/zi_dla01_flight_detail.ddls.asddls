@AbapCatalog.sqlViewName: 'ZI_DLA01_FLI_D'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP - Voos'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_DLA01_Flight_Detail
//  with parameters
//    P_CurrencyCode :abap.cuky( 5 )
  as select from ZI_DLA01_Flight

  association [1..1] to /DMO/I_Carrier    as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection as _Connection on  $projection.ConnectionId = _Connection.ConnectionID
                                                         and $projection.CarrierId    = _Connection.AirlineID

{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @Semantics.currencyCode: true
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied,
      _Carrier.Name,

      case
        when SeatsMax < 260 then 'Small'
        when SeatsMax >= 260 and SeatsMax < 300 then 'Medium'
        else 'Big' end as SizeFlight,

//      case
//        when CurrencyCode = :P_CurrencyCode then 'X'
//        else '' end    as IsEqual,
        
      @ObjectModel.virtualElement: true
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZDLA01_ARCL_001'
      cast('' as langt) as DayOfWeek,

      _Carrier,
      _Connection,
      _Currency
}
where
      FlightDate   <= $session.system_date
//  and CurrencyCode = :P_CurrencyCode
