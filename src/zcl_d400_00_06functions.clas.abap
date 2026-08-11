CLASS zcl_d400_00_06functions DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_06functions IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "S4D400 Seite 61

    DATA lv_string1 TYPE string VALUE '12345'.
    DATA lv_string2 TYPE string VALUE '6789'.
    DATA(lv_result2) = lv_string1 && | | && lv_string2.
    DATA(lv_result3) = 'ABCD' & 'EFGH'.
    out->write( lv_result2 ).






    "S4D400 Seite 59
    DATA lv_date_01 TYPE d VALUE '20260702'.

    out->write( | { lv_date_01   }|  ).
    out->write( | { lv_date_01  DATE = ISO  }|  ).
    out->write( | { lv_date_01  DATE = USER  }|  ).
    out->write( | { lv_date_01  DATE = ENVIRONMENT  }|  ).


    "S4D400 Seite 59
    DATA lv_demo_04 TYPE string VALUE '12345'.
    DATA lv_demo_05 TYPE string VALUE '6789'.
    DATA lv_demo_06 TYPE p LENGTH 6 DECIMALS 2 VALUE '123.45-'.
    DATA(lv_result1)  = |Demo-01 { lv_demo_04 }{  lv_demo_05 } { lv_demo_06 NUMBER = ENVIRONMENT  } |.

    out->write( lv_result1 ).


    "S4D400 Seite 58
    DATA(lv_result) = ipow( base = 4  exp  = 5 ).    "Variante 1
    out->write( lv_result ).

    out->write( ipow( base = 4  exp  = 5 ) ).        "Variante 1

    DATA(lv_demo_01) = 1 + 1.

    DATA lv_demo_02 TYPE string VALUE '1234567890'.

    DATA(lv_demo_03) = lv_demo_02+2(5).

    out->write( lv_demo_03 ).


  ENDMETHOD.

ENDCLASS.
