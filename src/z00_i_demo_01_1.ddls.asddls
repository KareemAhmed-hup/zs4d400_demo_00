@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'demo'
@Metadata.ignorePropagatedAnnotations: true
define view entity z00_i_demo_01_1 as select from z00_i_demo_01
{
    key CustomerId,
    Name,
    FirstName,
    PostalCode,
    City
}
