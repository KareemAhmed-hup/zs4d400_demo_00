CLASS zcl_d400_00_28itab7 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_28itab7 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    data lt_demo_01 type zcl_d400_00_29itab8=>ty_demo_1.


    "S4D400 Seite 276.
    DATA lt_connection TYPE STANDARD TABLE OF /dmo/connection WITH NON-UNIQUE KEY carrier_id connection_id.
    DATA ls_connection LIKE LINE OF lt_connection.


    SELECT SINGLE FROM /dmo/connection FIELDS *  WHERE carrier_id = 'LH'
        AND connection_id = '0400'  INTO @ls_connection.
    out->write( ls_connection ).


    SELECT FROM /dmo/connection FIELDS *  WHERE carrier_id = 'LH' INTO TABLE @lt_connection.


    out->write( lt_connection   ).


    "S4D400 Seite 277
    DATA lt_flights TYPE TABLE OF /dmo/flight.

    SELECT FROM /dmo/connection FIELDS *  WHERE carrier_id = 'LH'
             INTO CORRESPONDING FIELDS OF  TABLE @lt_flights.

    lt_flights[ carrier_id = 'LH'  connection_id = '400'  ]-price = 566. "Andere Variante für MODIFY...



    out->write( cl_abap_char_utilities=>newline   ).
    out->write( lt_flights   ).

    SELECT  FROM /dmo/booking   FIELDS * INTO TABLE @DATA(lt_result) UP TO 30 ROWS  .
    out->write( cl_abap_char_utilities=>newline   ).
    out->write( lt_result ).


    SELECT  FROM /dmo/booking   FIELDS 'Demo-1' AS col1, 'Demo-2' AS col2, carrier_id, connection_id, booking_date  INTO TABLE @DATA(lt_result1) UP TO 30 ROWS  .
    out->write( cl_abap_char_utilities=>newline   ).
    out->write( lt_result1 ).






  ENDMETHOD.

ENDCLASS.
