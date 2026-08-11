CLASS zcl_d400_00_26itab5 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_26itab5 IMPLEMENTATION.

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

    CLEAR ls_connection.
    ls_connection = lt_connection[ carrier_id = 'LH'  connection_id = '0400'  ].


    CLEAR ls_connection.
    ls_connection = lt_connection[ carrier_id = 'SQ'  ].


    CLEAR ls_connection.


    IF line_exists( lt_connection[ carrier_id = 'LH' connection_id = '0400'   ]  ).
            ls_connection = lt_connection[ carrier_id = 'LH' connection_id = '0400'   ].
    ENDIF.

    TRY.
        ls_connection = lt_connection[ carrier_id = 'AAA' connection_id = '0400'   ].
      CATCH cx_root INTO DATA(lo_excp).
        out->write( lo_excp->get_text(  ) ).

    ENDTRY.

    out->write( ls_connection ).

*******************************************************************************************
    LOOP AT lt_connection INTO ls_connection FROM 1 TO 10 WHERE  carrier_id = 'SQ'.
      out->write( ls_connection  ).

    ENDLOOP.




  ENDMETHOD.

ENDCLASS.
