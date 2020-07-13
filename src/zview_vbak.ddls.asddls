@AbapCatalog.sqlViewName: 'ZSVIEW_VBAK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header Details'
@Metadata.allowExtensions: true
//@Search.searchable: true
@UI: {headerInfo: {typeName: 'Sales Order',typeNamePlural: 'Sales Order' ,title: { type: #STANDARD, value: 'zvbeln' }}}

@ObjectModel.semanticKey: ['zvbeln']

define root view ZC_VBAK
  as select from zvbak_dt as SOHeader
 // composition [0..*] of ZVIEW_VBAP as _SOItem
  //composition [0..*] of ZVIEW_VBUK as _SOStatus
  
{

        @UI.facet: [{id: 'GeneralData',type: #COLLECTION,position: 10,label: 'Sales Order Header'},

        {type: #FIELDGROUP_REFERENCE,position: 10,targetQualifier: 'GeneralData1',parentId: 'GeneralData1',isSummary: true,isPartOfPreview: true}]

//        {type: #FIELDGROUP_REFERENCE,position: 20,targetQualifier: 'GeneralData2',parentId: 'GeneralData',isSummary: true,isPartOfPreview: true},

    //    {id: 'SOItem',purpose: #STANDARD,type: #LINEITEM_REFERENCE,label: 'Sales Order Item',position: 10,targetElement: '_SOItem'},
    //    {id: 'SOStatus',purpose: #STANDARD,type: #LINEITEM_REFERENCE,label: 'Sales Order Status',position: 10,targetElement: '_SOStatus'}]           

        @UI: {lineItem: [ { position: 10, importance: #HIGH } ],
             selectionField: [{position: 10 }],
              fieldGroup: [{qualifier: 'GeneralData1',position: 10,importance: #HIGH }]}
              
  key   SOHeader.zvbeln,

        @UI: {lineItem: [ { position: 20, importance: #HIGH } ],
                            selectionField: [{position: 20 }],
                            fieldGroup: [{qualifier: 'GeneralData2',position: 10,importance: #HIGH }]}

        SOHeader.zerdat,

        @UI: {lineItem: [ { position: 30, importance: #HIGH } ],
                            fieldGroup: [{qualifier: 'GeneralData2',position: 20,importance: #HIGH }]

        }

        SOHeader.zernam,

        @UI: {lineItem: [ { position: 40, importance: #HIGH } ],
              fieldGroup: [{qualifier: 'GeneralData1',position: 20,importance: #HIGH }]

        }

        SOHeader.zvkorg,

        @UI: {lineItem: [ { position: 50, importance: #HIGH } ],
              fieldGroup: [{qualifier: 'GeneralData1',position: 30,importance: #HIGH }]

        }
        SOHeader.zvtweg,

        @UI: {lineItem: [ { position: 60, importance: #HIGH } ],
              fieldGroup: [{qualifier: 'GeneralData1',position: 40,importance: #HIGH }]

        }

        SOHeader.zspart


   //     _SOItem,
    //    _SOStatus
        
        
        

}
