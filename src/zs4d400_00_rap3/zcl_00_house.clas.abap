CLASS zcl_00_house DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_house IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    DATA lo_demo_01 TYPE REF TO lcl_house.


    lcl_house=>set_addresses(  ).
    out->write( lcl_house=>get_addresses(  ) ).



  ENDMETHOD.
ENDCLASS.
