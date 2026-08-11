@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'Z00FLIGHT'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_00FLIGHT
  provider contract transactional_query
  as projection on ZR_00FLIGHT
  association [1..1] to ZR_00FLIGHT as _BaseEntity on $projection.CarrierID = _BaseEntity.CarrierID and $projection.ConnectionID = _BaseEntity.ConnectionID and $projection.FlightDate = _BaseEntity.FlightDate
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  @Semantics: {
    amount.currencyCode: 'CurrencyCode'
  }
  Price,
//  @Consumption: {
//    Valuehelpdefinition: [ {
//      Entity.Element: 'Currency', 
//      Entity.Name: 'I_CurrencyStdVH', 
//      Useforvalidation: true
//    } ]
//  }


  @Consumption.valueHelpDefinition: [{ entity.name: 'I_CurrencyStdVH', entity.element: 'Currency'  }] 
  @Semantics.currencyCode: false
  CurrencyCode,
  PlaneTypeID,
  @Semantics: {
    user.createdBy: true
  }
  LocalCreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  LocalCreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LocalLastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,
  _BaseEntity
}
