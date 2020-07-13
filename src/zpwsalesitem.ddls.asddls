@AbapCatalog.sqlViewName: 'ZPWSALESITEM_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
//@Search.searchable: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order Item'
//@ObjectModel.representativeKey: ['vbeln','posnr']

define view zpwsalesitem as select from zpwvbap as SOItem
association to parent ZPWSALESHEADER_VIEW as _SOHeader on ( $projection.vbeln = _SOHeader.vbeln )
{
@UI.facet: [{type: #COLLECTION, position: 10, id: 'SoItem', label: 'Item Details'},
{type: #FIELDGROUP_REFERENCE, position: 10, targetQualifier: 'SoItem1',parentId: 'SoItem', isSummary: true, isPartOfPreview: true}
//{type: #FIELDGROUP_REFERENCE, position: 20, targetQualifier: 'SoItem2',parentId: 'SoItem', isSummary: true, isPartOfPreview: true}
]


@UI: { lineItem: [ { position: 10, label: 'Document No', importance: #HIGH } ], 
       identification: [{ position: 10, label: 'Document No' }], 
       selectionField: [{position: 10 }],
       fieldGroup: [{qualifier: 'SoItem1',position: 10,importance: #HIGH }]
      } 
@Consumption.valueHelpDefinition: [{  entity: {   name: 'zvaluehelp_so' , 
                                                        element: 'vbeln'  }     }] 
              
@EndUserText.label: 'Document No'

key  SOItem.vbeln,

@UI: { lineItem: [ { position: 20, label: 'Item No', importance: #HIGH } ], fieldGroup: [{qualifier: 'SoItem1',position: 20,importance: #HIGH }]}

key  SOItem.posnr,

@UI: { lineItem: [ { position: 30, importance: #HIGH } ], fieldGroup: [{qualifier: 'SoItem1',position: 20,importance: #HIGH }]}
@Consumption.valueHelpDefinition: [{  entity: {   name: 'zvaluehelp_vbap' , 
                                                        element: 'matnr'  }     }] 
                                                        
SOItem.matnr,

@UI: { lineItem: [ { position: 40, importance: #HIGH } ], fieldGroup: [{qualifier: 'SoItem1',position: 10,importance: #HIGH }]}
@EndUserText.label: 'Actual Quantity'

SOItem.zmeng,

@UI: { lineItem: [ { position: 50, label: 'Units',importance: #HIGH } ], fieldGroup: [{qualifier: 'SoItem1',position: 20,importance: #HIGH }]}
SOItem.meins,
/*Association*/

_SOHeader

}
