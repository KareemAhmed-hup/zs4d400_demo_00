CLASS zcl_00_instances DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_instances IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.  "Collection der Objekte

    "  Objekt 1
    connection = NEW #( ).
    connection->carrier_id = 'LH'.
    connection->connection_id = '0400'.
    APPEND connection TO connections.

    "  Objekt 2
    connection = NEW #( ).
    connection->carrier_id = 'AA'.
    connection->connection_id = '0017'.
    APPEND connection TO connections.

    "  Objekt 3
    connection = NEW #( ).
    connection->carrier_id = 'SQ'.
    connection->connection_id = '0001'.
    APPEND connection TO connections.


  ENDMETHOD.
ENDCLASS.
