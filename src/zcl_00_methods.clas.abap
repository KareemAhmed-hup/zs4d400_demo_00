CLASS zcl_00_methods DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_methods IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.  "Collection der Objekte

    "  Objekt 1
    connection = NEW #( ).
    TRY.
        connection->set_attributes(
          i_carrier_id    = 'LH'
          i_connection_id = '0400' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( 'Fehler bei dem Aufruf der Methode' ).
      CATCH cx_root.
        out->write( 'Unbekannter Fehler!' ).

    ENDTRY.



    "  Objekt 2
    connection = NEW #( ).
    TRY.
        connection->set_attributes(
          i_carrier_id    = 'AA'
          i_connection_id = '0017' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( 'Fehler bei dem Aufruf der Methode' ).
    ENDTRY.

    "  Objekt 3
    connection = NEW #( ).
    TRY.
        connection->set_attributes(
          i_carrier_id    = 'SQ'
          i_connection_id = '0001' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( 'Fehler bei dem Aufruf der Methode' ).
    ENDTRY.


    LOOP AT connections INTO connection.
      out->write(  connection->get_output( ) ).

    ENDLOOP.




  ENDMETHOD.
ENDCLASS.
