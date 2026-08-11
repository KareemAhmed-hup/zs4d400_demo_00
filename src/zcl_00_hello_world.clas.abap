CLASS zcl_00_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_hello_world IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( EXPORTING data  = 'Hello World! Variante 1' ).
    out->write(  cl_abap_char_utilities=>newline ).
    out->write( 'Hello World! Variante 2' ).
  ENDMETHOD.

ENDCLASS.
