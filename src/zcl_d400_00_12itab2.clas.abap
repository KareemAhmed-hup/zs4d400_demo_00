CLASS zcl_d400_00_12itab2 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_12itab2 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*S4D400 Seite 87
    DATA lt_connection TYPE TABLE OF /dmo/connection.
    DATA ls_connection LIKE LINE OF lt_connection.
    SELECT FROM /dmo/connection FIELDS * INTO TABLE @lt_connection.
*    CLEAR lt_connection.
    out->write( lt_connection ).
    out->write( cl_abap_char_utilities=>newline ).
    READ TABLE lt_connection INTO ls_connection INDEX 5." Zugriff per Index, Variante 1 SY-TABIX wird gesetzt
    DATA(lv_index) = sy-tabix.

*    out->write( ls_connection ).
    out->write( lv_index ).

    ls_connection = lt_connection[ 6 ].                 "Zugriff per Index, Variante 2 SY-TABIX wird nicht gesetzt
    lv_index = sy-tabix.
    out->write( lv_index ).
*    out->write( ls_connection ).

    out->write( '********************** LOOP-ENDLOOP ***************************' ).
*S4D400 Seite 89
    LOOP AT lt_connection INTO ls_connection.
      out->write( ls_connection ).
    ENDLOOP.
    out->write( '---------------------------------------------------------------' ).
    LOOP AT lt_connection INTO DATA(ls_connection1).
      out->write( ls_connection1 ).
    ENDLOOP.
*    LOOP AT lt_connection INTO DATA(ls_connection1).  "Fehler
*      out->write( ls_connection1 ).
*    ENDLOOP.



    ls_connection1-carrier_id = 'LH'.   "Ok




  ENDMETHOD.

ENDCLASS.
