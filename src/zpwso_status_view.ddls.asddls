@AbapCatalog.sqlViewName: 'ZPWSO_STATUS_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales order Status Information'
//@ObjectModel.representativeKey: ['vbeln']

define view zpwso_status_view as select from zpwvbak as SOStatus
association to parent ZPWSALESHEADER_VIEW as _SOHeader on ( $projection.vbeln = _SOHeader.vbeln )
{
@UI.facet: [{type: #COLLECTION, position: 10, id: 'SoStatus', label: 'Status'},
{type: #FIELDGROUP_REFERENCE, position: 10, targetQualifier: 'SoStatus1',parentId: 'SoStatus', isSummary: true, isPartOfPreview: true}
//{type: #FIELDGROUP_REFERENCE, position: 20, targetQualifier: 'SoItem2',parentId: 'SoItem', isSummary: true, isPartOfPreview: true}
]

@UI: { lineItem: [ { position: 10, label: 'Document No', importance: #HIGH } ], fieldGroup: [{qualifier: 'SoStatus1',position: 20,importance: #HIGH }]}
@Consumption.valueHelpDefinition: [{  entity: {   name: 'zvaluehelp_so' , 
                                                        element: 'vbeln'  }     }] 


@EndUserText.label: 'Document No'

key  SOStatus.vbeln,

@UI: { lineItem: [ { position: 20, label: 'Goods Movement', importance: #HIGH } ], fieldGroup: [{qualifier: 'SoStatus1',position: 20,importance: #HIGH }]}
@Consumption.valueHelpDefinition: [{  entity: {   name: 'zvaluehelp_status' , 
                                                        element: 'status'  }     }] 

SOStatus.wbstk,

@UI: { lineItem: [ { position: 30 , label: 'Delivery Status', importance: #HIGH } ], fieldGroup: [{qualifier: 'SoStatus1',position: 20,importance: #HIGH }]}
@Consumption.valueHelpDefinition: [{  entity: {   name: 'zvaluehelp_status' , 
                                                        element: 'status'  }     }] 

SOStatus.lfstk,

@UI: { lineItem: [ { position: 40 , label: 'Delivery Block Status', importance: #HIGH } ], fieldGroup: [{qualifier: 'SoStatus1',position: 10,importance: #HIGH }]}
@Consumption.valueHelpDefinition: [{  entity: {   name: 'zvaluehelp_status' , 
                                                        element: 'status'  }     }] 


SOStatus.lsstk,

@UI: { lineItem: [ { position: 50 , label: 'Confirmation status',importance: #HIGH } ], fieldGroup: [{qualifier: 'SoStatus1',position: 10,importance: #HIGH }]}
@Consumption.valueHelpDefinition: [{  entity: {   name: 'zvaluehelp_status' , 
                                                        element: 'status'  }     }] 

SOStatus.bestk,

_SOHeader
}
