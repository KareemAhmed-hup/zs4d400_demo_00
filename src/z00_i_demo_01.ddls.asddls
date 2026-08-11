@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo'
@Metadata.ignorePropagatedAnnotations: true
define view entity z00_i_demo_01 as select from z00_demo_01
{
    key customer_id as CustomerId,
    name as Name,
    first_name as FirstName,
    postal_code as PostalCode,
    city as City
}
