@AbapCatalog.sqlViewName: 'ZVALHELP_VBAP_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'F4 help on vbap elements'
define view zvaluehelp_vbap as select from zmaterials {
    
key  matnr as Material,
description   

 
}


