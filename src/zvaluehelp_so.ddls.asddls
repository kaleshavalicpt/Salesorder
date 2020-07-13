@AbapCatalog.sqlViewName: 'ZVALHELP_SO_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'F4 help on vbap elements'
define view zvaluehelp_so as select from zpwvbak {
    
key  vbeln as SalesOrder
   
}


