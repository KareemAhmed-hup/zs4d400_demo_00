CLASS zcl_d400_00_31delete DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    TYPES ty_demo_1 TYPE TABLE OF string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_31delete IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DELETE FROM z00flight_d.
    DELETE FROM z00connection_d.

  ENDMETHOD.

ENDCLASS.
