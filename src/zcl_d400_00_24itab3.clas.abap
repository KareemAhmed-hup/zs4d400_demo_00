CLASS zcl_d400_00_24itab3 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_24itab3 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lt_demo_01 TYPE TABLE OF REF TO zcl_d400_00_24itab3.
    DATA lt_demo_02 TYPE TABLE OF /dmo/connection.
    DATA lt_demo_03 TYPE TABLE OF /dmo/connection_id.
******************************************************************************
    DATA lt_connection TYPE TABLE OF /dmo/connection WITH NON-UNIQUE KEY carrier_id connection_id.
    DATA ls_connection LIKE LINE OF lt_connection.
    SELECT FROM /dmo/connection FIELDS * INTO TABLE @lt_connection.
*    CLEAR lt_connection.
    out->write( lt_connection ).
    out->write( cl_abap_char_utilities=>newline ).
    READ TABLE lt_connection INTO ls_connection WITH KEY airport_from_id = 'FRA' airport_to_id = 'SFO'." BINARY SEARCH. "Per Schlüssel. Variante 1 SY-TABIX wird gesetzt!
    DATA(lv_index) = sy-tabix.
    out->write( ls_connection ).
    out->write( `Index: (korrekt)` && lv_index ).
    out->write( cl_abap_char_utilities=>newline ).

    ls_connection = lt_connection[ airport_from_id = 'FRA' airport_to_id = 'JFK'  ]. "Per Schlüssel. Variante 2 SY-TABIX wird nicht gesetzt!
    ls_connection-departure_time = lt_connection[ airport_from_id = 'FRA' airport_to_id = 'JFK'  ]-departure_time. "Per Schlüssel. Variante 2 SY-TABIX wird nicht gesetzt!
    lv_index = sy-tabix.
    out->write( ls_connection ).
    out->write( `Index: (falsch)` && lv_index ).


*   Index per Tabellenausdruck ermitteln

    DATA(lv_index_tab) = line_index( lt_connection[ airport_from_id = 'FRA' airport_to_id = 'JFK'  ]  ).
    out->write( `Index: (korrekt)` && lv_index_tab ).

***************************************************************************************************
    DATA lt_connection_hashed TYPE HASHED TABLE OF /dmo/connection WITH UNIQUE KEY carrier_id connection_id.
    SELECT FROM /dmo/connection FIELDS * INTO TABLE @lt_connection_hashed.
    SORT lt_connection_hashed BY carrier_id connection_id.

***************************************************************************************************
    DATA lt_connection_sorted TYPE SORTED TABLE OF /dmo/connection WITH UNIQUE KEY carrier_id connection_id.
    SELECT FROM /dmo/connection FIELDS * INTO TABLE @lt_connection_sorted.

***************************************************************************************************
    TYPES: BEGIN OF ty_struc,
             col1 TYPE i,
             col2 TYPE string,
           END OF ty_struc.
    TYPES lt_t_sorted TYPE SORTED TABLE OF ty_struc WITH NON-UNIQUE KEY col1.
    DATA lt_sorted TYPE lt_t_sorted.
***************************************************************************************************
    DATA lt_connection_1 TYPE zconnection_00.


  ENDMETHOD.

ENDCLASS.
