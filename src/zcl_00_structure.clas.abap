CLASS zcl_00_structure DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_structure IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.  "Collection der Objekte

    "  Objekt 1
    TRY.
        connection = NEW lcl_connection(
         i_carrier_id    = 'LH'
         i_connection_id = '0400' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( 'Fehler bei dem Aufruf der Methode' ).
      CATCH cx_root.
        out->write( 'Unbekannter Fehler!' ).
    ENDTRY.


    "  Objekt 2
    TRY.
        connection = NEW lcl_connection(
         i_carrier_id    = 'AA'
         i_connection_id = '0017' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( 'Fehler bei dem Aufruf der Methode' ).
      CATCH cx_root.
        out->write( 'Unbekannter Fehler!' ).
    ENDTRY.


    "  Objekt 3
    TRY.
        connection = NEW lcl_connection(
         i_carrier_id    = 'SQ'
         i_connection_id = '0001' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( 'Fehler bei dem Aufruf der Methode' ).
      CATCH cx_root.
        out->write( 'Unbekannter Fehler!' ).
    ENDTRY.


    LOOP AT connections INTO connection.
      out->write(  connection->get_output( ) ).
    ENDLOOP.
    out->write( cl_abap_char_utilities=>newline  ).
    out->write( `Counter: `  && lcl_connection=>conn_counter ).


  ENDMETHOD.
ENDCLASS.
