CLASS zcl_d400_00_07if_endif DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_07if_endif IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "S4D400 Seite 69
*    DATA lv_value TYPE i VALUE 500.
    DATA lv_value TYPE i VALUE 10000.

    IF lv_value > 1000.
      out->write( 'lv_value > 1000'  ).
    ELSEIF lv_value > 2000..
      out->write( 'lv_value > 2000'  ).
    ELSEIF lv_value > 3000..
      out->write( 'lv_value > 3000'  ).
    ELSE.
      out->write( 'ELSE'  ).
    ENDIF.










  ENDMETHOD.

ENDCLASS.
