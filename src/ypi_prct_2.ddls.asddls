@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Student Interface View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity YPI_PRCT_2
  as select from yprct_2_table
  association to YPCRT_gender as _gender on $projection.Gender = _gender.Value
{
  key id                  as Id,
      firstname           as Firstname,
      lastname            as Lastname,
      age                 as Age,
      course              as Course,
      courseduration      as Courseduration,
      status              as Status,
      gender              as Gender,
      dob                 as Dob,
      lastchangedat       as Lastchangedat,
      locallastchangedat  as Locallastchangedat,
      _gender,
      _gender.Description as Genderdes
}
