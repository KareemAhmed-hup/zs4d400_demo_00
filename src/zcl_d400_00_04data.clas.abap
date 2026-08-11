CLASS zcl_d400_00_04data DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES ty_demo_02 TYPE p LENGTH 6 DECIMALS 4.
    INTERFACES if_oo_adt_classrun .
    METHODS ausgabe.
  PROTECTED SECTION.
    DATA mv_demo_01 TYPE string VALUE 'ABCDEF'.
  PRIVATE SECTION.
    DATA mv_demo_02 TYPE string VALUE 'ABCDEF'.
ENDCLASS.



CLASS zcl_d400_00_04data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.


    DATA lv_value1 TYPE string.
    DATA lv_value2 TYPE i.


    lv_value1 = '1234567890'.

    lv_value2 = lv_value1.

    DATA lv_demo_16 TYPE c LENGTH 10 VALUE '1234567890'.
    DATA lv_demo_17 TYPE c LENGTH 4.


    lv_demo_17 = lv_demo_16.

    out->write( lv_demo_17  ).



**********************************************
    DATA gv_counter TYPE i.

    DO 5 TIMES.

      gv_counter = gv_counter + 1.
      out->write( gv_counter ).
    ENDDO.





    DATA ls_demo_01 TYPE /dmo/carrier.
    TYPES ty_demo_01 TYPE p LENGTH 10 DECIMALS 2.
    DATA lv_demo_14 TYPE ty_demo_01.

    DATA lv_demo_15 TYPE p.

    mv_demo_01 = 'Demo-01'.

    lv_demo_14 = '123.45-'.
    lv_demo_14 = -123.
    lv_demo_14 = '123.12-'.
    lv_demo_14 = `123.12-`.


    "S4D400 Seite 56
    DATA(lv_demo_18) = `Demo-01`.
    DATA(lv_demo_19) = 123.
    DATA(lv_demo_20) = lv_demo_14.



    "S4D400 Seite 52

    DATA lv_airport TYPE /dmo/airport_id.
    DATA ls_carrier TYPE /dmo/carrier.


    lv_airport = 'FRA'.


    "S4D400 Seite 47
    " -1-
    DATA lv_demo_03 TYPE string VALUE 'ABCDEF1234'.
    DATA lv_demo_04 TYPE string VALUE 'ABCDEF1234'.
    DATA lv_demo_05 TYPE string VALUE 'ABCDEF1234'.
    DATA lv_demo_06 TYPE string VALUE 'ABCDEF1234'.
    DATA lv_demo_07 TYPE string VALUE 'ABCDEF1234'.
    DATA lv_demo_08 TYPE string VALUE 'ABCDEF1234'.
    DATA lv_demo_09 TYPE string VALUE 'ABCDEF1234'.
    DATA lv_demo_10 TYPE string VALUE 'ABCDEF1234'.
    DATA lv_demo_11 TYPE string.
    DATA lv_demo_12 TYPE i.
    DATA lv_demo_13 TYPE p.

    " -2-
    CONSTANTS lc_demo_01 TYPE i VALUE 100.


    " -3-
    lv_demo_11 = 'ABCDEF'.  "Textliteral
    lv_demo_11 = `ABCDEF`.  "Stringliteral
    lv_demo_12 = 3000.      "Zahlliteral


    out->write( 200 ).




**********************************************************
*Ausnahme mit expliziter Deklaration
    DATA lo_excp TYPE REF TO cx_root. "ROOT Klasse
    DATA lv_demo_01 TYPE i VALUE 100.
    DATA lv_demo_02 TYPE string VALUE 'A3000'.

    TRY.
*       lv_demo_01 = lv_demo_02 .          "Variante 1
        lv_demo_01 = CONV i( lv_demo_02 ). "Variante 2

      CATCH cx_root INTO lo_excp.
        out->write( lo_excp->get_text(  )  ).

    ENDTRY.


    out->write( lv_demo_01 ).

**********************************************************
*      S4D400 Seite 56
*Ausnahme mit Inline Deklaration
    TRY.
*       lv_demo_01 = lv_demo_02 .          "Variante 1
        lv_demo_01 = CONV i( lv_demo_02 ). "Variante 2

      CATCH cx_root INTO DATA(lo_exp).
        out->write( lo_excp->get_text(  )  ).

    ENDTRY.


    out->write( lv_demo_01 ).









  ENDMETHOD.
  METHOD ausgabe.
    mv_demo_01 = 'Demo-02'.

  ENDMETHOD.

ENDCLASS.
