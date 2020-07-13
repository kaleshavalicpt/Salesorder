@AbapCatalog.sqlViewName: 'ZVALHELP_STATS_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'F4 help on vbap elements'
define view zvaluehelp_status as select from zpwstatus {
   
key zpwstatus.status ,
zpwstatus.description

}


