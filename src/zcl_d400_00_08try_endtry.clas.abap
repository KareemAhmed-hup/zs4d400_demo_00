CLASS zcl_d400_00_08try_endtry DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_08try_endtry IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "S4D400 Seite 73
    DATA lv_value1 TYPE i VALUE 500.
    DATA lv_value2 TYPE i VALUE 0.
    DATA lv_result TYPE i.

    TRY.
        lv_result = lv_value1 / lv_value2.
        lv_result = 200.

      CATCH cx_sy_zerodivide  INTO DATA(lx_result).
        out->write( lx_result->get_text(  )   ).
        out->write( lx_result->get_longtext(  )   ).

      CATCH cx_root INTO DATA(lx_root).
        out->write( lx_root->get_text(  )   ).


    ENDTRY.
*


    out->write( lv_result ).







  ENDMETHOD.

ENDCLASS.
