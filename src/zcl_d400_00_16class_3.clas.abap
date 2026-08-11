CLASS zcl_d400_00_16class_3 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_d400_00_16class_3 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lo_demo_02 TYPE REF TO lcl_demo_02.
    lo_demo_02 = NEW #(  ).

    lo_demo_02->mv_value1 = 2000.
*    lo_demo_02->mv_value5 = 5000. "Fehler





*****************************************************************
    "Variablen
    DATA lv_demo_01 TYPE i VALUE 100.
    DATA lv_demo_02 TYPE i.
    lv_demo_02 = lv_demo_01.
    "Referenzvariablen
    DATA lo_demo_10 TYPE REF TO lcl_demo_01.
    DATA lo_demo_20 TYPE REF TO lcl_demo_01.
    lo_demo_10 = NEW #(  ).
    lo_demo_20 = lo_demo_10.
    CLEAR lo_demo_10.


    out->write( lo_demo_20->mv_value3 ).

*    lo_demo_20->mv_value3 = 400.  "Fehler

*************************************************************************************
    DATA lo_compute TYPE REF TO zcl_d400_00_15class_2.
    "Keine Instanz (Objekt) notwendig!
    lcl_demo_01=>gv_value3 = 3000.
    lcl_demo_01=>gv_value4 = 4000.


    DATA(lo_demo_1) = NEW lcl_demo_01(  ).
    lo_demo_1->mv_value1 = 1000.   "Instanz notwendig!
    lo_demo_1->mv_value2 = 2000.   "Instanz notwendig!
    lo_demo_1->gv_value3 = 30000.  "Instanz möglich aber nicht notwendig!
    lo_demo_1->gv_value4 = 40000.  "Instanz möglich aber nicht notwendig!












****************************************************************************
    lo_compute = NEW #( ).
    DATA(lv_result) =  lo_compute->get_sum(
                         iv_value1 = 100
                         iv_value2 = 200 ).



  ENDMETHOD.

ENDCLASS.


