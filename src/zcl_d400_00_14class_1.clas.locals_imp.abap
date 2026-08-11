
CLASS lcl_house DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS set_data IMPORTING iv_id    TYPE i
                               iv_color TYPE string.

    METHODS get_data IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    CLASS-METHODS get_counter RETURNING VALUE(rv_counter) TYPE i.
    DATA mv_color TYPE string READ-ONLY.


    METHODS get_result RETURNING VALUE(ro_me) TYPE REF TO lcl_house.


    METHODS birne.


    DATA demo_01 TYPE i VALUE 100.



  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA mv_id TYPE i.
    CLASS-DATA gv_counter TYPE i.



ENDCLASS.

CLASS lcl_house IMPLEMENTATION.


  METHOD set_data.
    data lv_result type i.
    DATA demo_01 TYPE i.
    demo_01 = 200.
        "300       "200       "100
      lv_result = demo_01 + me->demo_01.


    mv_id = iv_id.
    mv_color = iv_color.
    gv_counter += 1.
  ENDMETHOD.

  METHOD get_data.
   DATA demo_01 TYPE i.
    out->write(
      EXPORTING
        data   = |Hausnummer: { mv_id } Farbe: { mv_color }   |
        name   = 'Haus' ).
  ENDMETHOD.

  METHOD get_counter.
    rv_counter = gv_counter.
  ENDMETHOD.

  METHOD get_result.
    ro_me = me.
  ENDMETHOD.

  METHOD birne.

  ENDMETHOD.

ENDCLASS.



CLASS lcl_compute DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS summe IMPORTING iv_value1 TYPE i
                            iv_value2 TYPE i
                  EXPORTING ev_result TYPE i.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_compute IMPLEMENTATION.

  METHOD summe.
    ev_result = iv_value1 + iv_value2.
  ENDMETHOD.

ENDCLASS.






















CLASS lcl_demo_01 DEFINITION.
  PUBLIC  SECTION.
    DATA mv_demo_01 TYPE i.
    METHODS banane IMPORTING iv_value1 TYPE i
                             iv_value2 TYPE i
                   EXPORTING ev_result TYPE i.
ENDCLASS.

CLASS lcl_demo_01 IMPLEMENTATION.

  METHOD banane.

  ENDMETHOD.

ENDCLASS.




