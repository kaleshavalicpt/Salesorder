CLASS zcl_add_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_add_data IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
    data ls_materials type zmaterials.
    data lv_temp(20) type c VALUE 'ZPWSTATUS'.

case lv_temp.
when 'zmaterials'.
clear ls_materials.
ls_materials-matnr = '10000001'.
ls_Materials-Description = 'material1'.
MODIFY zmaterials from @( ls_materials ).


clear ls_materials.
ls_materials-matnr = '10000002'.
ls_Materials-Description = 'material2'.
MODIFY zmaterials from @( ls_materials ).


clear ls_materials.
ls_materials-matnr = '10000003'.
ls_Materials-Description = 'material3'.
MODIFY zmaterials from @( ls_materials ).


clear ls_materials.
ls_materials-matnr = '10000004'.
ls_Materials-Description = 'material4'.
MODIFY zmaterials from @( ls_materials ).


clear ls_materials.
ls_materials-matnr = '10000005'.
ls_Materials-Description = 'material5'.
MODIFY zmaterials from @( ls_materials ).


clear ls_materials.
ls_materials-matnr = '10000006'.
ls_Materials-Description = 'material6'.
MODIFY zmaterials from @( ls_materials ).

when 'ZPWSTATUS'.

data ls_status type zpwstatus.

clear ls_status.
ls_status-status = 'O'.
ls_status-Description = 'OPEN'.
MODIFY zpwstatus from @( ls_status ).

clear ls_status.
ls_status-status = 'P'.
ls_status-Description = 'PARTIALLY COMPLETED'.
MODIFY zpwstatus from @( ls_status ).

clear ls_status.
ls_status-status = 'C'.
ls_status-Description = 'COMPLETED'.
MODIFY zpwstatus from @( ls_status ).




ENDCASE.

ENDMETHOD.
ENDCLASS.
