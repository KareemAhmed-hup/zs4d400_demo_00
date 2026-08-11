CLASS zcl_d400_00_15class_2 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS get_sum IMPORTING iv_value1        TYPE i
                              iv_value2        TYPE i
                    RETURNING VALUE(rv_result) TYPE i.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_15class_2 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.





    DATA(lo_compute) = NEW lcl_compute( ).

    DATA(lv_result) = lo_compute->get_sum(
                        iv_value1 = 100
                        iv_value2 = 200 ).

    out->write( lv_result ).


    out->write( lo_compute->get_sum( iv_value1 = 200  iv_value2 = 300 ) ).

*************************************************************************************
    DATA lv_demo_01 TYPE i VALUE 2000.


    DATA(lv_result1) = 100 + lv_demo_01 + lo_compute->get_sum( iv_value1 = 200  iv_value2 = 300 ).
    out->write( lv_result1 ).




  ENDMETHOD.

  METHOD get_sum.
    DATA lo_demo TYPE REF TO lcl_compute.
    lo_demo = NEW #( ).
       lo_demo->get_sum(
         EXPORTING
           iv_value1 = iv_value1
           iv_value2 = iv_value2
         RECEIVING
           rv_result = rv_result ).



  ENDMETHOD.

ENDCLASS.
