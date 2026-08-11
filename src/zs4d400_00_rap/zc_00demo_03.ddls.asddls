@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'Z00DEMO_03'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_00DEMO_03
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_00DEMO_03
  association [1..1] to ZR_00DEMO_03 as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,
  Name,
  FirstName,
  City,
  PostCode,
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
