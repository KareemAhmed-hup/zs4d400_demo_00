@AbapCatalog.viewEnhancementCategory: [#NONE] 
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo'
@Metadata.ignorePropagatedAnnotations: true
define view entity z00_i_demo_03
  as select from /dmo/booking
{
  key travel_id                                                            as TravelId,
  key booking_id                                                           as BookingId,
      booking_date                                                         as BookingDate,
      customer_id                                                          as CustomerId,
      carrier_id                                                           as CarrierId,
      connection_id                                                        as ConnectionId,
      flight_date                                                          as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCodeEUR'
      currency_conversion( amount => flight_price,
                            source_currency => currency_code,
                             target_currency => $projection.CurrencyCodeEUR,
                             exchange_rate_date => $session.system_date  ) as FlightPriceEUR,
      cast( 'EUR' as abap.cuky )                                           as CurrencyCodeEUR,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price                                                         as FlightPrice,
      @EndUserText.label: 'Währung'
      @EndUserText.quickInfo: 'Info zur Währung'
      currency_code                                                        as CurrencyCode
}
