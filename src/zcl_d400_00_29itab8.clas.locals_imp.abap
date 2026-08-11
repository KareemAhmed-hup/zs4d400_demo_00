*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations


CLASS lcl_demo_01 DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_demo_1 TYPE TABLE OF string.
    METHODS demo_1 IMPORTING it_demo TYPE ty_demo_1.   "Ok
    METHODS demo_2 IMPORTING it_demo TYPE INDEX TABLE.   "Ok
    METHODS demo_3 IMPORTING it_demo TYPE ANY TABLE.   "Ok



  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_demo_01 IMPLEMENTATION.

  METHOD demo_1.
*     data lt_demo_01 type any table.  "Fehler



  ENDMETHOD.

  METHOD demo_2.

  ENDMETHOD.

  METHOD demo_3.

  ENDMETHOD.

ENDCLASS.
