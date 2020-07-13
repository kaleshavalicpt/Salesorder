@AbapCatalog.sqlViewName: 'ZSVIEW_VBAP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order Item Details'

define view ZVIEW_VBAP as select from zvbap_dt as SOItem

//association to parent ZVIEW_VBAK as _SOHeader on $projection.zvbeln = _SOHeader.zvbeln 

{
 @UI.facet: [{type: #COLLECTION, position: 10, id: 'SoItem', label: 'Sales Order Item'},
            {type: #FIELDGROUP_REFERENCE, position: 10, targetQualifier: 'SoItem1',parentId: 'SoItem', isSummary: true, isPartOfPreview: true},
            {type: #FIELDGROUP_REFERENCE, position: 20, targetQualifier: 'SoItem2',parentId: 'SoItem', isSummary: true, isPartOfPreview: true}]

@UI: {lineItem: [ { position: 10, importance: #HIGH } ],
fieldGroup: [{qualifier: 'SoItem1',position: 10,importance: #HIGH }]
}
key  SOItem.zvbeln,

@UI: {lineItem: [ { position: 20, importance: #HIGH } ],
fieldGroup: [{qualifier: 'SoItem1',position: 20,importance: #HIGH }]
}
key  SOItem.zposnr,

@UI: {lineItem: [ { position: 30, importance: #HIGH } ],
fieldGroup: [{qualifier: 'SoItem2',position: 10,importance: #HIGH }]
}
SOItem.matnr
/*Association*/

//_SOHeader


}
