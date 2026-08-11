CLASS zcl_d400_00_25itab4 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_25itab4 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "S4D400 Seite 268.
    DATA lt_connection_sorted TYPE SORTED TABLE OF /dmo/connection WITH UNIQUE KEY carrier_id connection_id.
    DATA ls_connection_sorted LIKE LINE OF lt_connection_sorted.

    ls_connection_sorted-carrier_id = 'AA'.
    ls_connection_sorted-connection_id = '0017'.
    APPEND ls_connection_sorted TO lt_connection_sorted.

    ls_connection_sorted-carrier_id = 'LH'.
    ls_connection_sorted-connection_id = '0400'.
    APPEND ls_connection_sorted TO lt_connection_sorted.

    ls_connection_sorted-carrier_id = 'BA'.
    ls_connection_sorted-connection_id = '0406'.
    INSERT ls_connection_sorted   INTO TABLE lt_connection_sorted.  "Mit APPEND -> Fehler


    ls_connection_sorted = VALUE #( carrier_id = 'UA1'
                                    connection_id = '0001' ).

    APPEND ls_connection_sorted TO lt_connection_sorted.
    ls_connection_sorted = VALUE #( carrier_id = 'UA1'
                                  connection_id = '0002' ).

    INSERT ls_connection_sorted INTO TABLE lt_connection_sorted.

    APPEND VALUE #( carrier_id = 'UA1' connection_id = '0003' ) TO lt_connection_sorted.

    INSERT VALUE #( carrier_id = 'RB1' connection_id = '0004' ) INTO TABLE lt_connection_sorted.




  ENDMETHOD.

ENDCLASS.
