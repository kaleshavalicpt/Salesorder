@AbapCatalog.sqlViewName: 'ZSVIEW_VBUK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order Status Details'
define view ZC_VBUK as select from zvbuk_dt as SOStatus
//association to parent ZVIEW_VBAK as _SOHeader on $projection.zvbeln = _SOHeader.zvbeln  
  
{
@UI.facet: [{type: #COLLECTION, position: 10, id: 'SOStatus', label: 'Sales Order Status'},
            {type: #FIELDGROUP_REFERENCE, position: 10, targetQualifier: 'SOStatus1',parentId: 
            'SOStatus', isSummary: true, isPartOfPreview: true}]
           // {type: #FIELDGROUP_REFERENCE, position: 20, targetQualifier: 'SOStatus2',parentId: 
           // 'SOStatus', isSummary: true, isPartOfPreview: true}]
            
@UI: {lineItem: [ { position: 10, importance: #HIGH } ],
fieldGroup: [{qualifier: 'SOStatus1',position: 10,importance: #HIGH }]
}           
key SOStatus.zvbeln,
    
@UI: {lineItem: [ { position: 20, importance: #HIGH } ],
fieldGroup: [{qualifier: 'SOStatus1',position: 20,importance: #HIGH }]
}
SOStatus.zlfstk,
@UI: {lineItem: [ { position: 30, importance: #HIGH } ],
fieldGroup: [{qualifier: 'SOStatus1',position: 30,importance: #HIGH }]
}
SOStatus.zfkstk 
    
 //_SOHeader 
  
}
