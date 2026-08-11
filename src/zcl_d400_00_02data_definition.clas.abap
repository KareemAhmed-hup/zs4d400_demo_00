CLASS zcl_d400_00_02data_definition DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    METHODS demo_01 IMPORTING iv_value1 TYPE i
                              iv_value2 TYPE i
                              iv_value3 TYPE i OPTIONAL
                    EXPORTING ex_result TYPE i.




    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_02data_definition IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lo_summe TYPE REF TO zcl_d400_00_03compute.
    DATA lv_result TYPE i.

    DATA lv_demo_01 TYPE zcl_d400_00_04data=>ty_demo_02.

    CREATE OBJECT lo_summe.


    lo_summe->summe(
      EXPORTING
        iv_value1 =   100
        iv_value2 =   200
      IMPORTING
        ev_result = lv_result
    ).

    out->write( `Summe: ` && CONV string( lv_result ) ).

  ENDMETHOD.
  METHOD demo_01.

  ENDMETHOD.

ENDCLASS.
