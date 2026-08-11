@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'Z00HOUSE'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_00HOUSE
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_00HOUSE
  association [1..1] to ZR_00HOUSE as _BaseEntity on $projection.HOUSEID = _BaseEntity.HOUSEID
{
  key HouseID,
  Street,
  PostCode,
  City,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
