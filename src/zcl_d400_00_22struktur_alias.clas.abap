CLASS zcl_d400_00_22struktur_alias DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_d400_00_22struktur_alias IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "S4D400 Seite 248.

    SELECT SINGLE FROM /DMO/I_Connection FIELDS 'Demo' as demo_01,  COUNT( * ) as banane, MAX( Distance ) AS birne
*    SELECT SINGLE FROM /DMO/I_Connection FIELDS COUNT( * )
      INTO @DATA(ls_result).


    out->write( ls_result ).


  ENDMETHOD.

ENDCLASS.


