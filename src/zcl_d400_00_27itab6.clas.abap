CLASS zcl_d400_00_27itab6 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_27itab6 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "S4D400 Seite 270.
    DATA lt_connection TYPE STANDARD TABLE OF /dmo/connection WITH NON-UNIQUE KEY carrier_id connection_id.
    DATA ls_connection LIKE LINE OF lt_connection.

    ls_connection-carrier_id = 'AA'.
    ls_connection-connection_id = '0017'.
    APPEND ls_connection TO lt_connection.

    ls_connection-carrier_id = 'LH'.
    ls_connection-connection_id = '0400'.
    APPEND ls_connection TO lt_connection.

    ls_connection-carrier_id = 'BA'.
    ls_connection-connection_id = '0406'.
    INSERT ls_connection   INTO TABLE lt_connection.


    "Bisheriger Inhalt der internen Tabelle wird nicht gelöscht!
    lt_connection = VALUE #( BASE lt_connection ( carrier_id = 'RB1' connection_id = '0400' )
                             ( carrier_id = 'RB2' connection_id = '0400' )
                             ( carrier_id = 'RB3' connection_id = '0400' )
                             ( carrier_id = 'RB4' connection_id = '0400' ) ).

    "Bisheriger Inhalt der internen Tabelle wird  gelöscht!
    lt_connection = VALUE #( ( carrier_id = 'RB1' connection_id = '0400' )
                             ( carrier_id = 'RB2' connection_id = '0400' )
                             ( carrier_id = 'RB3' connection_id = '0400' )
                             ( carrier_id = 'RB4' connection_id = '0400' ) ).

    SELECT FROM /dmo/connection FIELDS * APPENDING TABLE @lt_connection.


    ls_connection = lt_connection[ carrier_id = 'LH'  connection_id = '0400'   ].

    ls_connection-airport_from_id = 'AAA'.
    ls_connection-airport_to_id = 'BBB'.

    MODIFY TABLE lt_connection FROM ls_connection TRANSPORTING airport_from_id airport_to_id. "Per Schlüssel

    ls_connection-airport_from_id = 'AAA'.
    ls_connection-airport_to_id = 'BBB'.

    MODIFY lt_connection FROM ls_connection INDEX 3 TRANSPORTING airport_from_id airport_to_id. "Per Index





****************************************************************************
    "S4D400 Seite 275
    LOOP AT lt_connection INTO ls_connection WHERE airport_from_id IS INITIAL AND  airport_to_id IS INITIAL.
      ls_connection-airport_from_id = 'BBB'.
      ls_connection-airport_to_id = 'CCC'.

      MODIFY lt_connection FROM ls_connection INDEX sy-tabix  TRANSPORTING airport_from_id airport_to_id.  "Variante 1
      MODIFY lt_connection FROM ls_connection  TRANSPORTING airport_from_id airport_to_id.                 "Variante 2

    ENDLOOP.



    out->write( lt_connection   ).



  ENDMETHOD.

ENDCLASS.
