@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Student Consumption View'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
define root view entity YPC_PRCT_2
  as projection on YPI_PRCT_2 as Student
{
  @EndUserText.label: 'Student ID'
  key Id,
  @EndUserText.label: 'First Name'
      Firstname,
      @EndUserText.label: 'Last Name'
      Lastname,
      @EndUserText.label: 'Age'
      Age,
      @EndUserText.label: 'Course'
      Course,
      @EndUserText.label: 'Course Duration'
      Courseduration,
      @EndUserText.label: 'Status'
      Status,
      @EndUserText.label: 'Gender1'
      Gender,
      @EndUserText.label: 'Gender Description'
      Genderdes,
      @EndUserText.label: 'Date of birth'
      Dob,
      @EndUserText.label: 'Last Changed at'
      Lastchangedat,
      @EndUserText.label: 'Local Last changed at'
      Locallastchangedat
}
