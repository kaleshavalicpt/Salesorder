FUNCTION ZPWADD_DATA.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(LV_TABLE) TYPE  ZMATERIALS-DESCRIPTION
*"     REFERENCE(LV_COUNT) TYPE  I
*"----------------------------------------------------------------------

CASE LV_TABLE.



WHEN 'zmaterials'.

DATA ls_materials type zmaterials.
DATA lt_materials type TABLE OF zmaterials.
DATA lv_temp type N.

*Select * from zmaterials ORDER BY matnr DESCENDING INTO @DATA(ls_materials)  UP TO 1 ROWS .

*ENDSELECT.
*if  sy-subrc <> 0.

*ls_materials-matnr = '1000001'.
*ls_Materials-Description = 'Material1'.

*ENDIF.

DELETE from zmaterials.

clear ls_materials.

DO lv_count times.

ls_materials-matnr = '1000000'.
ls_Materials-Description = 'Material'.

CONCATENATE ls_materials-matnr lv_temp into ls_materials.
CONCATENATE ls_materials-matnr lv_temp into ls_materials.

MODIFY zmaterials from @( ls_materials ).

ENDDO.

ENDCASE.




ENDFUNCTION.
