@AbapCatalog.sqlViewName: 'ZPWSO_STATUS_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales order Status Information'
//@ObjectModel.representativeKey: ['vbeln','posnr']

define view zpwso_status_view as select from zpwvbap as SOStatus
association to parent ZPWSALESHEADER_VIEW as _SOHeader on ( $projection.vbeln = _SOHeader.vbeln )
{
@UI.facet: [{type: #COLLECTION, position: 10, id: 'Sostatus', label: 'Sales Order Status'},
{type: #FIELDGROUP_REFERENCE, position: 10, targetQualifier: 'Sostatus1',parentId: 'Sostatus', isSummary: true, isPartOfPreview: true}
]

@UI: { lineItem: [ { position: 10, importance: #HIGH } ], fieldGroup: [{qualifier: 'SoItem1',position: 10,importance: #HIGH }]}
key  SOStatus.vbeln,

@UI: { lineItem: [ { position: 20, importance: #HIGH } ], fieldGroup: [{qualifier: 'SoItem1',position: 20,importance: #HIGH }]}
key  SOStatus.posnr,

@UI: { lineItem: [ { position: 30, importance: #HIGH } ], fieldGroup: [{qualifier: 'SoItem2',position: 10,importance: #HIGH }]}
SOStatus.matnr,

@UI: { lineItem: [ { position: 40, importance: #HIGH } ], fieldGroup: [{qualifier: 'SoItem2',position: 20,importance: #HIGH }]}
SOStatus.zmeng,
SOStatus.meins,
/*Association*/

_SOHeader

}
