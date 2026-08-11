CLASS zcl_d400_00_14class_1 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_14class_1 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lo_house TYPE REF TO lcl_house.
    DATA lo_house1 TYPE REF TO lcl_house.
    DATA lt_collection TYPE TABLE OF REF TO lcl_house.



    lo_house = NEW #( ).              "Ausdruck
    lo_house = NEW lcl_house( ).      "Ausdruck

    CREATE OBJECT lo_house.    "Anweisung
    lo_house->set_data(
      iv_id    =  101
      iv_color = 'rot' ).
    APPEND lo_house TO lt_collection.

    CREATE OBJECT lo_house.
    lo_house1 = lo_house.

    lo_house->set_data(
      iv_id    =  102
      iv_color = 'blau' ).
    APPEND lo_house TO lt_collection.


    CREATE OBJECT lo_house.
    lo_house->set_data(
      iv_id    =  103
      iv_color = 'grün' ).
    APPEND lo_house TO lt_collection.

    CREATE OBJECT lo_house.
    lo_house->set_data(
      iv_id    =  104
      iv_color = 'blau' ).
    APPEND lo_house TO lt_collection.

    CLEAR lo_house.


    LOOP AT lt_collection INTO lo_house WHERE table_line->mv_color = 'blau'.
*    LOOP AT lt_collection INTO lo_house WHERE table_line->mv_id = 102.
      lo_house->get_data( out =  out ).
    ENDLOOP.





    DATA(lv_counter) = lines( lt_collection  ).

    out->write( 'Anzahl der Häuser: ' && lcl_house=>get_counter( ) ).   "Variante 1
*    out->write( 'Anzahl der Häuser: ' && lv_counter ).                 "Variante 2



    data(lo_me) = lo_house->get_result( ).





***************************************************************************
    DATA lv_string1 TYPE string VALUE '12345'.
    DATA lv_string2 TYPE string VALUE '6789'.

    DATA(lv_result) = lv_string1 && lv_string2.  "Ok   -> Variablen und Literale
    lv_result = '12345' & '67890'.               "Ok   ->Nur Literale
    lv_result = `12345` & `67890`.               "Ok   ->Nur Literale


    DATA lo_demo_01 TYPE REF TO lcl_demo_01.

    CREATE OBJECT lo_demo_01.

    lo_demo_01->mv_demo_01 = 100.


****************************************************************************
    DATA(lo_compute) = NEW lcl_compute( ).

    lo_compute->summe(
      EXPORTING
        iv_value1 =   100
        iv_value2 =   200
      IMPORTING
        ev_result = DATA(lv_result1) ).

    out->write( |Summe:  { lv_result1 NUMBER = ENVIRONMENT  }    |  ).




  ENDMETHOD.

ENDCLASS.
