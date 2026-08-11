CLASS zcl_d400_00_11itab1 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_11itab1 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.


    DATA gt_flights TYPE zcarrier_00.

    DATA BEGIN OF gs_demo_01.
    DATA col1 TYPE i.
    DATA col2 TYPE REF TO zcl_d400_00_02data_definition.
    DATA END OF gs_demo_01.

    DATA gt_cols LIKE TABLE OF gs_demo_01.
    DATA gt_cols1 TYPE TABLE OF i.

    DATA gt_collection TYPE TABLE OF REF TO zcl_d400_00_02data_definition.



    DATA gt_flight TYPE TABLE OF /dmo/flight.




*S4D400 Seite 86
    TYPES lt_ty_demo1 TYPE TABLE OF p.            "Variante 1.
    DATA lt_demo_02 TYPE lt_ty_demo1.

    DATA lt_carrier TYPE zcarrier_00.             "Variante 2.
    DATA banane TYPE zdemo_00.                    "Struktur

    DATA lt_carrier1 TYPE TABLE OF /dmo/carrier.  "Variante 3
    DATA lt_carrier2 TYPE STANDARD TABLE OF /dmo/carrier WITH NON-UNIQUE KEY carrier_id.
DATA a.
a = a.
********************************************************
    DATA lv_number TYPE i VALUE 100.
    DATA lt_numbers TYPE TABLE OF i INITIAL SIZE 100.
    DATA lt_demo_01 TYPE TABLE OF string.
    DATA lt_collection TYPE TABLE OF REF TO zcl_d400_00_01first_class.
    DATA lt_collection1 TYPE TABLE OF REF TO object.

    DATA lt_carrier11 TYPE TABLE OF /dmo/carrier.
*    DATA lt_carrier TYPE TABLE OF any.  "Fehler


    lv_number = 1000.
    APPEND lv_number TO lt_numbers.
    lv_number = 2000.
    APPEND lv_number TO lt_numbers.
    lv_number = 3000.
    APPEND lv_number TO lt_numbers.
    lv_number = 4000.
    APPEND lv_number TO lt_numbers.
    lv_number = 5000.
    APPEND lv_number TO lt_numbers.
    lv_number = 6000.
    APPEND lv_number TO lt_numbers.
    APPEND lv_number * lv_number TO lt_numbers.

    LOOP AT lt_numbers INTO lv_number.
      out->write( | { lv_number NUMBER = ENVIRONMENT } | ).

    ENDLOOP.




***************************************************
    APPEND 100 TO lt_demo_01.
    APPEND 'ABCD' TO lt_demo_01.
    APPEND `DEF` TO lt_demo_01.
    lv_number = 100.
    CLEAR lt_demo_01.



  ENDMETHOD.

ENDCLASS.
