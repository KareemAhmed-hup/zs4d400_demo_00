CLASS zcl_d400_00_10templates DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    class-METHODS summe IMPORTING iv_value1        TYPE i
                                  iv_value2        TYPE i
                        RETURNING VALUE(rv_result) TYPE i.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_10templates IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lv_demo_01 TYPE i VALUE 100.
    DATA lv_demo_02 TYPE i VALUE 200.
    DATA lv_demo_03 TYPE i VALUE 300.

    DATA(lv_result) = |ABC{ lv_demo_01 }DEF, Summe: { zcl_d400_00_10templates=>summe( iv_value1 = -1000 iv_value2 = 200 ) SIGN = LEFT  } |.

    out->write( lv_result  ).

  ENDMETHOD.


  METHOD summe.
    rv_result = iv_value1 + iv_value2.
  ENDMETHOD.

ENDCLASS.
