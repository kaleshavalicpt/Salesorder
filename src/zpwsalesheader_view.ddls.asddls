@AbapCatalog.sqlViewName: 'ZPWSALESHEADER_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
//@Search.searchable: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Details'
@UI: { headerInfo: { typeName: 'Sales Document Information',
                     typeNamePlural: 'Sales Documents Information',
                     title: { type: #STANDARD, value: 'vbeln'}
                    }
     }
@ObjectModel.semanticKey: ['vbeln']
//@ObjectModel.representativeKey: 'vbeln'
define root view ZPWSALESHEADER_VIEW as select from zpwvbak as SOHeader
composition [0..*] of zpwsalesitem as _SOItem
composition [0..*] of zpwso_status_view as _SOStatus
{ @UI.facet: [{ id: 'GeneralData',type: #COLLECTION,position: 10,label: 'Header Details' },
                                                     { type: #FIELDGROUP_REFERENCE,position: 10,targetQualifier: 'GeneralData1',
                                                        parentId: 'GeneralData',isSummary: true,isPartOfPreview: true},
//                                                     { type: #FIELDGROUP_REFERENCE,position: 20,targetQualifier: 'GeneralData2',
//                                                        parentId: 'GeneralData',isSummary: true,isPartOfPreview: true},
                                                     {  id: 'SOItem',purpose: #STANDARD,type: #LINEITEM_REFERENCE,
                                                        label: 'Sales Order Item',position: 10,targetElement: '_SOItem'},
                                                      {  id: 'SOStatus',purpose: #STANDARD,type: #LINEITEM_REFERENCE,
                                                        label: 'Sales Order Status',position: 20,targetElement: '_SOStatus'}   
                                                        ]


                                                                                                              
@UI: { lineItem: [ { position: 10, label: 'Document No', importance: #HIGH } ], 
       identification: [{ position: 10, label: 'Document No' }], 
       selectionField: [{position: 10 }],
       fieldGroup: [{qualifier: 'GeneralData1',position: 10,importance: #HIGH }]
      }      
//@ObjectModel.text.association:'_SOItem'
//@Search.defaultSearchElement: true      
@EndUserText.label: 'Document No'
key   SOHeader.vbeln,

@UI: { lineItem: [ { position: 20, label: 'Date Created', importance: #HIGH } ],
        selectionField: [{position: 20 }],
       fieldGroup: [{qualifier: 'GeneralData1',position: 10,importance: #HIGH }],
       identification: [{ position: 20, label: 'Date Created' }]
      }
@EndUserText.label: 'Created Date'
      
SOHeader.erdat,

@UI: { lineItem: [ { position: 30, label: 'Document Category', importance: #HIGH } ],
       fieldGroup: [{qualifier: 'GeneralData1',position: 20,importance: #HIGH }]
      }
SOHeader.vbtyp,

@UI: { lineItem: [ { position: 40, importance: #HIGH } ],
       fieldGroup: [{qualifier: 'GeneralData1',position: 20,importance: #HIGH }]
      }
SOHeader.vkorg,

@UI: { lineItem: [ { position: 50, importance: #HIGH } ],
       fieldGroup: [{qualifier: 'GeneralData1',position: 20,importance: #HIGH }]
      }
SOHeader.vtweg,

@UI: { lineItem: [ { position: 60, importance: #HIGH } ],
       fieldGroup: [{qualifier: 'GeneralData1',position: 40,importance: #HIGH }]
      }
SOHeader.spart,

//For action Set Favourite in UI

//@UI.lineItem: [{ type: #FOR_ACTION,dataAction: 'set_favourite',label: 'Set Favourite' },

//                {position: 15, importance: #HIGH}]
//
//                @EndUserText.label: 'Favourite'
//SOHeader.favourite,

//SOHeader.lastchangedby,

//SOHeader.lastchangedat,
_SOItem,
_SOStatus


}

